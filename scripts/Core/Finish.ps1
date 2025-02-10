function Finish {
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        This function iterates through the items in a specified ListView, unchecks any CheckBox controls within it, and clears the ListView. After clearing the ListView, it uses the `Notify` function to display a notification with a given title, message, and icon.
        .PARAMETER ListView
        The name of the ListView control within the `$itt` object that needs to be processed. This parameter is required.
        .PARAMETER title
        The title for the notification message. Defaults to "ITT Emad Adel" if not specified.
        .PARAMETER msg
        The message content for the notification. Defaults to "Installed successfully" if not specified.
        .PARAMETER icon
        The icon to be used in the notification. Defaults to "Info" if not specified.
        .EXAMPLE
        Finish -ListView "myListView" -title "Process Completed" -msg "All items have been processed" -icon "Success"
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
        .NOTES
        - Ensure that the `Notify` function is implemented and available in your script to handle notification display.
        - The function assumes the `$itt` object and its `ListView` are properly initialized and accessible.
        - The notification duration is set to 30 seconds (`30000` milliseconds).
    #>
    param (
       [string]$ListView,
       [string]$title = "ITT Emad Adel",
       [string]$icon = "Info"
    )
    switch($ListView)
    {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Install" -TextIcon "installIcon" -Icon "  " -Width "140"
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
            Add-Log -Message "Done." -Level "Apply"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }
    $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "None" -value 0.01 -icon "done" })
    # Clear 
    $itt.$ListView.Dispatcher.Invoke([Action]{
        foreach ($item in $itt.$ListView.Items)
        {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            $innerChild.IsChecked = $false
                            $itt.$ListView.Clear()
                            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
                            $collectionView.Filter = $null
                        }
                    }
                }
            }
        }
    })
}
function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                # Ensure item structure is valid
                if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
                    return $false
                }

                # Check if item is selected
                return $item.Children[0].Children[0].IsChecked -eq $true
            }
        }
        Default {
            # Clear filter instead of removing all items
            $collectionView.Filter = $null

            # Reset selection to the first item (if available)
            $listView = $itt['window'].FindName($itt.CurrentList)
            if ($listView.Items.Count -gt 0) {
                $listView.SelectedIndex = 0
            }
        }
    }

    # Refresh the collection view
    $collectionView.Refresh()
}

function Clear-Item {
    param (
        $ListView
    )

    # Invoke the operation on the UI thread to ensure thread safety
    $itt.$ListView.Dispatcher.Invoke({
        
        # Loop through each item in the ListView
        foreach ($item in $itt.$ListView.Items) {

            # Ensure the item structure is valid before accessing properties
            if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                
                # Uncheck the checkbox in the first child element
                $item.Children[0].Children[0].IsChecked = $false
            }
        }

        # Clear all items from the ListView
        $itt.$ListView.Clear()

        # Reset the filter to show all items
        [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null

        # Reset selection to the first item (if available)
        $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
    })
}