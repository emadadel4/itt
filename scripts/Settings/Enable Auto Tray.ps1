function Invoke-EnableAutoTray {

    Param(
        $Enabled, 
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer",
        [string]$name = "EnableAutoTray"
    )
        Try{
            if ($Enabled -eq $false){
                Add-Log -Message "Enabling all tray icons..." -Level "info"
                Set-ItemProperty -Path $Path -Name $name -Value 0 -ErrorAction Stop
            }
            else {
                Add-Log -Message "Disabling auto tray icons..." -Level "info"
                Remove-ItemProperty -Path $Path -Name $name -ErrorAction Stop
            }

            Refresh-Explorer
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}