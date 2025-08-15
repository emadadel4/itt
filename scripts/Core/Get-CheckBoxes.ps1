function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.
        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.
    #>
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $Apps = @()  

            foreach ($item in $itt.AppsListView.Items) {
                
                if ($item.IsChecked) {

                    $Apps += @{
                        Name    = $item.Content
                        Choco   = $item.Choco
                        Scoop   = $item.Scoop
                        Winget  = $item.Winget
                        ITT     = $item.ITT
                    }
                }
            }

            return $Apps
        }
        "Tweaks" {

            $Tweaks = @()  

            foreach ($item in $itt.TweaksListView.Items) {
        
                if ($item.IsChecked) {

                    $Tweaks += @{
                        Name    = $item.Content
                        Script   = $item.script
                    }
                }
            }

            return $Tweaks
        }
    }
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