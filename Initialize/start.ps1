param (
    # debug start
    [switch]$Debug,
    # debug end
    # Quick install
    [string]$i
)

$Host.UI.RawUI.WindowTitle = "Install Twaeks Tool"

# Load DLLs
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase','System.Net.Http'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{

    database       = @{}
    ProcessRunning = $false
    lastupdate     = "#{replaceme}"
    registryPath   = "HKCU:\Software\ITT@emadadel"
    icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
    Theme          = "default"
    Date           = (Get-Date -Format "MM/dd/yyy")
    Music          = "100"
    PopupWindow    = "0"
    Language       = "default"
    ittDir         = "$env:ProgramData\itt\"
    command        = "$($MyInvocation.MyCommand.Definition)"
})

# Check for updates
$repoFileUrl = "https://api.github.com/repos/emadadel4/itt/releases/latest"
$latestVersion = (Invoke-RestMethod -Uri $repoFileUrl).tag_name
if ($latestVersion -ne $itt.lastupdate) {
    Write-Host "`n  YOU ARE USING AN OLD VERSION OF ITT. PORTABLE SCRIPT IS NOT RECOMMENDED.`n  PLEASE USE THE LATEST VERSION FROM THE OFFICIAL COMMANDS AT https://github.com/emadadel4/itt" -ForegroundColor Red
    Read-Host -Prompt "Press any key to continue..."
    Start-Process("https://github.com/emadadel4/itt")
    exit
}

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}

Write-Host "`n  Relax, good things are loading… almost there!" -ForegroundColor Yellow

# Create directory if it doesn't exist
if (-not (Test-Path -Path $itt.ittDir)) {New-Item -ItemType Directory -Path $ittDir -Force | Out-Null}

# Trace the script
Start-Transcript -Path (Join-Path $itt.ittDir "logs\log_$(Get-Date -Format 'yyyy-MM-dd').log") -Append -Force *> $null