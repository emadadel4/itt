function ChangeTap {

    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.
        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface.
    #>

    $tabSettings = @{
            'apps'        = @{ 
            'installBtn' = 'Visible';
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'AppsListView'; 
            'searchInput' = 'Visible';
            'CurrentCategory' = 'AppsCategory' 
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'TweaksListView'; 
            'searchInput' = 'Visible';
            'CurrentCategory' = 'TwaeksCategory'
        }
        'SettingsTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'searchInput' = 'Collapsed';
            'CurrentList' = 'SettingsList'
        }
        'WhatsNewTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'searchInput' = 'Collapsed';
            'hotdot' =  [System.Windows.Visibility]::Hidden;
        }
    }
    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {

        if ($itt['window'].FindName($tab).IsSelected) {
            
            $settings = $tabSettings[$tab]

            # Update button visibility and currentList based on the selected tab
            $itt.CurrentList = $settings['CurrentList']
            $itt.CurrentCategory = $settings['CurrentCategory']
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            $itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
            $itt['window'].FindName('searchInput').Visibility = $settings['searchInput']

            if ($settings.ContainsKey('hotdot') -and $itt['window'].FindName('hotdot')) {
                $itt['window'].FindName('hotdot').Visibility = $settings['hotdot']
            }
            break
        }
    }
}