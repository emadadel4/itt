function ExecuteCommand {

    <#
        .SYNOPSIS
        Executes a PowerShell command in a new process.
    #>

    param ($tweak)

    while ($true) {
        try {
            Add-Log -Message "Please wait..."
            $script = [scriptblock]::Create($tweak)
            Invoke-Command $script -ErrorAction Stop
            break
        }
        catch {
            Write-Host "Unstable internet connection or error detected. Retrying in 5 seconds..." -ForegroundColor Yellow
            Start-Sleep 5
        }
    }
}