function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.

        .DESCRIPTION
        The Install-App function automates the installation of applications using Chocolatey and Winget. 
        It first attempts to install the application with Chocolatey if provided. If Chocolatey is not 
        available or fails, it falls back to Winget for installation. The function also logs the 
        installation attempts, successes, and failures.

        .EXAMPLE
        Install-App -Name "Google Chrome" -Choco "googlechrome" -Winget "Google.Chrome"
    #>

    param (
        [string]$Name,
        [string]$Choco,
        [string]$Winget,
        [string]$ITT
    )

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param (
            [string]$Installer,
            [string]$InstallArgs
        )

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log-Result {
        param (
            [string]$Installer,
            [string]$Source
        )

        if ($Installer -ne 0) {
            Add-Log -Message "$Source Installation Failed for ($Name). Please report the issue in the ITT repository." -Level "ERROR"
        }
        else {
            Add-Log -Message "Successfully Installed ($Name) Using $Source." -Level "Installed"
        }
    }

    # Common Winget Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $ittArgs = "install $ITT -y"


    # If Chocolatey is 'none', use Winget
    if ($Choco -eq "none" -and $Winget -eq "none" -and $itt -ne "none") {

        Install-ITTPM
        Add-Log -Message "Attempting to install $Name using ITT." -Level "INFO"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log-Result $ITTResult "itt"

    }
    else 
    {
        if ($Choco -eq "none" -and $Winget -ne "none") 
        {
            Install-Winget
            Add-Log -Message "Attempting to install $Name using Winget." -Level "INFO"
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log-Result $wingetResult "Winget"
        }
        else 
        {
            if ($Choco -ne "none" -or $Winget -ne "none") 
            {
                Install-Choco
                Add-Log -Message "Attempting to install $Name using Chocolatey." -Level "INFO"
                $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {
                    Install-Winget
                    Add-Log -Message "Chocolatey installation failed, Falling back to Winget." -Level "ERROR"
                    Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
                    Log-Result $wingetResult "Winget"
                }else {
                    Log-Result $chocoResult "Chocolatey"
                }
            }else {
                Add-Log -Message "No Package Manager" -Level "ERROR"
            }
        }
    }
}