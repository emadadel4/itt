param (
    # debug start
     [switch]$Debug,
    # debug end
    # Quick install
    [string]$i,
    [bool]$QuickInstall
)

# Load DLLs
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{
        database       = @{}
        ProcessRunning = $false
        lastupdate     = "#{replaceme}"
        registryPath   = "HKCU:\Software\ITT@emadadel"
        icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
        Theme          = "default"
        Date           = (Get-Date -Format "MM/dd/yyy")
        Music          = "0"
        PopupWindow    = "0"
        Language       = "default"
        ittDir         = "$env:ProgramData\itt\"
})

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $newProcess = Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}

$Host.UI.RawUI.WindowTitle = "Install Twaeks Tool"
$Host.UI.RawUI.BackgroundColor = "black"
Clear

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class WinAPI {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool EnableWindow(IntPtr hWnd, bool bEnable);
}
"@


# Get the PowerShell window handle by process ID
$process = Get-Process -Id $PID
$hwnd = $process.MainWindowHandle

# Maximize the PowerShell window
[WinAPI]::ShowWindow($hwnd, 3)

# Disable input (read-only mode)
[WinAPI]::EnableWindow($hwnd, $false)

# Create mediaPlayer Object
$itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX

# Create directory if it doesn't exist
$ittDir = $itt.ittDir
if (-not (Test-Path -Path $ittDir)) {
    New-Item -ItemType Directory -Path $ittDir -Force | Out-Null
}

# Trace the script
$logDir = Join-Path $ittDir 'logs'
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber *> $null