function Search {


    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).ItemsSource)

    $collectionView.Filter = {
        param ($item)


        return $item.Name -match $filter -or $item.Category -match $filter
    }

    $collectionView.Refresh()
}
function FilterByCat {

    param ($Cat)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).ItemsSource)

    if ($Cat -eq "All" -or [string]::IsNullOrWhiteSpace($Cat)) {

        $collectionView.Filter = $null
    }
    else {
        $collectionView.Filter = {
            param ($item)

            return $item.Category -ieq $Cat
        }
    }

    $collectionView.Refresh()
}