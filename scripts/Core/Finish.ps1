function Finish {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
    #>

    param (
        [string]$ListView,
        [string]$title = "ITT Emad Adel",
        [string]$icon = "Info"
    )

    switch ($ListView) {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -Content "Install" -Width "140"
            Notify -title "$title" -msg "All installations have finished" -icon "Info" -time 30000
            Add-Log -Message "`n::::All installations have finished::::"
            Set-Statusbar -Text "📢 All installations have finished"
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
            Add-Log -Message "`n::::All tweaks have finished::::"
            Set-Statusbar -Text "📢 All tweaks have finished"
            Notify -title "$title" -msg "All tweaks have finished" -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "logo" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action] {

        # Uncheck all items
        foreach ($item in $itt.$ListView.Items) {$item.IsChecked = $false}
        
        # Clear the list view selection and reset the filter
        $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
        $collectionView.Filter = $null
        $collectionView.Refresh()

    })
}