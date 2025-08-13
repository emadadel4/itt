function ITT-ScriptBlock {

    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.
    #>
    
    param(
        [scriptblock]$ScriptBlock,
        [array]$ArgumentList,
        $Debug
    )

    # Create a new PowerShell instance
    $script:powershell = [powershell]::Create()

    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)
    $script:powershell.AddArgument($ArgumentList)
    $script:powershell.AddArgument($Debug)
    $script:powershell.RunspacePool = $itt.runspace

    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()

    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)
        $script:powershell.Dispose()
        $itt.runspace.Dispose()
        $itt.runspace.Close()
        [System.GC]::Collect()
    }

    return $handle
}