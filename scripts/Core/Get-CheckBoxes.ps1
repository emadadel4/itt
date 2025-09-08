function Get-SelectedItems {
    param ([ValidateSet("AppsListView","TweaksListView")] [string]$Mode)

    $listView = if ($Mode -eq "AppsListView") { $itt.AppsListView } else { $itt.TweaksListView }
    $props    = if ($Mode -eq "AppsListView") { 'Content','Choco','Scoop','Winget','ITT' } else { 'Name','Script' }

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
    param ([string]$ListView, [string]$Mode)

    $view = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

    if ($Mode -eq 'Filter') {
        $view.Filter = { param($i) $i.IsChecked }
    }
    else {
        foreach ($i in $itt.$ListView.Items) { $i.IsChecked = $false }
        $view.Filter = $null
    }
}