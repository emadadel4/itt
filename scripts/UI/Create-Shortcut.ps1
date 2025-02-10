function ITTShortcut {
    $iconPath = "$env:ProgramData\itt\itt.ico"
    Invoke-WebRequest -Uri $itt.icon -OutFile $iconPath
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
    $Shortcut.TargetPath, $Shortcut.Arguments, $Shortcut.IconLocation = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe", "-ExecutionPolicy Bypass -Command ""irm bit.ly/ittea | iex""", $iconPath
    $Shortcut.Save()
}