# debug start
param (
    [switch]$Debug
)
# debug end
# Load DLLs
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{
    database       = @{}
    ProcessRunning = $false
    developer      = "Emad Adel"
    lastupdate     = "#{replaceme}"
    github         = "https://github.com/emadadel4/itt"
    telegram       = "https://t.me/emadadel4"
    blog           = "https://emadadel4.github.io"
    youtube        = "https://youtube.com/@emadadel4"
    buymeacoffee   = "https://buymeacoffee.com/emadadel"
    registryPath   = "HKCU:\Software\ITT@emadadel"
    icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
    PublicDatabase = "https://ittools-7d9fe-default-rtdb.firebaseio.com/Count.json"
    Theme          = "default"
    CurretTheme    = "default"
    Date           = (Get-Date -Format "MM/dd/yyy")
    Music          = 100
    PopupWindow    = "0"
    Language       = "default"
    ittDir         = "$env:ProgramData\itt\"
})

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}


# الحصول على RawUI
$rawUI = $Host.UI.RawUI

# تعديل حجم المخزن المؤقت بحيث يتناسب مع حجم النافذة
$bufferSize = $rawUI.BufferSize
$bufferSize.Width = [math]::Max($rawUI.MaxPhysicalWindowSize.Width, $bufferSize.Width)
$bufferSize.Height = [math]::Max($rawUI.MaxPhysicalWindowSize.Height, $bufferSize.Height)
$rawUI.BufferSize = $bufferSize

# تعيين حجم النافذة إلى الحجم الأقصى
$rawUI.WindowSize = $rawUI.MaxPhysicalWindowSize


$itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
$Host.UI.RawUI.WindowTitle = "ITT - #StandWithPalestine"

# Create directory if it doesn't exist
$ittDir = $itt.ittDir
if (-not (Test-Path -Path $ittDir)) {
    New-Item -ItemType Directory -Path $ittDir -Force | Out-Null
}

# Trace the script
$logDir = Join-Path $ittDir 'logs'
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber