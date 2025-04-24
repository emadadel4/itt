function Search {
    
    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''

    $listView = $itt["window"].FindName("appslist")
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($listView.Items)
 
    $collectionView.Filter = {
        param ($item)

        if ($item.Items.Count -lt 1 -or $item.Items.Count -lt 1) {
            return $false
        }

        return $item.Items.Content -match $filter
    }
}
