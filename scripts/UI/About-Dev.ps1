function About {
    $aboutPopup = $itt['window'].FindName('AboutPopup')
    $aboutPopup.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $aboutPopup.IsOpen = $true
}