function ChangeTap() {
    
    if($window.FindName('apps').IsSelected)
    {
        $window.FindName('installBtn').Visibility = "Visible"
        $window.FindName('applyBtn').Visibility = "Hidden"
        $Window.FindName('description').Text =  ""
        $Window.FindName('itemLink').Visibility = "Visible"
    }

    if($window.FindName('tweeks').IsSelected)
    {
        $window.FindName('applyBtn').Visibility = "Visible"
        $window.FindName('installBtn').Visibility = "Hidden"
        $Window.FindName('itemLink').Visibility = "Hidden"
    }
}

#===========================================================================
# End functions
#===========================================================================