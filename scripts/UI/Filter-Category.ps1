function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)

    $collectionView.Filter = {
        param ($item)

        # Ensure item structure is valid
        if ($item.Count -lt 1) {
            return $false
        }

        # Search within first-level child content
        return $item.Content -match $filter -or $item.Category -match $filter
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

            $tags = $item.Category

            return $tags -ieq $Cat
        }
    }

    $collectionView.Refresh()
}