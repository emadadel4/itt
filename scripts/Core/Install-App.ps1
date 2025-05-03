function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.
        .EXAMPLE
        Install-App -Name "Google Chrome" -Choco "googlechrome" -Winget "Google.Chrome"
    #>

    param ([string]$Source,[string]$Name,[string]$Choco,[string]$Winget,[string]$ITT,[string]$Scoop)

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param ([string]$Installer,[string]$InstallArgs)

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log {

        param ([string]$Installer,[string]$Source)

        if ($Installer -ne 0) {
            Add-Log -Message "Installation Failed for ($Name). Report the issue in ITT repository." -Level "$Source"
            return $false
        }
        else {
            Add-Log -Message "Successfully Installed ($Name)" -Level "$Source"
            return $true
        }
    }

    # Common Winget Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
    $ittArgs = "install $ITT -y"

    # TODO: Only Downloading with user prefences 
    if($Source -ne "default"){

        Write-Host "TESTING..."
        return
    }

    # TODO: If Chocolatey is 'none', use Winget
    if ($Choco -eq "na" -and $Winget -eq "na" -and $Scoop -eq "na" -and $ITT -ne "na") {

        Install-Dependencies -PKGMan "itt"
        Add-Log -Message "Attempting to install $Name." -Level "ITT"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log $ITTResult "itt"
    }
    else 
    {
        # TODO: if choco is 'none' and winget is not 'none', use winget
        if ($Choco -eq "na" -and $Winget -ne "na") 
        {
            Install-Dependencies -PKGMan "winget"
            Add-Log -Message "Attempting to install $Name." -Level "Winget"
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not 'none' and winget is not 'none', use choco first and fallback to winget
            if ($Choco -ne "na" -or $Winget -ne "na") 
            {
                Install-Dependencies -PKGMan "choco"
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"
                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {
                    Install-Dependencies -PKGMan "winget"
                    Add-Log -Message "installation failed, Falling back to Winget." -Level "Chocolatey"
                    Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
                    Log $wingetResult "Winget"
                }else {
                    Log $chocoResult "Chocolatey"
                }
            }else {
                Add-Log -Message "Package not found in any package manager" -Level "ERROR"
            }
        }
    }
}