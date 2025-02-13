function Search {
    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
        .DESCRIPTION
        The `Search` function retrieves the text from the search input, converts it to lowercase, and removes any non-alphanumeric characters. 
        It then applies a filter to the items in the `ItemsSource` of the currently displayed list view based on the search input.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''

    $listView = $itt['window'].FindName($itt.currentList)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($listView.ItemsSource)

    $collectionView.Filter = {
        param ($item)

        if ($null -eq $item.Name) {
            return $false
        }

        return $item.Name -match $filter
    }

    $collectionView.Refresh()
}

function FilterByCat {

    <#
        .SYNOPSIS
        Filters the items in the Apps list view based on the selected category.
        .DESCRIPTION
        The `FilterByCat` function filters the items displayed in the Apps list view based on a specified category.
        It updates the view to show only those items that match the selected category.
        If the selected category is not valid, it clears the filter and displays all items.
        The function also ensures that the Apps tab is selected and scrolls to the top of the list view after applying the filter.
        .EXAMPLE
        FilterByCat -Cat "Media"
    #>

    param ($Cat)

    $validCategories = @(
        "Web Browsers", "Media", "Media Tools", "Documents", "Compression",
        "Communication", "File Sharing", "Imaging", "Gaming", "Utilities",
        "Disk Tools", "Development", "Security", "Portable", "Runtimes",
        "Drivers", "Performance", "Privacy", "Fixer", "Personalization",
        "Power", "Protection", "Classic", "GPU Drivers"
    )

    $listView = $itt['window'].FindName($itt.CurrentList)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($listView.ItemsSource)

    if ($validCategories -contains $Cat) {

        $collectionView.Filter = {
            param ($item)

            if ($null -eq $item.Category) {
                return $false
            }

            return $item.Category -eq $Cat
        }
    }
    else {
        $collectionView.Filter = $null
    }

    $collectionView.Refresh()

    if ($listView.Items.Count -gt 0) {
        $listView.ScrollIntoView($listView.Items[0])
    }
}

function ClearFilter {

    $itt.AppsListView.Clear()
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)
    $collectionView.Filter = $null
}