function Finish {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        Clears all checkboxes in the ListView specified and displays a notification with relevant messages.
    #>

    param (
        [string]$ListView,
        [string]$title = "ITT Emad Adel",
        [string]$icon = "Info"
    )

    $listView = $itt.$ListView

    switch ($ListView) {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Install" -TextIcon "installIcon" -Icon "  " -Width "140"
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon $icon -time 30000
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
            Add-Log -Message "Done." -Level "Apply"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon $icon -time 30000
        }
    }

    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    $listView.Dispatcher.Invoke([Action] {
            # الحصول على CollectionView للبيانات المربوطة
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($listView.ItemsSource)

            # إلغاء تحديد جميع العناصر
            foreach ($item in $listView.ItemsSource) {
                if ($null -ne $item.IsChecked) {
                    $item.IsChecked = $false
                }
            }

            Write-Host $global:CheckedItems

            $collectionView.Filter = $null
            $collectionView.Refresh()
        })
}

function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )

    $listView = $itt.$ListView

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($listView.ItemsSource)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                if ($null -eq $item.IsChecked) {
                    return $false
                }

                return $item.IsChecked -eq $true
            }
        }
        Default {
            $collectionView.Filter = $null

            $listView.Dispatcher.Invoke({
                    foreach ($item in $listView.ItemsSource) {
                        if ($null -ne $item.IsChecked) {
                            $item.IsChecked = $false
                        }
                    }
                })

            $collectionView.Refresh()

            if ($listView.Items.Count -gt 0) {
                $listView.SelectedIndex = 0
                $listView.ScrollIntoView($listView.Items[0])
            }
        }
    }

    $collectionView.Refresh()
}
