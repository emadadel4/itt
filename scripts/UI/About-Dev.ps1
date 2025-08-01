function About {
    $aboutPopup = $itt['window'].FindName('AboutPopup')
    $aboutPopup.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $aboutPopup.FindName("telegram").Add_MouseLeftButtonDown({ Start-Process("https://t.me/emadadel4") })
    $aboutPopup.FindName("github").Add_MouseLeftButtonDown({ Start-Process("https://github.com/emadadel4/itt") })
    $aboutPopup.FindName("blog").Add_MouseLeftButtonDown({ Start-Process("https://emadadel4.github.io") })
    $aboutPopup.IsOpen = $true
}
