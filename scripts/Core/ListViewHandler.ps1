function Show-Selected {
    
    param (
        [string]$ListView,
        [string]$mode
    )

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.ItemsSource)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                # Check if item is selected
                return $item.IsChecked -eq $true
            }
        }
        Default {

            $collectionView.Filter = {
                param ($item)

                # Uncheck all checkboxes
                $item.IsChecked = $false
            }

            # Reset collection view
            $collectionView.Filter = $null
        }
    }
}
function Finalize {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
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
            Add-Log -Message "::::All installations have finished::::"
            Set-Statusbar -Text "📢 All installations have finished"
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
            Add-Log -Message "::::All tweaks have finished::::"
            Set-Statusbar -Text "📢 All tweaks have finished"
            Notify -title "$title" -msg "All tweaks have finished" -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action] {
            # Uncheck all items
            foreach ($item in $itt.$ListView.Items) {
                $item.IsChecked = $false
            }
            
            # Clear the list view selection and reset the filter
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
            $collectionView.Filter = $null
            $collectionView.Refresh()
        })
}

function Search {


    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).ItemsSource)

    $collectionView.Filter = {
        param ($item)


        return $item.Name -match $filter -or $item.Category -match $filter
    }

    $collectionView.Refresh()
}
function FilterByCat {

    param ($Cat)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).ItemsSource)

    if ($Cat -eq "All" -or [string]::IsNullOrWhiteSpace($Cat)) {

        $collectionView.Filter = $null
    }
    else {
        $collectionView.Filter = {
            param ($item)

            return $item.Category -ieq $Cat
        }
    }

    $collectionView.Refresh()
}