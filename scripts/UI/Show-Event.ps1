function Show-Event {

    $itt['window'].FindName('DisablePopup').add_MouseLeftButtonDown({
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
        $popup.IsOpen = $false
    })

    #{title}
    #{contorlshandler}

    $storedDate = [datetime]::ParseExact($itt['window'].FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate

    if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) { return }

    if ($daysElapsed.Days -lt 1) {
        $itt['window'].FindName('DisablePopup').Visibility = 'Hidden'
    }

    $popup.IsOpen = $true
}
