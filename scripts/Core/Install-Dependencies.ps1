function Install-ITT-A-Choco {

    # Installing Choco package manager if not exist
    if (-not (Get-Command choco -ErrorAction SilentlyContinue))
    {
        Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
    }

    # Installing ITT Package manager if not exist
    if (-not (Get-Command itt -ErrorAction SilentlyContinue))
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itt-co/bin/refs/heads/main/install.ps1')) *> $null
    }else{

        try {
            
            $currentVersion = "0.1.0.0" 
            $installerPath = "$env:TEMP\installer.msi"
            $installerUrl = "https://github.com/itt-co/bin/releases/latest/download/installer.msi"
            $latestReleaseApi = "https://api.github.com/repos/itt-co/bin/releases/latest"
            $latestVersion = (Invoke-RestMethod -Uri $latestReleaseApi).tag_name

            if ($latestVersion -eq $currentVersion) {return}

            Write-Host "New version available: $latestVersion. Updating..."
            Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
            Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /qn" -NoNewWindow -Wait
            Write-Host "Updated to version $latestVersion successfully."
            Remove-Item -Path $installerPath -Force
        }
        catch {
            Add-Log -Message "Failed to update ITT Package manager." -Level "error"
        }
    }
}