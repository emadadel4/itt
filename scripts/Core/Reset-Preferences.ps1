function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.
    #>

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value 0 -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value 0 -Force
    SwitchToSystem
    System-Default
    Message -key "Reopen_itt_again" -icon "Information" -action "OK"
}
