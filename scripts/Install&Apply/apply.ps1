function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
    #>

    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Return if there is no selection
    if ($selectedTweaks.Count -le 0) {return}

    Show-Selected -ListView "TweaksListView" -Mode "Filter"

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

    if ($result -eq "no") {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks, $debug)

        if((Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup -eq 0){CreateRestorePoint} 
        
        $itt.ProcessRunning = $true

        UpdateUI -Button "ApplyBtn" -Content "Applying" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        Add-Log -Message "::::$($selectedTweaks.Name)::::" -Level "default"

        if ($selectedTweaks.Script -and $selectedTweaks.Script.Count -gt 0) {
            ExecuteCommand -tweak $selectedTweaks.Script
            if ($selectedTweaks.Refresh -eq $true) {
                Refresh-Explorer
            }
        } 
        if ($selectedTweaks.Registry -and $selectedTweaks.Registry.Count -gt 0) {
            Set-Registry -tweak $selectedTweaks.Registry
            if ($selectedTweaks.Refresh -eq $true) {
                Refresh-Explorer
            }
        } 
        if ($selectedTweaks.AppxPackage -and $selectedTweaks.AppxPackage.Count -gt 0) {
            Uninstall-AppxPackage -tweak $selectedTweaks.AppxPackage
            if ($selectedTweaks.Refresh -eq $true) {
                Refresh-Explorer
            }
        } 
        if ($selectedTweaks.ScheduledTask -and $selectedTweaks.ScheduledTask.Count -gt 0) {
            Remove-ScheduledTasks -tweak $selectedTweaks.ScheduledTask
            if ($selectedTweaks.Refresh -eq $true) {
                Refresh-Explorer
            }
        } 
        if ($selectedTweaks.Services -and $selectedTweaks.Services.Count -gt 0) {
            Disable-Service -tweak $selectedTweaks.Services
            if ($selectedTweaks.Refresh -eq $true) {
                Refresh-Explorer
            }
        } 

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}