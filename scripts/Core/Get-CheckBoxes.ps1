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
                
                $checkbox = $item.Children[0].Children[0]
        
                $tags = $item.Children[0].Children[0].Tag -split "\|"

                if ($checkbox.IsChecked) {

                    $Apps += @{
                        Name    = $checkbox.Content
                        Choco   = $tags[0]
                        Scoop   = $tags[1]
                        Winget  = $tags[2]
                        ITT     = $tags[3]
                    }
                }
            }

            return $Apps
        }
        "Tweaks" {

            $Tweaks = @()  

            foreach ($item in $itt.TweaksListView.Items) {
                
                $checkbox = $item.Children[0].Children[0]
                
                $tags = $item.Children[0].Children[0].Tag

        
                if ($checkbox.IsChecked) {

                    $Tweaks += @{
                        Name    = $checkbox.Content
                        Script   = $tags
                    }
                }
            }

            return $Tweaks
        }
    }
}