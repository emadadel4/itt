function Show-Event {

    #{title}
    #{contorlshandler}

    $storedDate = [datetime]::ParseExact($itt['window'].FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate

    if ($daysElapsed.Days -lt 1) 
    {
        $itt['window'].FindName('hotdot').Visibility = [System.Windows.Visibility]::Visible
    } 
}