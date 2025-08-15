function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
    #>

    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

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

        $itt.ProcessRunning = $true

        if((Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup -eq 0){
            UpdateUI -Button "ApplyBtn" -NonKey "Please Wait..." -Width "auto"
            Set-Statusbar -Text "ℹ Current task: Creating Restore Point..."
            CreateRestorePoint
        } 

        UpdateUI -Button "ApplyBtn" -Content "Applying" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {
            Add-Log -Message "::::$($tweak.Content)::::" -Level "default"
            ExecuteCommand -tweak $tweak.Script
        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}