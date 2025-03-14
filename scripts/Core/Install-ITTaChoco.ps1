function Install-ITTaChoco {

    <#
    .SYNOPSIS
        Install ITT Package manager and Chocolatey.
        Check for update for ITT.
    #>

    if (-not (Get-Command choco -ErrorAction SilentlyContinue)){
        Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
    }
    
    if (-not (Get-Command itt -ErrorAction SilentlyContinue)){
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itt-co/bin/refs/heads/main/install.ps1')) *> $null
    }
    else 
    {
        
        $CurrentVersion = "0.1.0.0"
        $RepoUrl = "https://api.github.com/repos/itt-co/bin/releases/latest"
        $DownloadUrl = "https://github.com/itt-co/bin/releases/latest/download/installer.msi"
        $InstallerPath = "$env:temp\installer.msi"

        try {
            # Write-Host "Current version: $CurrentVersion"
            $response = Invoke-RestMethod -Uri $RepoUrl -Headers @{ "User-Agent" = "itt-updater" }
            $latestVersion = $response.tag_name

            if ($latestVersion -ne $CurrentVersion)
            {
                # Download the latest installer
                Add-Log -Message "Updating ITT..." -Level "info"
                Invoke-WebRequest -Uri $DownloadUrl -OutFile $InstallerPath

                # Install the update
                Add-Log -Message "Installing update..." -Level "info"
                Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$InstallerPath`" /q" -NoNewWindow -Wait
                Add-Log -Message "Update installed successfully!" -Level "info"

                # Cleanup
                Remove-Item $InstallerPath -Force
            }
        }
        catch {
            Add-Log -Message "Update check failed: $_" -Level "error"
        }
    }
}