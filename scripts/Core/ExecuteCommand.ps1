function ExecuteCommand {

    <#
        .SYNOPSIS
        Executes a PowerShell command in a new process.
    #>

    param ($tweak)

    try {
        Add-Log -Message "Please wait..."
        $script = [scriptblock]::Create($tweak)
        Invoke-Command  $script -ErrorAction Stop
    } catch  {
        Add-Log -Message "The specified command was not found." -Level "WARNING"
    }
}