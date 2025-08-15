function Get-SelectedItems {
    param ([ValidateSet("Apps","Tweaks")] [string]$Mode)

    $listView = if ($Mode -eq "Apps") { $itt.AppsListView } else { $itt.TweaksListView }
    $props    = if ($Mode -eq "Apps") { 'Content','Choco','Scoop','Winget','ITT' } else { 'Name','Script' }

    $selected = foreach ($item in $listView.Items) {
        if ($item.IsChecked) {
            $obj = @{}
            foreach ($p in $props) { $obj[$p] = $item.$p }
            $obj
        }
    }

    return $selected
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