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
        .EXAMPLE
        Get-SelectedItems -Mode "Tweaks"
        Retrieves and returns a list of selected tweaks from the `TweaksListView`.
        .NOTES
        - The function relies on the `$itt` object, which must be initialized and accessible within the scope of the function.
        - The function processes items from the ListView by iterating through nested StackPanel controls and their child CheckBox controls.
        - The resulting items are returned as an array of hashtables, with each hashtable containing details about the selected item based on the mode.
    #>
    param (
        [string]$Mode
    )
    $items = @()
    switch ($Mode) {
        "Apps" {
            $global:CheckedItems | ForEach-Object {
                $Name = $_
                $app = $itt.database.Applications | Where-Object { $_.Name -eq $Name.Content -and $Name.IsChecked }
            
                if ($app) {
                    $items += [PSCustomObject]@{
                        Name    = $app.Name
                        Choco   = $app.Choco
                        Winget  = $app.Winget
                        Default = $app.Default
                    }
                }
            }
        }
        "Tweaks" {
            $itt.TweaksListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $tweak = $itt.database.Tweaks | Where-Object { $_.Name -eq $checkbox.Content }
                                    if ($tweak) {
                                        $items += @{
                                            Name                = $tweak.Name
                                            Registry            = $tweak.Registry
                                            Services            = $tweak.Services
                                            ScheduledTask       = $tweak.ScheduledTask
                                            AppxPackage         = $tweak.AppxPackage
                                            Script              = $tweak.Script
                                            UndoScript          = $tweak.UndoScript
                                            Refresh             = $tweak.Refresh
                                            # Add a new method tweak here
                                        }
                                    }
                                }
                        }
                }
        }
        default {
            Write-Error "Invalid Mode specified. Please choose 'Apps' or 'Tweaks'."
        }
    }
    return $items
}