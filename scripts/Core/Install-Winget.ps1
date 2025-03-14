function Install-Winget {

    if(Get-Command winget -ErrorAction SilentlyContinue) {return}
    $ComputerInfo = Get-ComputerInfo -ErrorAction Stop
    $arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')

    if ($ComputerInfo.WindowsVersion -lt "1809") {
        Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info" 
        return
    }

    try {
        Add-Log -Message "Installing Winget... This might take several minutes" -Level "info"
        Install-ITTaChoco
        Start-Process -FilePath "itt" -ArgumentList "install winget -y" -NoNewWindow -Wait -PassThru
        return
    }
    catch {
        Write-Error "Failed to install $_"
    }
}