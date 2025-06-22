function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.
        .PARAMETER Mode
        Specifies the mode for item retrieval. Options include:
        - `Apps`: Retrieves information about selected applications from the `AppsListView`.
        - `Tweaks`: Retrieves information about selected tweaks from the `TweaksListView`.
        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.
    #>
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $items = @()  

            foreach ($item in $itt.AppsListView.ItemsSource) {
                
                if ($item.IsChecked) {

                    $items += @{
                        Name    = $item.Name
                        Choco   = $item.Choco
                        Scoop   = $item.Scoop
                        Winget  = $item.Winget
                        ITT     = $item.itt
                    }
                }
            }
        }
        "Tweaks" {

            $items = @()  

            foreach ($item in $itt.TweaksListView.ItemsSource) {

                if ($item.IsChecked) {

                    $items += @{

                        Name          = $item.Name
                        Registry      = $item.Registry
                        Services      = $item.Services
                        ScheduledTask = $item.ScheduledTask
                        AppxPackage   = $item.AppxPackage
                        Script        = $item.Script
                        UndoScript    = $item.UndoScript
                        Refresh       = $item.Refresh
                        # Add a new tweak method here
                    }
                }
            }
        }
    }
    return $items
}