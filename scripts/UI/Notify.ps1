function Notify {
    param([string]$title, [string]$msg, [string]$icon, [int]$time)
    $n = New-Object System.Windows.Forms.NotifyIcon -Property @{ 
        Icon = [System.Drawing.SystemIcons]::Information
        BalloonTipIcon = $icon; BalloonTipText = $msg; BalloonTipTitle = $title; Visible = $true 
    }
    $n.ShowBalloonTip($time); $n.Dispose()
}