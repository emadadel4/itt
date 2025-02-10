function Invoke-Install {
    <#
        .SYNOPSIS
        Handles the installation of selected applications by invoking the appropriate installation methods.
        .DESCRIPTION
        The `Invoke-Install` function manages the process of installing applications based on user selection. It performs the following tasks:
        1. Checks if there are any selected applications to install.
        2. Displays a warning message if no applications are selected or if a process is already running.
        3. Shows a confirmation dialog to the user asking for permission to proceed with the installation.
        4. If confirmed, it filters the list view to show only selected items and starts the installation process.
        5. Updates the UI to reflect the installation status.
        6. Executes installation commands for applications using Chocolatey (`Choco`), Winget, or custom download methods.
        7. Updates the UI once the installation is complete and finishes the process.
    #>

    Write-Host "Checked Items: $($checkedItems -join ', ')"

    
    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"
    
    if($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }
    # Get Selected apps
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    $selectedApps = Get-SelectedItems -Mode "Apps"

    if($selectedApps.Count -gt 0)
    {
        # Show only selected item
        Show-Selected -ListView "AppsListView" -Mode "Filter"
    }
    else
    {
        # Show Message
        Message -key "App_empty_select" -icon "info" -action "OK"
        return
    }

    if($QuickInstall -eq $false)
    {
        $result = Message -key "Install_msg" -icon "ask" -action "YesNo"
    }
    
    if ($result -eq "no") {
        Show-Selected -ListView "AppsListView" -Mode "Default"
        Clear-Item -ListView "AppsListView"
        $global:CheckedItems = @()
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedApps $QuickInstall, $debug -debug $debug -ScriptBlock {

        param($selectedApps ,$QuickInstall ,$debug)

        $itt.ProcessRunning = $true

        UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Downloading" -TextIcon "installIcon" -Icon "  " -Width "auto"

        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        $selectedApps | ForEach-Object {

            if ($_.Winget -ne "none" -or $_.Choco -ne "none")
            {
                # Some packages won't install until the package folder is removed.
                $chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($_.Choco)"
                Remove-Item -Path "$chocoFolder" -Recurse -Force
                Remove-Item -Path "$chocoFolder.install" -Recurse -Force
                Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
                Install-App -Name $_.Name -Winget $_.Winget -Choco $_.Choco
                # debug start
                    if($debug){Add-Log -Message $_.Choco -Level "debug"}
                # debug end
            }
            else
            {
                Native-Downloader `
                -name           $_.name `
                -url            $_.default.url `
                -launcher       $_.default.launcher `
                -portable       $_.default.portable `
                -installArgs    $_.default.args
                # debug start
                    if($debug){Add-Log -Message $_.name $_.default.url -Level "debug"}
                 # debug end
            }
        }
        $global:CheckedItems = @()
        Finish -ListView "AppsListView"
        $itt.ProcessRunning = $false
        $QuickInstall = $false
        
    }
}
function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
        .DESCRIPTION
        The `Invoke-Apply` function manages the process of applying selected tweaks based on user selection. It performs the following tasks:
        1. Retrieves the list of selected tweaks using `Get-SelectedItems` with mode "Tweaks".
        2. Displays a warning message if a process is already running or if no tweaks are selected.
        3. Filters the list view to show only selected items and asks for user confirmation to proceed with applying tweaks.
        4. If confirmed, it starts the application of the selected tweaks.
        5. Executes the appropriate tweak operations based on the type of tweak (e.g., commands, registry modifications, Appx package removal, service management).
        6. Updates the UI to reflect the progress and completion of the tweak application.
        7. Finishes the process and logs a message indicating that some tweaks may require a restart.
    #>

    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0

    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    if ($selectedTweaks.Count -eq 0)
    {
        Message -key "Tweak_empty_select" -icon "info" -action "OK"
        return
    }
    else
    {
        Show-Selected -ListView "TweaksListView" -Mode "Filter"
    }

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

    if ($result -eq "no") 
    {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        Clear-Item -ListView "TweaksListView"
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks,$debug)

        $itt.ProcessRunning = $true

        UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Applying" -TextIcon "applyIcon" -Icon "  " -Width "auto"

        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {
            Add-Log -Message "::::$($tweak.Name)::::" -Level "info"
            $tweak | ForEach-Object {
                if ($_.Script -and $_.Script.Count -gt 0) {
                    ExecuteCommand -tweak $tweak.Script
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.Registry -and $_.Registry.Count -gt 0) {
                  Set-Registry -tweak $tweak.Registry
                  if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.AppxPackage -and $_.AppxPackage.Count -gt 0) {
                    Uninstall-AppxPackage -tweak $tweak.AppxPackage
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.ScheduledTask -and $_.ScheduledTask.Count -gt 0) {
                    Remove-ScheduledTasks -tweak $tweak.ScheduledTask
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.Services -and $_.Services.Count -gt 0) {
                    Disable-Service -tweak $tweak.Services
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
            }
        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}