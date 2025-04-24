function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
    #>
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $items = @()  

            $itt["window"].FindName("appslist").Items.Items | Where-Object { $_.IsChecked } | ForEach-Object {

                $tag = $_.Tag
                $tagParts = $tag -split " \| "
                $choco = $tagParts[0]
                $winget = $tagParts[1]
                $itt = $tagParts[2]

                $items += @{
                    Name    = $_.Content
                    Choco   = $choco
                    Winget  = $winget
                    ITT     = $itt
                    # Add a new download method here
                }
            }
        }
        "Tweaks" {

            $items = @()  

            foreach ($item in $itt.TweaksListView.Items) {
                
                $child = $item.Children[0].Children[0]

                if ($tweaksDict.ContainsKey($child.Content) -and $child.IsChecked) {

                    $items += @{

                        Name          = $tweaksDict[$child.Content].Name
                        Registry      = $tweaksDict[$child.Content].Registry
                        Services      = $tweaksDict[$child.Content].Services
                        ScheduledTask = $tweaksDict[$child.Content].ScheduledTask
                        AppxPackage   = $tweaksDict[$child.Content].AppxPackage
                        Script        = $tweaksDict[$child.Content].Script
                        UndoScript    = $tweaksDict[$child.Content].UndoScript
                        Refresh       = $tweaksDict[$child.Content].Refresh
                        # Add a new tweak method here
                    }
                }
            }
        }
    }
    return $items
}