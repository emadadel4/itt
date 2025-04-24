function Invoke-Install {

    $selectedApps = Get-SelectedItems -Mode "Apps"
    
    Write-Host $selectedApps.Choco
}