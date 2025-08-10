function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)

    $collectionView.Filter = {
        param ($item)

        # Search within first-level child content
        return $item.Content -match $filter -or $item.category -match $filter
    }
}
function FilterByCat {

    param ($Cat)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)

    if ($Cat -eq "All" -or [string]::IsNullOrWhiteSpace($Cat)) {

        $collectionView.Filter = $null
    }
    else {
        $collectionView.Filter = {
            param ($item)

            $tags = $item.category

            return $tags -ieq $Cat
        }
    }

    $collectionView.Refresh()
}