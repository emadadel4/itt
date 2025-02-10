######################################################################################
#      ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _          #
#     |_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |         #
#      | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |         #
#      | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___      #
#     |___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|     #
#                Automatically generated from build don't play here :)               # 
#                              #StandWithPalestine                                   #
# https://github.com/emadadel4                                                       #
# https://t.me/emadadel4                                                             #
######################################################################################
#===========================================================================
#region Begin Start
#===========================================================================
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
        lastupdate     = "02/10/2025"
        registryPath   = "HKCU:\Software\ITT@emadadel"
        icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
        Theme          = "default"
        Date           = (Get-Date -Format "MM/dd/yyy")
        Music          = 100
        PopupWindow    = "0"
        Language       = "default"
        ittDir         = "$env:ProgramData\itt\"
})

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $newProcess = Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit
}

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
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber *> $null
#===========================================================================
#endregion End Start
#===========================================================================
#===========================================================================
#region Begin Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
$itt.database.Applications = @'
[
  {
    "Name": "Mozilla Firefox",
    "Description": "A widely-used open-source web browser known for its speed, privacy features, and customization options",
    "winget": "Mozilla.Firefox",
    "choco": "firefox",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Mozilla Firefox ESR",
    "Description": "A widely-used open-source web browser known for its speed, privacy features, and customization options",
    "winget": "Mozilla.Firefox.ESR",
    "choco": "firefoxesr",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Thorium SSE3",
    "Description": "A web browser designed for smooth and secure browsing experiences",
    "winget": "Alex313031.Thorium",
    "choco": "thorium --params /SSE3",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Thorium AVX",
    "Description": "A web browser designed for smooth and secure browsing experiences",
    "winget": "Alex313031.Thorium.AVX2",
    "choco": "thorium --params /AVX",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Microsoft Edge",
    "Description": "Microsoft's web browser built for fast and secure internet surfing, integrating seamlessly with Windows ecosystem",
    "winget": "Microsoft.Edge",
    "choco": "microsoft-edge",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Google Chrome",
    "Description": "A popular web browser known for its speed, simplicity, and vast ecosystem of extensions",
    "winget": "Google.Chrome",
    "choco": "googlechrome",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Chromium",
    "Description": "An open-source web browser project that serves as the foundation for many browsers, including Google Chrome",
    "winget": "eloston.ungoogled-chromium",
    "choco": "chromium",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Brave",
    "Description": "A privacy-focused web browser that blocks ads and trackers, offering faster and safer browsing experiences",
    "winget": "Brave.Brave",
    "choco": "brave",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Tor Browser",
    "Description": "A web browser that prioritizes user privacy by routing internet traffic through a global network of servers, enabling anonymous browsing",
    "winget": "TorProject.TorBrowser",
    "choco": "tor-browser",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Opera",
    "Description": "The Opera web browser makes the Web fast and fun, giving you a better web browser experience on any computer",
    "winget": "Opera.Opera",
    "choco": "opera",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Internet Download Manager",
    "Description": "A popular download manager tool that accelerates downloads and allows users to organize and schedule downloads efficiently",
    "winget": "Tonec.InternetDownloadManager",
    "choco": "internet-download-manager",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "JDownloader",
    "Description": "JDownloader is an internet download manager",
    "winget": "AppWork.JDownloader",
    "choco": "jdownloader",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "KLite Mega Codec Full Pack",
    "Description": "Comprehensive collection of audio and video codecs, filters, and tools, enabling playback of various media formats",
    "winget": "none",
    "choco": "k-litecodecpackfull",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "PotPlayer",
    "Description": "A multimedia player with a sleek interface and advanced features, supporting a wide range of audio and video formats",
    "winget": "Daum.PotPlayer",
    "choco": "potplayer",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "VLC",
    "Description": "A versatile media player capable of playing almost any multimedia file format, with support for various streaming protocols",
    "winget": "VideoLAN.VLC",
    "choco": "vlc.install",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Kodi",
    "Description": "A powerful open-source media center software that allows users to organize and stream their media collections",
    "winget": "9NBLGGH4T892",
    "choco": "kodi",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Jellyfin Server",
    "Description": "An open-source media server software that enables users to stream their media libraries across devices, providing a self-hosted alternative to commercial services",
    "winget": "Jellyfin.Server",
    "choco": "jellyfin",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Winamp",
    "Description": "A classic media player known for its customizable interface and extensive plugin support, providing a nostalgic music playback experience",
    "winget": "Winamp.Winamp",
    "choco": "winamp",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Aimp",
    "Description": "A lightweight and feature-rich audio player with support for various audio formats and customizable interface themes",
    "winget": "AIMP.AIMP",
    "choco": "aimp",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Spotify",
    "Description": "Spotify is a new way to listen to music",
    "winget": "Spotify.Spotify",
    "choco": "spotify",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "FastStone Image Viewer",
    "Description": "FastStone Image Viewer is a fast, stable, user-friendly image browser, converter and editor",
    "winget": "FastStone.Viewer",
    "choco": "fsviewer",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "OpenOffice",
    "Description": "An open-source office productivity suite offering word processing, spreadsheet, presentation, and other office tools, compatible with Microsoft Office formats",
    "winget": "Apache.OpenOffice",
    "choco": "openoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "FoxitReader",
    "Description": "A lightweight and feature-rich PDF reader with annotation, form filling, and document signing capabilities",
    "winget": "Foxit.FoxitReader",
    "choco": "foxitreader",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "LibreOffice",
    "Description": "A powerful open-source office suite providing word processing, spreadsheet, presentation, and other office tools, compatible with Microsoft Office formats",
    "winget": "Foxit.FoxitReader",
    "choco": "libreoffice-fresh",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "SumatraPDF",
    "Description": "A lightweight and fast PDF reader with minimalistic design and focus on simplicity and speed",
    "winget": "SumatraPDF.SumatraPDF",
    "choco": "sumatrapdf.install",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "WinRAR",
    "Description": "A popular file compression and archiving utility that supports various archive formats and offers advanced features such as encryption and self-extracting archives",
    "winget": "RARLab.WinRAR",
    "choco": "winrar",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "7Zip",
    "Description": "An open-source file archiver with a high compression ratio, supporting various archive formats and providing a powerful command-line interface",
    "winget": "7zip.7zip",
    "choco": "7zip",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "PeaZip",
    "Description": " PeaZip is a free cross-platform file archiver",
    "winget": "Giorgiotani.Peazip",
    "choco": "peazip",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "Telegram Desktop",
    "Description": "A cross-platform messaging app with a focus on speed and security, offering end-to-end encryption and a wide range of features such as group chats, file sharing, and stickers",
    "winget": "Telegram.TelegramDesktop",
    "choco": "telegram",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Signal",
    "Description": "Fast, simple, secure. Privacy that fits in your pocket",
    "winget": "OpenWhisperSystems.Signal",
    "choco": "signal",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Meta Messenger",
    "Description": "A messaging app that allows users to connect with friends and family through text messages, voice calls, and video calls, offering various multimedia sharing features",
    "winget": "9WZDNCRF0083",
    "choco": "messenger",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Zoom",
    "Description": "A video conferencing app that facilitates online meetings, webinars, and virtual events, allowing participants to interact through video, audio, and chat",
    "winget": "Zoom.ZoomRooms",
    "choco": "zoom",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Microsoft Teams",
    "Description": "A collaboration platform that combines workplace chat, video meetings, file storage, and application integration, enhancing teamwork and productivity within organizations",
    "winget": "Microsoft.Teams",
    "choco": "microsoft-teams.install",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Discord",
    "Description": "A VoIP application and digital distribution platform designed for creating communities and connecting gamers, providing text, voice, and video communication features",
    "winget": "Discord.Discord",
    "choco": "discord",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "TeamViewer",
    "Description": "A remote access and support software that enables users to remotely control computers, transfer files, and collaborate online, facilitating remote work and IT support",
    "winget": "TeamViewer.TeamViewer",
    "choco": "teamviewer",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "GIMP",
    "Description": "A free and open-source raster graphics editor used for image retouching and editing, drawing and painting, and converting between different image formats",
    "winget": "GIMP.GIMP",
    "choco": "gimp",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ Runtime - all versions",
    "Description": "Microsoft Visual C++ Redistributable installs run-time components of Visual C++ libraries. These components are required to run C++ applications that are developed using Visual Studio and link dynamically to Visual C++ libraries",
    "winget": "none",
    "choco": "vcredist-all",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "DirectX",
    "Description": "DirectX is a collection of APIs for handling tasks related to games and videos.",
    "winget": "Microsoft.DirectX",
    "choco": "directx",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2005 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2005, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2005",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2005 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2005, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2005",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2008 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2008, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2008",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2008 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2008, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2008",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2010 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2010, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2010",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2010 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2010, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2010",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2012 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2012, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2012",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2012 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2012, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2012",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2013 (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2013, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2013",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2013 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2013, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2013",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2015-2022 (x64) Redistributable",
    "Description": "A set of runtime components required to run 64-bit applications developed with Microsoft Visual C++ 2015-2022, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2015",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft Visual C++ 2015-2022  (x86) Redistributable",
    "Description": "A set of runtime components required to run applications developed with Microsoft Visual C++ 2015-2022, providing libraries, DLLs, and other resources",
    "winget": "none",
    "choco": "vcredist2015",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Framework All Versions",
    "Description": "A comprehensive and consistent programming model for building applications that have visually stunning user experiences, seamless and secure communication, and the ability to model a range of business processes",
    "winget": "none",
    "choco": "dotnet-all",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "AMD Ryzen Chipset Drivers",
    "Description": "Supports: AMD Ryzen Threadripper PRO Processor, AMD Ryzen 8000/7040/7000 Series Desktop & Mobile Processors, AMD Ryzen 5000/3rd Gen/2nd Gen Desktop & Threadripper Processors, AMD Ryzen Desktop Processor with Radeon Graphics & Mobile Processor with Radeon Graphics, 7th-Gen AMD A-Series Processors, AMD X670E/X670/B650E/B650/B350/A320/X370/X399/B450/X470/X570/B550/A520/A620/TRX40/TRX50/WRX80/WRX90 Chipsets",
    "winget": "none",
    "choco": "amd-ryzen-chipset",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVidia Display Driver",
    "Description": "The software component that allows the operating system and installed software to communicate with and control the NVIDIA graphics processing unit (GPU)",
    "winget": "none",
    "choco": "nvidia-display-driver",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVIDIA GeForce Experience",
    "Description": "A cloud-based gaming service provided by NVIDIA that allows users to play video games on supported devices via a remote gaming PC hosted on NVIDIA's servers",
    "winget": "Nvidia.GeForceExperience",
    "choco": "geforce-experience",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Msi Afterburner",
    "Description": "MSI Afterburner is the ultimate graphics card utility, co-developed by MSI and RivaTuner teams",
    "winget": "Guru3D.Afterburner",
    "choco": "msiafterburner",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "NVIDIA PhysX",
    "Description": "A physics processing unit (PPU) software development kit (SDK) offered by NVIDIA for real-time physics simulations in video games",
    "winget": "Nvidia.PhysXLegacy",
    "choco": "physx.legacy",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Steam",
    "Description": "A digital distribution platform developed by Valve Corporation for purchasing and playing video games",
    "winget": "Valve.Steam",
    "choco": "steam",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Ubisoft Connect",
    "Description": "A digital distribution, digital rights management, multiplayer, and communications service developed by Ubisoft, providing access to Ubisoft's games, rewards, and social features",
    "winget": "Ubisoft.Connect",
    "choco": "ubisoft-connect",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Origin",
    "Description": " Game store launcher",
    "winget": "ElectronicArts.Origin",
    "choco": "origin",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Rockstar Games Launcher",
    "Description": "Download and play the latest Rockstar Games PC titles",
    "winget": "none",
    "choco": "rockstar-launcher",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "GameSave Manager",
    "Description": "A utility tool that allows users to backup, restore, and transfer their game saves between different gaming platforms and directories",
    "winget": "InsaneMatt.GameSaveManager",
    "choco": "gamesavemanager",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "StreamlabsOBS",
    "Description": "A free and open-source streaming software built on top of OBS Studio with additional features tailored for streamers, such as built-in alerts, overlays, and chat integration",
    "winget": "Streamlabs.StreamlabsOBS",
    "choco": "streamlabs-obs",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "OBS Studio",
    "Description": "A free and open-source software for video recording and live streaming. It offers high performance real-time video/audio capturing and mixing",
    "winget": "OBSProject.OBSStudio",
    "choco": "obs-studio.install",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Logitech Gaming Software",
    "Description": "Logitech Gaming Software lets you customize Logitech G gaming mice, keyboards, headsets and select wheels",
    "winget": "Logitech.LGS",
    "choco": "logitechgaming",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Lively Wallpaper",
    "Description": "A software that allows users to set animated and interactive wallpapers on their Windows desktop, providing various customization options",
    "winget": "rocksdanister.LivelyWallpaper",
    "choco": "lively",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Playnite",
    "Description": "Open source video game library manager and launcher with support for 3rd party libraries like Steam, GOG, Origin, Battle.net and Uplay",
    "winget": "Playnite.Playnite",
    "choco": "playnite",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Driver Easy",
    "Description": "A driver update tool that automatically detects, downloads, and installs device drivers for the user's computer hardware",
    "winget": "Easeware.DriverEasy",
    "choco": "drivereasyfree",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Graphics Windows DCH",
    "Description": "Intel Graphics Driver for Windows 10",
    "winget": "none",
    "choco": "intel-graphics-driver",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Driver Support Assistant",
    "Description": "Intel Driver & Support Assistant enables you to scan computing devices for the latest drivers available from Intel",
    "winget": "Intel.IntelDriverAndSupportAssistant",
    "choco": "intel-dsa",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Intel Network Adapter",
    "Description": "Intel Network Adapter Drivers for Windows 10",
    "winget": "Intel.WiFiDrivers",
    "choco": "intel-network-drivers-win10",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Snappy Driver Installer",
    "Description": "A free and open-source tool for updating and installing device drivers on Windows, offering offline driver updates and wide hardware support",
    "winget": "samlab-ws.SnappyDriverInstaller",
    "choco": "sdio",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver booster",
    "Description": "Scans and identifies outdated drivers automatically, and downloads and installs the right update for you with just ONE click",
    "winget": "IObit.DriverBooster",
    "choco": "driverbooster",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver Genius",
    "Description": "Professional driver management tool and hardware diagnostics",
    "winget": "none",
    "choco": "drivergenius",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Display Driver Uninstaller",
    "Description": "Utility to completely remove system drivers",
    "winget": "Wagnardsoft.DisplayDriverUninstaller",
    "choco": "ddu",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Driver Store Explorer",
    "Description": " Windows driver store utility",
    "winget": "none",
    "choco": "rapr",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "1Password",
    "Description": "A password manager that securely stores login credentials, credit card information, and other sensitive data in an encrypted vault, accessible with a single master password",
    "winget": "AgileBits.1Password",
    "choco": "1password",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AOMEI Partition Assistant Standard",
    "Description": "AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement, partition style conversion, OS migration and other disk managements without any difficulties",
    "winget": "AOMEI.PartitionAssistant",
    "choco": "partition-assistant-standard",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "AOMEI Backupper Standard",
    "Description": "A backup and recovery software that enables users to create system backups, disk backups, partition backups, and file backups to protect data against system failures and data loss",
    "winget": "AOMEI.Backupper.Standard",
    "choco": "backupper-standard",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Recuva recover",
    "Description": "A data recovery software that helps users retrieve accidentally deleted files, including photos, documents, videos, and more, from various storage devices such as hard drives, USB drives, and memory cards",
    "winget": "Piriform.Recuva",
    "choco": "recuva",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "CCleaner",
    "Description": "A system optimization, privacy, and cleaning tool that helps users remove unused files, clean up temporary files, and optimize their Windows PCs for better performance",
    "winget": "SingularLabs.CCEnhancer",
    "choco": "ccleaner",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "BCUninstaller",
    "Description": "A powerful uninstaller tool for Windows that allows users to remove unwanted programs, plugins, and Windows Store apps, along with leftover files and registry entries",
    "winget": "Klocman.BulkCrapUninstaller",
    "choco": "bulk-crap-uninstaller",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Easy Context Menu",
    "Description": "To install Easy Context Menu, run the following command from the command line or from PowerShell:",
    "winget": "none",
    "choco": "ecm",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "HWiNFO",
    "Description": "A hardware information and diagnostic tool that provides detailed information about the hardware components of a computer system, including sensors, temperature, voltage, and more",
    "winget": "REALiX.HWiNFO",
    "choco": "hwinfo.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Speccy",
    "Description": "A system information tool that provides detailed information about the hardware and operating system of a computer, including CPU, RAM, motherboard, graphics card, and storage devices",
    "winget": "Piriform.Speccy",
    "choco": "speccy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FurMark",
    "Description": "A graphics card stress testing and benchmarking utility that helps users test the stability, cooling, and performance of their GPU by rendering a highly intensive 3D graphics scene",
    "winget": "Geeks3D.FurMark",
    "choco": "furmark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Hard Disk Sentinel",
    "Description": "A hard disk monitoring and analysis software that helps users monitor the health, performance, and temperature of their hard drives, SSDs, and other storage devices",
    "winget": "JanosMathe.HardDiskSentinelPro",
    "choco": "hdsentinel",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "CPU-Z",
    "Description": "A system monitoring utility that provides detailed information about the CPU, motherboard, memory, and other hardware components of a computer system",
    "winget": "CPUID.CPU-Z",
    "choco": "cpu-z",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Mem Reduct",
    "Description": "Lightweight real-time memory management application to monitor and clean system memory on your computer",
    "winget": "Henry++.MemReduct",
    "choco": "memreduct",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "HandBrake",
    "Description": "A free and open-source video transcoder tool that converts video files from one format to another, supporting a wide range of input and output formats",
    "winget": "HandBrake.HandBrake",
    "choco": "handbrake.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Rufus Portable",
    "Description": "A utility tool for creating bootable USB drives from ISO images, helping users to install or run operating systems, such as Windows, Linux, or other utilities",
    "winget": "Rufus.Rufus",
    "choco": "rufus",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "ImgBurn",
    "Description": "Lightweight CD / DVD burning application",
    "winget": "LIGHTNINGUK.ImgBurn",
    "choco": "imgburn",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Virtual CloneDrive",
    "Description": "A free software that allows users to mount disc images as virtual drives, enabling them to access the content of ISO, BIN, and CCD files without the need for physical discs",
    "winget": "none",
    "choco": "virtualclonedrive",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ultra ISO",
    "Description": "A powerful ISO image management tool that enables users to create, edit, extract, and burn ISO files, providing a comprehensive solution for managing disk image files",
    "winget": "EZBSystems.UltraISO",
    "choco": "ultraiso",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ventoy",
    "Description": "An open-source tool for creating bootable USB drives with multiple ISO files, allowing users to boot various operating systems or utilities directly from a single USB drive",
    "winget": "Ventoy.Ventoy",
    "choco": "ventoy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "iVentoy",
    "Description": "With iVentoy you can boot and install OS on multiple machines at the same time through the network",
    "winget": "none",
    "choco": "iventoy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AutoHotkey",
    "Description": "A scripting language for automating repetitive tasks and creating macros on Windows, allowing users to customize keyboard shortcuts, remap keys, and automate mouse actions",
    "winget": "AutoHotkey.AutoHotkey",
    "choco": "autohotkey",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Rainmeter",
    "Description": "A customizable desktop customization tool that displays customizable skins, widgets, and applets on the Windows desktop, providing users with real-time system monitoring and information",
    "winget": "Rainmeter.Rainmeter",
    "choco": "rainmeter",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FxSound",
    "Description": "An audio enhancer software that improves the sound quality of music, videos, and games on Windows PCs by providing advanced audio processing and customization options",
    "winget": "FxSoundLLC.FxSound",
    "choco": "fxsound",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Vysor",
    "Description": "A screen mirroring and remote control software that enables users to view and control Android devices from Windows PCs, allowing for easy screen sharing, app testing, and troubleshooting",
    "winget": "Vysor.Vysor",
    "choco": "vysor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Unified Remote",
    "Description": "A remote control app that turns smartphones into universal remote controls for Windows, macOS, and Linux computers, allowing users to control media playback, presentations, and more",
    "winget": "UnifiedIntents.UnifiedRemote",
    "choco": "unifiedremote",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AnyDesk",
    "Description": "A remote desktop software that allows users to access and control Windows, macOS, Linux, Android, and iOS devices from anywhere, providing secure and reliable remote access",
    "winget": "AnyDeskSoftwareGmbH.AnyDesk",
    "choco": "anydesk",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Airdroid",
    "Description": "AirDroid is a free and fast Android device manager app that allows you to access Android phone/tablet from computer remotely and securely. Manage SMS, files, photos and videos, WhatsApp, Line, WeChat and more on computer",
    "winget": "AirDroid.AirDroid",
    "choco": "airdroid",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "UltraViewer",
    "Description": "Remote control to support your clients / partners from everywhere",
    "winget": "DucFabulous.UltraViewer",
    "choco": "ultraviewer",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Wireless Network Watcher Portable",
    "Description": "Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network",
    "winget": "NirSoft.WirelessNetworkWatcher",
    "choco": "wnetwatcher.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "WifiInfoView",
    "Description": "Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network",
    "winget": "NirSoft.WifiInfoView",
    "choco": "wifiinfoview",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "WirelessNetView",
    "Description": "Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network",
    "winget": "none",
    "choco": "wirelessnetview",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "qBittorrent",
    "Description": "A free and open-source BitTorrent client for downloading and uploading files via the BitTorrent protocol, providing users with a lightweight and feature-rich torrenting experience",
    "winget": "qBittorrent.qBittorrent",
    "choco": "qbittorrent",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Google Earth Pro",
    "Description": "Google Earth Pro on desktop is free for users with advanced feature needs. Import and export GIS data, and go back in time with historical imagery",
    "winget": "Google.EarthPro",
    "choco": "googleearthpro",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "XAMPP",
    "Description": "XAMPP is a free and open-source cross-platform web server solution stack package developed by Apache Friends, consisting mainly of the Apache HTTP Server, MariaDB database, and interpreters for scripts written in the PHP and Perl programming languages",
    "winget": "ApacheFriends.Xampp.8.2",
    "choco": "xampp-81",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Visual Studio Professional 2022",
    "Description": "Visual Studio Professional 2022 is an integrated development environment (IDE) from Microsoft. It is used to develop computer programs, websites, web apps, web services, and mobile apps",
    "winget": "Microsoft.VisualStudio.2022.Professional",
    "choco": "visualstudio2022professional",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Visual Studio Community 2022",
    "Description": "Visual Studio Community 2022 is a free, fully-featured, and extensible IDE for individual developers, open source projects, academic research, education, and small professional teams",
    "winget": "Microsoft.VisualStudio.2022.Community",
    "choco": "visualstudio2022community",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Unity Hub",
    "Description": "Unity is a cross-platform game creation system developed by Unity Technologies and used to develop video games for PC, consoles, mobile",
    "winget": "Unity.UnityHub",
    "choco": "unity-hub",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Godot Engine",
    "Description": "Godot is a feature-packed, cross-platform game engine for creating 2D and 3D games. It provides a comprehensive set of tools and features to develop games efficiently and quickly",
    "winget": "GodotEngine.GodotEngine",
    "choco": "godot",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Unity3D Engine",
    "Description": "Unity is a cross-platform game creation system developed by Unity Technologies and used to develop video games for PC, consoles, mobile",
    "winget": "Unity.Unity.2020",
    "choco": "unity",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Blender",
    "Description": "Blender is a free and open-source professional-grade 3D computer graphics and video compositing program",
    "winget": "BlenderFoundation.Blender",
    "choco": "blender",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VSCode",
    "Description": "Visual Studio Code is a free source-code editor developed by Microsoft for Windows, Linux, and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring",
    "winget": "Microsoft.VisualStudioCode",
    "choco": "vscode",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Vim",
    "Description": "Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set. It's us... Keep Reading",
    "winget": "vim.vim",
    "choco": "vim",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Sublime Text 4",
    "Description": "Sublime Text 4 - The sophisticated text editor for code, markup and prose",
    "winget": "SublimeHQ.SublimeText.4",
    "choco": "sublimetext4",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Atom",
    "Description": "Atom is a text editor that's modern, approachable, yet hackable to the core—a tool you can customize to do anything but also use productively without ever touching a config file",
    "winget": "GitHub.Atom",
    "choco": "atom",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "InnoSetup",
    "Description": "Inno Setup is a free installer for Windows programs. First introduced in 1997, Inno Setup today rivals and even surpasses many commercial installers in feature set and stability",
    "winget": "JRSoftware.InnoSetup",
    "choco": "innosetup",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PyCharm Community Edition",
    "Description": "PyCharm Community Edition is a free and open-source IDE for Python development. It provides smart code completion, code inspections, on-the-fly error highlighting, and quick-fixes",
    "winget": "JetBrains.PyCharm.Community",
    "choco": "pycharm-community",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PyCharm Professional Edition",
    "Description": "PyCharm Professional Edition is a powerful IDE for professional Python development. It includes advanced features such as database tools, web development support, and scientific tools integration",
    "winget": "JetBrains.PyCharm.Professional",
    "choco": "pycharm",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Jetbrains Rider",
    "Description": "Rider is a cross-platform .NET IDE developed by JetBrains. It supports C#, VB.NET, F#, ASP.NET, JavaScript, TypeScript, HTML, CSS, and SQL languages and frameworks",
    "winget": "JetBrains.Rider",
    "choco": "jetbrains-rider",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "NodeJs LTS",
    "Description": "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. LTS (Long Term Support) releases are supported for an extended period and provide stability for production environments",
    "winget": "OpenJS.NodeJS.LTS",
    "choco": "nodejs-lts",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Electron",
    "Description": "Electron, framework lets you write cross-platform desktop applications using JavaScript, HTML and CSS. It is based on io.js and Chromium and is used in the Atom editor",
    "winget": "none",
    "choco": "electron",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Electrum LTS",
    "Description": "Electrum is a lightweight Bitcoin wallet focused on speed and simplicity, with support for hardware wallets and multisig functionality. LTS (Long Term Support) releases provide stability and security updates for an extended period",
    "winget": "Electrum.Electrum",
    "choco": "electronim",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hugo",
    "Description": "Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites f... Keep Reading",
    "winget": "Hugo.Hugo",
    "choco": "hugo",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hugo Extended",
    "Description": "Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites f... Keep Reading",
    "winget": "Hugo.Hugo.Extended",
    "choco": "hugo-extended",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Notepad++",
    "Description": "Notepad++ is a free source code editor and Notepad replacement that supports several languages. It offers syntax highlighting, code folding, auto-completion, and other features for efficient code editing",
    "winget": "Notepad++.Notepad++",
    "choco": "notepadplusplus",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Windows Terminal",
    "Description": "Windows Terminal is a modern terminal application for users of command-line tools and shells like Command Prompt, PowerShell, and Windows Subsystem for Linux (WSL). It provides multiple tabs, custom themes, and GPU-accelerated text rendering",
    "winget": "Microsoft.WindowsTerminal",
    "choco": "microsoft-windows-terminal",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Powershell 7",
    "Description": "PowerShell Core is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data (e.g., JSON, CSV, XML, etc.), REST APIs, and object models",
    "winget": "Microsoft.PowerShell",
    "choco": "powershell-core",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "x64dbg Portable",
    "Description": "An open-source x64/x32 debugger for windows",
    "winget": "none",
    "choco": "x64dbg.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "dnSpy",
    "Description": "dnSpy is a tool to reverse engineer .NET assemblies. It includes a decompiler, a debugger and an assembly editor (and more) and can be easily extended by writing your own extension. It uses dnlib to read and write assemblies so it can handle obfuscated assemblies (eg. malware) without crashing",
    "winget": "dnSpyEx.dnSpy",
    "choco": "dnspy",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Cheat Engine",
    "Description": "Cheat Engine is an open source tool designed to help you modify single player games",
    "winget": "none",
    "choco": "cheatengine",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Python 3.12.6",
    "Description": "Python is a popular high-level programming language known for its simplicity and versatility. It is used in various fields such as web development, data science, machine learning, and automation",
    "winget": "Python.Python.3.9",
    "choco": "python",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Git",
    "Description": "Git is a free and open-source distributed version control system designed to handle everything from small to very large projects with speed and efficiency",
    "winget": "Git.Git",
    "choco": "git",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GitHub Desktop",
    "Description": "GitHub Desktop is a seamless way to contribute to projects on GitHub and GitHub Enterprise. It provides an intuitive interface for managing repositories, branching, committing, and merging code changes",
    "winget": "GitHub.GitHubDesktop",
    "choco": "github-desktop",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Docker Desktop",
    "Description": "Docker Desktop is an easy-to-install application for Windows and macOS that enables developers to build, share, and run containerized applications and microservices locally",
    "winget": "Docker.DockerDesktop",
    "choco": "docker-desktop",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Docker Compose",
    "Description": "Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to use a YAML file to configure your application's services, networks, and volumes",
    "winget": "Docker.DockerCompose",
    "choco": "docker-compose",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PowerToys",
    "Description": "PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater productivity. It includes tools like FancyZones for window management, PowerRename for batch renaming files, and more",
    "winget": "Microsoft.PowerToys",
    "choco": "powertoys",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Notion",
    "Description": "The all-in-one workspace for your notes, tasks, wikis, and databases",
    "winget": "Notion.Notion",
    "choco": "notion",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "FL Studio",
    "Description": "FL Studio is a digital audio workstation (DAW) developed by Image-Line. It allows you to compose, arrange, record, edit, mix, and master professional-quality music",
    "winget": "ImageLine.FLStudio",
    "choco": "ImageLine.FLStudio",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Android Debug Bridge",
    "Description": "Android Debug Bridge (ADB) is a command-line tool that allows you to communicate with an Android device. It is used for various debugging tasks such as installing and debugging apps",
    "winget": "none",
    "choco": "adb",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Universal ADB Drivers",
    "Description": "Universal ADB Drivers are drivers that provide compatibility with a wide range of Android devices for debugging purposes. They allow you to connect your Android device to a computer and use ADB commands",
    "winget": "none",
    "choco": "universal-adb-drivers",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Scrcpy",
    "Description": "Scrcpy is a free and open-source tool that allows you to display and control your Android device from a computer. It provides high-performance screen mirroring and supports various input methods",
    "winget": "Genymobile.scrcpy",
    "choco": "scrcpy",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VirtualBox",
    "Description": "VirtualBox is a cross-platform virtualization application. It installs on existing Intel or AMD-based computers, whether they are running Windows, Mac, Linux or Solaris operating systems. It extends the capabilities of your existing computer so that it can run multiple operating systems (inside multiple virtual machines) at the same time",
    "winget": "Oracle.VirtualBox",
    "choco": "virtualbox",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Oh My Posh",
    "Description": " Oh my Posh is a custom prompt engine for any shell that has the ability to adjust the prompt string with a function or variable",
    "winget": "JanDeDobbeleer.OhMyPosh",
    "choco": "oh-my-posh",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Malwarebytes",
    "Description": "Multiple layers of malware-crushing tech, including virus protection. Thorough malware and spyware removal. Specialized ransomware protection",
    "winget": "Malwarebytes.Malwarebytes",
    "choco": "malwarebytes",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Avast Free Antivirus",
    "Description": "Avast Free Antivirus",
    "winget": "XPDNZJFNCR1B07",
    "choco": "avastfreeantivirus",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Nerd Fonts - CascadiaCode",
    "Description": "Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons)",
    "winget": "none",
    "choco": "nerd-fonts-cascadiacode",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Java SE Runtime Environment 8.0.411",
    "Description": "Java allows you to play online games, chat with people around the world, calculate your mortgage interest, and view images in 3D, just to name a few. It's also integral to the intranet applications and other e-business solutions that are the foundation of corporate computing. Please note you now need a Java License from Oracle to use unless installed for Personal Use and Development Use",
    "winget": "none",
    "choco": "jre8",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Audacity",
    "Description": "Audacity is free, open source, cross-platform software for recording and editing sounds",
    "winget": "Audacity.Audacity",
    "choco": "audacity",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "MusicBee",
    "Description": "MusicBee makes it easy to organize, find and play music files on your computer, on portable devices and on the web",
    "winget": "MusicBee.MusicBee",
    "choco": "musicbee",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Format Factory",
    "Description": "multifunctional media processing tools",
    "winget": "none",
    "choco": "formatfactory",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Winaero Tweaker",
    "Description": "Customize the appearance and behavior of the Windows operating system",
    "winget": "none",
    "choco": "winaero-tweaker",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Windows Subsystem for Linux WSL2",
    "Description": "To install Windows Subsystem for Linux 2, run the following command from the command line or from PowerShell",
    "winget": "Microsoft.WSL",
    "choco": "wsl2",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Wamp Server 3.3.5",
    "Description": "WampServer is a Windows web development environment. It allows you to create web applications",
    "winget": "none",
    "choco": "wamp-server",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MongoDB",
    "Description": "MongoDB stores data using a flexible document data model that is similar to JSON. Documents contain one or more fields, including arrays, binary data and sub-documents. Fields can vary from document to document. This flexibility allows development teams to evolve the data model rapidly as their application requirements change",
    "winget": "MongoDB.Server",
    "choco": "mongodb",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MPC-BE",
    "Description": "Media Player Classic - BE is a free and open source audio and video player for Windows",
    "winget": " MPC-BE.MPC-BE",
    "choco": "mpc-be",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Kdenlive",
    "Description": "A powerful non-linear video editor",
    "winget": "KDE.Kdenlive",
    "choco": "kdenlive",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "TablePlus",
    "Description": "Modern, native, and friendly GUI tool for relational databases: MySQL, PostgreSQL, SQLite, MongoDB, Redis, and more",
    "winget": "TablePlus.TablePlus",
    "choco": "tableplus",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Hosts File Editor",
    "Description": "Hosts File Editor makes it easy to change your hosts file as well as archive multiple versions for easy retrieval",
    "winget": "scottlerch.hosts-file-editor",
    "choco": "hosts.editor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Subtitle Edit",
    "Description": "With SE you can easily adjust a subtitle if it is out of sync with the video in several different ways. You can also use SE for making new subtitles from scratch (do use the time-line/waveform/spectrogram) or translating subtitles",
    "winget": "9NWH51GWJTKN",
    "choco": "subtitleedit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Skype",
    "Description": "Skype - Install Skype, add your friends as contacts, then call, video call and instant message with them for free. Call people who aren't on Skype too, at really low rates",
    "winget": "Microsoft.Skype",
    "choco": "skype",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "FileZilla",
    "Description": "FileZilla Client is a fast and reliable cross-platform FTP, FTPS and SFTP client with lots of useful features and an intuitive graphical user interface",
    "winget": "none",
    "choco": "filezilla",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Everything",
    "Description": "Everything Search Engine - locate files and folders by name instantly",
    "winget": "voidtools.Everything",
    "choco": "everything",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Yarn",
    "Description": "Yarn is a package manager for the npm and bower registries with a few specific focuses",
    "winget": "Yarn.Yarn",
    "choco": "yarn",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VMware Workstation Player",
    "Description": "VMware Workstation Player™ is a streamlined desktop virtualization application that runs another operating system on the same computer without rebooting. VMware Workstation Player provides a simple user interface, unmatched operating system support, and portability across the VMware ecosystem",
    "winget": "none",
    "choco": "vmware-workstation-player",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "HDD Low Level Format Tool",
    "Description": "Will erase, Low-Level Format and re-certify a SATA, IDE or SCSI hard disk drive with any size of up to 281 474 976 710 655 bytes",
    "winget": "none",
    "choco": "llftool",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "BlueStacks",
    "Description": "Play Android Games on PC",
    "winget": "BlueStack.BlueStacks",
    "choco": "bluestacks",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Intel Wireless Bluetooth for Windows 10 and Windows 11",
    "Description": "Bluetooth for Windows 10 and Windows",
    "winget": "none",
    "choco": "intel-bluetooth-drivers",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Office 365 Business",
    "Description": "Microsoft 365 (formerly Office 365) is a line of subscription services offered by Microsoft as part of the Microsoft Office product line. The brand encompasses plans that allow use of the Microsoft Office software suite over the life of the subscription, as well as cloud-based software as a service products for business environments, such as hosted Exchange Server, Skype for Business Server, and SharePoint, among others. All Microsoft 365 plans include automatic updates to their respective software at no additional charge, as opposed to conventional licenses for these programs—where new versions require purchase of a new license",
    "winget": "Microsoft.Office",
    "choco": "office365business",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Bandicam",
    "Description": "Bandicam is a closed-source screen capture and screen recording software originally developed by Bandisoft and later by Bandicam Company that can take screenshots or record screen changes. Bandicam consists of three main modes. One is the Screen Recording mode, which can be used for recording a certain area on the PC screen",
    "winget": "BandicamCompany.Bandicam",
    "choco": "none",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "QQPlayer",
    "Description": "QQPlayer media player",
    "winget": "Tencent.QQPlayer",
    "choco": "none",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "4K Video Downloader",
    "Description": "4K Video Downloader allows downloading videos, playlists, channels and subtitles from YouTube, Facebook, Vimeo and other video sites in high quality",
    "winget": "OpenMedia.4KVideoDownloader",
    "choco": "4k-video-downloader",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Active@ Partition Recovery",
    "Description": "Active@ Partition Recovery is a freeware toolkit that helps to recover deleted and damaged logical drives and partitions within Windows, WinPE (recovery boot disk) and Linux (recovery LiveCD) environments",
    "winget": "LSoftTechnologies.ActivePartitionRecovery",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "HiSuite",
    "Description": "HUAWEI HiSuite is the official Android Smart Device Manager tool,HiSuite helps users to connect their HUAWEI smartphones and tablets to PC",
    "winget": "Huawei.HiSuite",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Android Studio",
    "Description": "Android Studio is the official integrated development environment for Google's Android operating system, built on JetBrains IntelliJ IDEA software and designed specifically for Android development",
    "winget": "Google.AndroidStudio",
    "choco": "androidstudio",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "LibreWolf",
    "Description": "LibreWolf is designed to increase protection against tracking and fingerprinting techniques, while also including a few security improvements. This is achieved through our privacy and security oriented settings and patches. LibreWolf also aims to remove all the telemetry, data collection and annoyances, as well as disabling anti-freedom features like DRM",
    "winget": "LibreWolf.LibreWolf",
    "choco": "librewolf",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Flow Launcher",
    "Description": "Dedicated to making your workflow flow more seamless. Search everything from applications, files, bookmarks, YouTube, Twitter and more. Flow will continue to evolve, designed to be open and built with the community at heart",
    "winget": "Flow-Launcher.Flow-Launcher",
    "choco": "flow-launcher",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "IconsExtract",
    "Description": "The IconsExtract utility scans the files and folders on your computer, and extract the icons and cursors stored in EXE, DLL, OCX, CPL, and in other file types",
    "winget": "none",
    "choco": "iconsext",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "AdGuard Home",
    "Description": "AdGuard Home is a network-wide software for blocking ads and tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that",
    "winget": "AdGuard.AdGuardHome",
    "choco": "adguardhome",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "Burp Suite Community Edition",
    "Description": "Burp Suite is an integrated platform for performing security testing of web applications. Its various tools work seamlessly together to support the entire testing process, from initial mapping and analysis of an application's attack surface, through to finding and exploiting security vulnerabilities.",
    "winget": "PortSwigger.BurpSuite.Community",
    "choco": "burp-suite-free-edition",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CoreTemp",
    "Description": "Core Temp is a compact, no fuss, small footprint, yet powerful program to monitor processor temperature and other vital information",
    "winget": "ALCPU.CoreTemp",
    "choco": "coretemp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ShareX",
    "Description": "Screen capture, file sharing and productivity tool",
    "winget": "ShareX.ShareX",
    "choco": "sharex",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "ONLY OFFICE",
    "Description": "ONLYOFFICE is a project developed by experienced IT experts from Ascensio System SIA, leading IT company with headquarters in Riga, Latvia. Originally ONLYOFFICE was designed for internal team collaboration. An attempt to introduce it to a wider audience proved to be successful: ONLYOFFICE received very positive feedback from the Internet community. As a result, its functionality was considerably revised and expanded that brought about a high and stable growth of users from different countries",
    "winget": "ONLYOFFICE.DesktopEditors",
    "choco": "onlyoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "ESET Internet Security",
    "Description": "Ideal for modern users concerned about their privacy, who actively use internet for shopping, banking, work and communication",
    "winget": "ESET.EndpointSecurity",
    "choco": "eset-internet-security",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "WinDirStat",
    "Description": "WinDirStat is a disk usage statistics viewer and cleanup tool for Microsoft Windows",
    "winget": "WinDirStat.WinDirStat",
    "choco": "windirstat",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Winmerge",
    "Description": "WinMerge is an Open Source differencing and merging tool for Windows. WinMerge can compare both  folders and files, presenting differences in a visual text format that is easy to understand and handle",
    "winget": "WinMerge.WinMerge",
    "choco": "winmerge",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Wireshark",
    "Description": "Wireshark is the worlds foremost and widely-used network protocol analyzer. It lets you see whats happening on your network at a microscopic level and is the de facto (and often de jure) standard across many commercial and non-profit enterprises, government agencies, and educational institutions. Wireshark development thrives thanks to the volunteer contributions of networking experts around the globe and is the continuation of a project started by Gerald Combs in 1998",
    "winget": "WiresharkFoundation.Wireshark",
    "choco": "wireshark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TeraCopy",
    "Description": "TeraCopy is designed to copy and move files at the maximum possible speed. It skips bad files during the copying process, and then displays them at the end of the transfer so that you can see which ones need attention. TeraCopy can automatically check the copied files for errors by calculating their CRC checksum values. It also provides a lot more information about the files being copied than its Windows counterpart. TeraCopy integrates with Windows Explorer's right-click menu and can be set as the default copy handler",
    "winget": "CodeSector.TeraCopy",
    "choco": "teracopy",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "QuickLook",
    "Description": "Quick Look is among the few features I missed from Mac OS X It enables very quick preview of file by pressing Space key while highlighting it without opening its associated application Then I decide to add this feature to Windows by myself which results this QuickLook project",
    "winget": "QL-Win.QuickLook",
    "choco": "quicklook",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "RepoZ",
    "Description": "RepoZ provides a quick overview of the git repositories on your development machine including their current branch and a short status information It uses the repositories on your machine to create an efficient navigation widget and makes sure youll never loose track of your work along the way",
    "winget": "AndreasWascher.RepoZ",
    "choco": "repoz",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Intel Graphics Command Center",
    "Description": "Dont have time to mess around with settings The Intel Graphics Command Center easily finds and tunes your games complete with recommended settings for your computer Use oneclick optimization for many popular titles and instantly get the most out of your system. (Windows 10 version 1709 or higher,6th Gen Intel Core Platforms or newer)",
    "winget": "9PLFNLNT3G5G",
    "choco": "none",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Go Programming Language",
    "Description": "Go is expressive concise clean and efficient Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines while its novel type system enables flexible and modular program construction Go compiles quickly to machine code yet has the convenience of garbage collection and the power of runtime reflection Its a fast statically typed compiled language that feels like a dynamically typed interpreted language",
    "winget": "Language GoLang.Go",
    "choco": "golang",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Rust",
    "Description": "Rust is a curlybrace blockstructured expression language It visually resembles the C language family but differs significantly in syntactic and semantic details Its design is oriented toward concerns of programming in the large that is of creating and maintaining boundaries  both abstract and operational  that preserve largesystem integrity availability and concurrency",
    "winget": "Rustlang.Rust.GNU",
    "choco": "rust",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Inkscape",
    "Description": "Inkscape is an opensource vector graphics editor similar to Adobe Illustrator Corel Draw Freehand or Xara X What sets Inkscape apart is its use of Scalable Vector Graphics SVG an open XMLbased W3C standard as the native format",
    "winget": "Inkscape.Inkscape",
    "choco": "inkscape",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Youtube Dl",
    "Description": "youtubedl is a small commandline program to download videos from YouTubecom and a few more sites It is written in Python and its not platform specific It should work in your Unix box in Windows or in Mac OS X It is released to the public domain which means you can modify it redistribute it or use it however you like",
    "winget": "youtube-dl.youtube-dl",
    "choco": "yt-dlp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Postman",
    "Description": "Postman helps you be more efficient while working with APIs Using Postman you can construct complex HTTP requests quickly organize them in collections and share them with your coworkers",
    "winget": "Postman.Postman",
    "choco": "postman",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Azure CLI",
    "Description": "The Azure CLI is available across Azure services and is designed to get you working quickly with Azure with an emphasis on automation",
    "winget": "Microsoft.AzureCLI",
    "choco": "azure-cli",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GameMaker Studio",
    "Description": "GameMaker Studio has everything you need for games development no matter what your level or expertise",
    "winget": "YoYoGames.GameMaker.Studio.2",
    "choco": "none",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Charles",
    "Description": "Charles is an HTTP proxy  HTTP monitor  Reverse Proxy that enables a developer to view all of the HTTP and SSL  HTTPS traffic between their machine and the Internet This includes requests responses and the HTTP headers which contain the cookies and caching information",
    "winget": "XK72.Charles",
    "choco": "charles",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Windows Media Player",
    "Description": "Media Player is designed to make listening to and watching your multimedia content more enjoyable At the heart of Media Player is a fullfeatured music library that allows you to quickly browse and play music as well as create and manage playlists All your content in the music and video folders on your PC will appear automatically in your library",
    "winget": "9WZDNCRFJ3PT",
    "choco": "none",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "espanso",
    "Description": "A crossplatform Text Expander written in Rust",
    "winget": "Espanso.Espanso",
    "choco": "espanso",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Ability Office",
    "Description": "Ability Office Standard offers 3 core applications essential for home and business Word Processor Spreadsheet and Presentation in one affordable office suite It also includes a Photoalbum and quick application Launcher Just perfect for working from home allowing files to be edited and exchanged with those back in the office and absolutely ideal for students and school children",
    "winget": "Ability.AbilityOffice.8.Standard",
    "choco": "abilityoffice",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Winbox",
    "Description": "Small utility that allows administration of MikroTik RouterOS using a fast and simple GUI",
    "winget": "Mikrotik.Winbox",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "SearchMyFiles",
    "Description": "SearchMyFiles allows you to make a very accurate search that cannot be done with Windows search For Example You can search all files created in the last 10 minutes with size between 500 and 700 bytes",
    "winget": "NirSoft.SearchMyFiles",
    "choco": "searchmyfiles",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "iTunes",
    "Description": "iTunes is the best way to organize and enjoy the music movies and TV shows you already have and shop for the ones you want to get Its home to Apple Music which gives you unlimited access to millions of songs curated playlists1 and Beats 1 radio hosted by Zane Lowe and a team of acclaimed DJs Enjoy all the entertainment iTunes has to offer on your Mac and PC",
    "winget": "Apple.iTunes",
    "choco": "itunes",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "StartIsBack++",
    "Description": "StartIsBack returns Windows 10 and Windows 8 a real fully featured start menu and start button behaving exactly like the ones in Windows 7",
    "winget": "StartIsBack.StartIsBack",
    "choco": "startisback",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Advanced SystemCare Free",
    "Description": "Over time your computer may accumulate with large quantities of useless temporary and duplicate files Advanced SystemCare 12 will help clean up these junk files and free up your disk space Also you can use our advanced tools to make registry clean for better use",
    "winget": "XPFFGSS4Z9M2TX",
    "choco": "afedteated",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Send Anywhere",
    "Description": "Send Anywhere is a multiplatform file sharing service where users can directly share digital content in real time",
    "winget": "Estmob.SendAnywhere",
    "choco": "none",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "YUMI Legacy",
    "Description": "YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary",
    "winget": "YumiUsb.Legacy",
    "choco": "yumi",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "YUMI UEFI",
    "Description": "YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary",
    "winget": "YumiUsb.UEFI",
    "choco": "yumi-uefi",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "OP Auto Clicker",
    "Description": "A fullfledged autoclicker with two modes of autoclicking at your dynamic cursor location or at a prespecified location The maximum amounts of clicked can also be set or left as infinite Hotkeys work in the background for convenience",
    "winget": "OPAutoClicker.OPAutoClicker",
    "choco": "autoclicker",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Spotube",
    "Description": "Spotube is a Flutter based lightweight spotify client It utilizes the power of Spotify  Youtubes public API  creates a hazardless performant  resource friendly User Experience",
    "winget": "KRTirtho.Spotube",
    "choco": "spotube",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Audio Switcher",
    "Description": "Easily switch the default audio device input or output on any Windows PC Vista and above Using this application you can switch output OR input sound devices at the click of a button or the press of a key I designed this application to be incredibly small and lightweight There is no bloat it does exactly what it should nothing more nothing less",
    "winget": "FortyOneLtd.AudioSwitcher",
    "choco": "audioswitcher",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "Microsoft Teams Classic Desktop",
    "Description": "Microsoft Teams is a messaging app for teams where all conversations meetings files and notes can be accessed by everyone all in one place Its a place for collaboration and work to happen in the open",
    "winget": "none",
    "choco": "microsoft-teams.install",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Microsoft Windows SDK",
    "Description": "The Windows 10 SDK for Windows 10 version 1809 provides the latest headers libraries metadata and tools for building Windows 10 apps NoteWindows 10 development targeting Windows 10 version 1903 or later requires Visual Studio 2017 or later This SDK will not be discovered by previous versions of Visual Studio",
    "winget": "none",
    "choco": "windows-sdk-10.1",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "RunAsDate Portable",
    "Description": "RunAsDate is a small utility that allows you to run a program in the date and time that you specify This utility doesnt change the current system date and time of your computer but it only injects the datetime that you specify into the desired application",
    "winget": "none",
    "choco": "runasdate",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "Visual Studio 2017 Build ",
    "Description": "These Build Tools allow you to build native and managed MSBuildbased applications without requiring the Visual Studio IDE There are options to install the Visual C compilers and libraries MFC ATL and CCLI support",
    "winget": "none",
    "choco": "visualstudio2017buildtools",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MSEdgeRedirect",
    "Description": "This tool filters and passes the command line arguments of Microsoft Edge processes into your default browser instead of hooking into the microsoftedge handler this should provide resiliency against future changes Additionally an Image File Execution Options mode is available to operate similarly to the Old EdgeDeflector Additional modes are planned for future versions",
    "winget": "rcmaehl.MSEdgeRedirect",
    "choco": "msedgeredirect",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 5",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime",
    "winget": "Microsoft.DotNet.HostingBundle.5",
    "choco": "dotnet-5.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 3",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "dotnetcore-3.0-desktopruntime",
    "choco": "Microsoft.DotNet.HostingBundle.3_1",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 6",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "Microsoft.DotNet.HostingBundle.6",
    "choco": "dotnet-6.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 7",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.",
    "winget": "Microsoft.DotNet.AspNetCore.7",
    "choco": "dotnet-7.0-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "NET Desktop Runtime 8",
    "Description": "NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the NET Runtime",
    "winget": "Microsoft.DotNet.DesktopRuntime.8",
    "choco": "dotnet-desktopruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Viber",
    "Description": "Viber is a mobile application that lets you make free phone calls and send text messages to anyone who also has the application installed You can call or text any Viber user anywhere in the world for free",
    "winget": "XPFM5P5KDWF0JP",
    "choco": "viber",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "StartAllBack",
    "Description": "Introducing  StartAllBack Windows 11 from a better timeline Embrace enhance unsweep classic UI from under the rug",
    "winget": "StartIsBack.StartAllBack",
    "choco": "startallback",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "DiskGenius Free",
    "Description": "With powerful capabilities and userfriendly interface DiskGenius Free Edition provides a robust solution for individuals and organizations to seek efficient disk management",
    "winget": "Eassos.DiskGenius",
    "choco": "diskgenius",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "UNFORMAT",
    "Description": "UNFORMAT is a software utility created to solve almost all data loss scenarios due to logical failure It can recover deleted files on a disk or restore deleted or damaged partitions and volumes As well as recovers data after using the FORMAT command",
    "winget": "LSoftTechnologies.UNFORMAT",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Active@ UNDELETE",
    "Description": "Active UNDELETE helps you to recover deleted files and restore deleted partitions from a variety of file systems such as FAT NTFS NTFS  EFS MacOS HFS ApFS Linux ext2 ext3 ext4 ZFS Unix UFS Advanced scan algorithms help to restore files even from severely damaged disks Sophisticated userfriendly UI makes navigation through your data a breeze",
    "winget": "LSoftTechnologies.ActiveUNDELETE",
    "choco": "none",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "HxD Hex Editor",
    "Description": "HxD is a carefully designed and fast hex editor which additionally to raw disk editing and modifying of main memory RAM handles files of any size",
    "winget": "MHNexus.HxD",
    "choco": "hxd",
    "default": [],
    "category": "Disk Tools",
    "check": "false"
  },
  {
    "Name": "Epic Games Launcher",
    "Description": "The Epic Games Launcher is how you obtain the Unreal Game Engine modding tools and other Epic Games like Fortnite and the new Epic Games Store",
    "winget": "EpicGames.EpicGamesLauncher",
    "choco": "epicgameslauncher",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Vivaldi",
    "Description": "The new Vivaldi browser protects you from trackers blocks unwanted ads and puts you in control with unique builtin features Get Vivaldi and browse fast",
    "winget": "VivaldiTechnologies.Vivaldi",
    "choco": "vivaldi",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "Microsoft PC Manager",
    "Description": "Microsoft PC manager a good way to protect your personal computer and optimize performance provides PC cleanup antivirus and Windows update making your computer safe and secure",
    "winget": "9PM860492SZD",
    "choco": "none",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Openshot",
    "Description": "OpenShot Video Editor is an awardwinning opensource video editor available on Linux Mac and Windows OpenShot can create stunning videos films and animations with an easytouse interface and rich set of features",
    "winget": "OpenShot.OpenShot",
    "choco": "openshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "WhatsApp",
    "Description": "WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform centralized messaging and voiceoverIP VoIP service owned by Facebook Inc It allows users to send text messages and voice messages make voice and video calls and share images documents user locations and other content",
    "winget": "9NKSQGP7F2NH",
    "choco": "none",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Paint.NET",
    "Description": "PaintNET is image and photo editing software for PCs that run Windows",
    "winget": "dotPDNLLC.paintdotnet",
    "choco": "paint.net",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "Stretchly",
    "Description": "stretchly is a crossplatform electron app that reminds you to take breaks when working on your computer By default it runs in your tray and displays a reminder window containing an idea for a microbreak for 20 seconds every 10 minutes",
    "winget": "Stretchly.Stretchly",
    "choco": "stretchly",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Microsoft Silverlight",
    "Description": "Silverlight is a powerful development tool for creating engaging interactive user experiences for Web and mobile applications",
    "winget": "none",
    "choco": "silverlight",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "TreeSize",
    "Description": "Every hard disk is too small if you just wait long enough TreeSize Free tells you where precious disk space has gone",
    "winget": "JAMSoftware.TreeSize.Free",
    "choco": "treesizefree",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Dot Net 3.5",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.DesktopRuntime.3_1",
    "choco": "dotnet3.5",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Flash Player ActiveX",
    "Description": "The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform",
    "winget": "none",
    "choco": "flashplayeractivex",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Google Drive",
    "Description": "Google Drive  All your files  everywhere Safely store your files and access them from any device Choose folders on your computer to sync with Google Drive or backup to Google Photos and access all of your content directly from your PC or Mac",
    "winget": "none",
    "choco": "googledrive",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Dot Net 4.5.2",
    "Description": "The Microsoft NET Framework 452 is a highly compatible inplace update to the Microsoft NET Framework 4 Microsoft NET Framework 45 and Microsoft NET Framework 451",
    "winget": "none",
    "choco": "dotnet4.5.2",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Dropbox",
    "Description": "Organize all your team's content, tune out distractions, and get everyone coordinated with the world's first smart workspace",
    "winget": "Dropbox.Dropbox",
    "choco": "dropbox",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "cURL",
    "Description": "Command line tool and library for transferring data with URLs",
    "winget": "cURL.cURL",
    "choco": "curl",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PDF Creator",
    "Description": "PDFCreator lets you convert any printable document to PDF",
    "winget": "pdfforge.PDFCreator",
    "choco": "pdfcreator",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Autoruns",
    "Description": "This utility shows you what programs are configured to run during system bootup or login",
    "winget": "Microsoft.Sysinternals.Autoruns",
    "choco": "autoruns",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Microsoft OneDrive",
    "Description": "Save your files and photos to OneDrive and access them from any device anywhere",
    "winget": "Microsoft.OneDrive",
    "choco": "onedrive",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Process Explorer",
    "Description": "Process Explorer shows you information about which handles and DLLs processes have opened or loaded",
    "winget": "Microsoft.Sysinternals.ProcessExplorer",
    "choco": "procexp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "FFmpeg",
    "Description": "FFmpeg is a widelyused crossplatform multimedia framework which can process almost all common and many uncommon media formats It has over 1000 internal components to capture decode encode modify combine stream media and it can make use of dozens of external libraries to provide more capabilities",
    "winget": "Gyan.FFmpeg",
    "choco": "ffmpeg",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "OpenVPN Connect",
    "Description": "The official OpenVPN Connect client software developed and maintained by OpenVPN Inc",
    "winget": "OpenVPNTechnologies.OpenVPNConnect",
    "choco": "openvpn-connect",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Git Large File Storage",
    "Description": "Git Large File Storage LFS replaces large files such as audio samples videos datasets and graphics with text pointers inside Git while storing the file contents on a remote server like GitHubcom or GitHub Enterprise",
    "winget": "none",
    "choco": "git-lfs",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Nmap",
    "Description": "Nmap Network Mapper is a free and open source utility for network discovery and security auditing",
    "winget": "Insecure.Nmap",
    "choco": "nmap",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "UltraVNC",
    "Description": "UltraVNC is an open source application that uses the VNC protocol to control another computer remotely over a network connection UltraVNC allows the use of a remote computer",
    "winget": "uvncbvba.UltraVnc",
    "choco": "ultravnc",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Plex",
    "Description": "Plex is a global streaming media service and a clientserver media player platform made by Plex Inc",
    "winget": "Plex.Plex",
    "choco": "plex",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Plex Media Server",
    "Description": "Plex Media Server helps you organise your media and stream it to your devices",
    "winget": "Plex.PlexMediaServer",
    "choco": "plexmediaserver",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Microsoft Visio Viewer",
    "Description": "By using Microsoft Visio 2016 Viewer Visio users can freely distribute Visio drawings files with a vsdx vsdm vsd vdx vdw vstx vstm vst or vtx extension to team members partners customers or others even if the recipients do not have Visio installed on their computer",
    "winget": "Microsoft.VisioViewer",
    "choco": "visioviewer",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Keyn Stroke",
    "Description": "KeynStroke makes it easy for your audience to follow your actions on the screen",
    "winget": "none",
    "choco": "key-n-stroke",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Fing",
    "Description": "Fing App is a free network scanner that makes you discover all connected devices run internet speed tests and help troubleshoot network and device issues Get Fingbox for more advanced security and protection for your network",
    "winget": "none",
    "choco": "fing",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Ryujinx",
    "Description": "Ryujinx is an opensource Nintendo Switch emulator created by gdkchan and written in C This emulator aims at providing excellent accuracy and performance a userfriendly interface and consistent builds",
    "winget": "none",
    "choco": "ryujinx --params '/DesktopShortcut'",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Omnify Hotspot",
    "Description": "The best virtual router to turn your PC into a WiFi hotspot  repeater WiFi hotspot allows you to create a wireless access point and share your internet Its easy to use and quick to start as you only need to give it a name and password and then connect your smartphone tablet media player ereader printer laptop and other wireless devices The network name can also include Unicode characters and Emojis",
    "winget": "none",
    "choco": "omnifyhotspot",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "MKVToolNix",
    "Description": "MKVToolNix is a set of tools to create alter and inspect Matroska files under Linux other Unices and Windows",
    "winget": "MoritzBunkus.MKVToolNix",
    "choco": "mkvtoolnix",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Neat Download Manager",
    "Description": "Neat Download Manager is a free Internet Download Manager for Windows",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.neatdownloadmanager.com/file/NeatDM_setup.exe",
        "args": "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath",
        "portable": "false",
        "launcher": "NeatDM_setup.exe"
      }
    ],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "x630ce for all games",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x86.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x86.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "x630ce x86",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x86.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x86.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "x630ce x64",
    "Description": "Xbox 360 Controller Emulator” allows your controller (gamepad, joystick, steering wheel, pedals, etc.) to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like “Grand Theft Auto” or “Saints Row” • Digitally Signed",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.x360ce.com/files/x360ce_x64.zip",
        "args": "none",
        "portable": "true",
        "launcher": "x360ce_x64.exe"
      }
    ],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Microsoft .NET SDK 7",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.SDK.7",
    "choco": "dotnet-7.0-sdk",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft .NET SDK 8",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.SDK.Preview",
    "choco": "dotnet-sdk",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Microsoft ASP.NET Core Runtime 7.0",
    "Description": "NET is a free crossplatform opensource developer platform for building many different types of applications",
    "winget": "Microsoft.DotNet.AspNetCore.7",
    "choco": "dotnet-aspnetruntime",
    "default": [],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "HFS HTTP File Server",
    "Description": "You can use HFS HTTP File Server to send and receive files Its different from classic file sharing because it uses web technology to be more compatible with todays Internet It also differs from classic web servers because its very easy to use and runs right outofthe box",
    "winget": "none",
    "choco": "hfs",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Cemu",
    "Description": "Cemu is a highly experimental software to emulate Wii U applications on PC",
    "winget": "Cemu.Cemu",
    "choco": "cemu",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Chatterino",
    "Description": "Chatterino is a chat client for Twitch chat that offers a clean and customizable interface for a better streaming experience",
    "winget": "ChatterinoTeam.Chatterino",
    "choco": "chatterino",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Clementine",
    "Description": "Clementine is a modern music player and library organizer supporting various audio formats and online radio services",
    "winget": "Clementine.Clementine",
    "choco": "clementine",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Clink",
    "Description": "Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows adding features like syntax highlighting and improved history",
    "winget": "chrisant996.Clink",
    "choco": "clink",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CMake",
    "Description": "CMake is an opensource crossplatform family of tools designed to build test and package software",
    "winget": "Kitware.CMake",
    "choco": "cmake",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "CopyQ Clipboard Manager",
    "Description": "CopyQ is a clipboard manager with advanced features allowing you to store edit and retrieve clipboard history",
    "winget": "hluk.CopyQ",
    "choco": "copyq",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Crystal Disk Info",
    "Description": "Crystal Disk Info is a disk health monitoring tool that provides information about the status and performance of hard drives It helps users anticipate potential issues and monitor drive health",
    "winget": "CrystalDewWorld.CrystalDiskInfo",
    "choco": "crystaldiskinfo",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Crystal Disk Mark",
    "Description": "Crystal Disk Mark is a disk benchmarking tool that measures the read and write speeds of storage devices It helps users assess the performance of their hard drives and SSDs",
    "winget": "CrystalDewWorld.CrystalDiskMark",
    "choco": "crystaldiskmark",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Darktable",
    "Description": "Opensource photo editing tool offering an intuitive interface advanced editing capabilities and a nondestructive workflow for seamless image enhancement",
    "winget": "darktable.darktable",
    "choco": "darktable",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "EA App",
    "Description": "EA App is a platform for accessing and playing Electronic Arts games",
    "winget": "ElectronicArts.EADesktop",
    "choco": "ea-app",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Falkon",
    "Description": "Falkon is a lightweight and fast web browser with a focus on user privacy and efficiency",
    "winget": "KDE.Falkon",
    "choco": "falkon",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "File Converter",
    "Description": "File Converter is a very simple tool which allows you to convert and compress one or several files using the context menu in windows explorer",
    "winget": "AdrienAllard.FileConverter",
    "choco": "file-converter",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Files",
    "Description": "Alternative file explorer",
    "winget": "none",
    "choco": "files",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Flameshot",
    "Description": "Flameshot is a powerful yet simple to use screenshot software offering annotation and editing features",
    "winget": "Flameshot.Flameshot",
    "choco": "flameshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Lightshot",
    "Description": "Ligthshot is an Easytouse lightweight screenshot software tool where you can optionally edit your screenshots using different tools share them via Internet andor save to disk and customize the available options",
    "winget": "Skillbrains.Lightshot",
    "choco": "lightshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "F.lux",
    "Description": "flux adjusts the color temperature of your screen to reduce eye strain during nighttime use",
    "winget": "flux.flux",
    "choco": "flux",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "GitHub CLI",
    "Description": "GitHub CLI is a commandline tool that simplifies working with GitHub directly from the terminal",
    "winget": "GitHub.cli",
    "choco": "gh",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GOG Galaxy",
    "Description": "GOG Galaxy is a gaming client that offers DRMfree games additional content and more",
    "winget": "GOG.Galaxy",
    "choco": "goggalaxy",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Greenshot",
    "Description": "Greenshot is a lightweight screenshot software tool with builtin image editor and customizable capture options",
    "winget": "Greenshot.Greenshot",
    "choco": "greenshot",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Hexchat",
    "Description": "HexChat is a free opensource IRC Internet Relay Chat client with a graphical interface for easy communication",
    "winget": "HexChat.HexChat",
    "choco": "hexchat",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "HWMonitor",
    "Description": "HWMonitor is a hardware monitoring program that reads PC systems main health sensors",
    "winget": "CPUID.HWMonitor",
    "choco": "hwmonitor",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ImageGlass",
    "Description": "ImageGlass is a versatile image viewer with support for various image formats and a focus on simplicity and speed",
    "winget": "DuongDieuPhap.ImageGlass",
    "choco": "imageglass",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Itch.io",
    "Description": "Itchio is a digital distribution platform for indie games and creative projects",
    "winget": "ItchIo.Itch",
    "choco": "itch",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "KDE Connect",
    "Description": "KDE Connect allows seamless integration between your KDE desktop and mobile devices",
    "winget": "KDE.KDEConnect",
    "choco": "kdeconnect-kde",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "KeePassXC",
    "Description": "KeePassXC is a crossplatform opensource password manager with strong encryption features",
    "winget": "KeePassXCTeam.KeePassXC",
    "choco": "keepassxc",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Lazygit",
    "Description": "Simple terminal UI for git commands",
    "winget": "JesseDuffield.lazygit",
    "choco": "lazygit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "LocalSend",
    "Description": "An open source crossplatform alternative to AirDrop",
    "winget": "LocalSend.LocalSend",
    "choco": "localsend.install",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Fork",
    "Description": "Fork  a fast and friendly git client",
    "winget": "Fork.Fork",
    "choco": "git-fork",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PulsarEdit",
    "Description": "A Communityled HyperHackable Text Editor",
    "winget": "Pulsar-Edit.Pulsar",
    "choco": "pulsar",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Shotcut",
    "Description": "Shotcut is a free open source crossplatform video editor",
    "winget": "Meltytech.Shotcut",
    "choco": "Shotcut",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "PaleMoon",
    "Description": "Pale Moon is an Open Source Goannabased web browser available for Microsoft Windows and Linux with other operating systems in development focusing on efficiency and ease of use",
    "winget": "MoonchildProductions.PaleMoon",
    "choco": "paleMoon",
    "default": [],
    "category": "Web Browsers",
    "check": "false"
  },
  {
    "Name": "JoyToKey",
    "Description": "enables PC game controllers to emulate the keyboard and mouse input",
    "winget": "JTKsoftware.JoyToKey",
    "choco": "joytokey",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Windows Auto Dark Mode",
    "Description": "Automatically switches between the dark and light theme of Windows 10 and Windows 11",
    "winget": "Armin2208.WindowsAutoNightMode",
    "choco": "auto-dark-mode",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Windows Firewall Control",
    "Description": "Windows Firewall Control is a powerful tool which extends the functionality of Windows Firewall and provides new extra features which makes Windows Firewall better",
    "winget": "BiniSoft.WindowsFirewallControl",
    "choco": "windowsfirewallcontrol",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TightVNC",
    "Description": "TightVNC is a free and Open Source remote desktop software that lets you access and control a computer over the network With its intuitive interface you can interact with the remote screen as if you were sitting in front of it You can open files launch applications and perform other actions on the remote desktop almost as if you were physically there",
    "winget": "GlavSoft.TightVNC",
    "choco": "TightVNC",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Python Version Manager",
    "Description": "pyenv for Windows is a simple python version management tool It lets you easily switch between multiple versions of Python",
    "winget": "none",
    "choco": "pyenv-win",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Pixi",
    "Description": "Pixi is a fast software package manager built on top of the existing conda ecosystem Spins up development environments quickly on Windows macOS and Linux Pixi supports Python R CC Rust Ruby and many other languages",
    "winget": "prefix-dev.pixi",
    "choco": "pixi",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "VSCodium",
    "Description": "VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS Code",
    "winget": "VSCodium.VSCodium",
    "choco": "vscodium",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Thonny Python IDE",
    "Description": "Python IDE for beginners",
    "winget": "AivarAnnamaa.Thonny",
    "choco": "thonny",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Poedit",
    "Description": "Poedit translations editor The best way to translate apps and sites",
    "winget": "none",
    "choco": "none",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Adobe Acrobat Reader",
    "Description": "Adobe Acrobat Reader DC software is the free trusted global standard for viewing printing signing sharing and annotating PDFs Its the only PDF viewer that can open and interact",
    "winget": "Adobe.Acrobat.Reader.32-bit",
    "choco": "adobereader",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Flash Player Plugin",
    "Description": "The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform",
    "winget": "none",
    "choco": "flashplayerplugin",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Sysinternals",
    "Description": "The Sysinternals Troubleshooting Utilities have been rolled up into a single suite of tools",
    "winget": "none",
    "choco": "sysinternals",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "SelfishNet",
    "Description": "Control your internet bandwidth with SelfishNet V3, ARP Spoofing application.",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/nov0caina/SelfishNetV3/releases/download/SelfishNetV3.0.0/SelfishNetV3.0.0_Installer.zip",
        "args": "/quiet",
        "portable": "false",
        "launcher": "SelfishNetV3_Installer.msi"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NTLite",
    "Description": "Integrate updates drivers automate Windows and application setup speedup Windows deployment process and have it all set for the next time",
    "winget": "Nlitesoft.NTLite",
    "choco": "ntlite-free",
    "default": [],
    "category": "Drivers",
    "check": "false"
  },
  {
    "Name": "Olive Video Editor",
    "Description": "Olive is a free nonlinear video editor for Windows",
    "winget": "OliveTeam.OliveVideoEditor",
    "choco": "olive",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Mark Text",
    "Description": "A simple and elegant opensource markdown editor that focused on speed and usability",
    "winget": "MarkText.MarkText",
    "choco": "marktext.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "pCloud Drive",
    "Description": "pCloud is a file hosting service also called cloud storage or online storage founded in Switzerland in 2013",
    "winget": "pCloudAG.pCloudDrive",
    "choco": "pcloud",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Hurl",
    "Description": "Hurl is a command line tool that runs HTTP requests defined in a simple plain text format",
    "winget": "Orange-OpenSource.Hurl",
    "choco": "hurl",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "File Hash Generator",
    "Description": "Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632 checksums for multiple files Calculate hashes and checksums for the whole file or just specified bytes",
    "winget": "BinaryMark.FileHashGenerator",
    "choco": "file-hash-generator",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Multimark down",
    "Description": "MultiMarkdown or MMD, is a tool to help turn minimally marked-up plain text into well formatted documents, including HTML, PDF",
    "winget": "none",
    "choco": "multimarkdown",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "PCSX2 Emulator",
    "Description": "PCSX2 is a free and opensource PlayStation 2 PS2 emulator Its purpose is to emulate the PS2s hardware",
    "winget": "none",
    "choco": "pcsx2.portable",
    "default": [],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "RetroArch",
    "Description": "RetroArch is a frontend for emulators game engines and media players It enables you to run classic games on a wide range of computers and consoles through its slick graphical interface",
    "winget": "Libretro.RetroArch",
    "choco": "retroarch",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Free Virtual Keyboard",
    "Description": "Free Virtual Keyboard works on any Windows based UMPC with a passive touchscreen Ultramobile PC Tablet PC and Panel PC",
    "winget": "none",
    "choco": "free-virtual-keyboard",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "TypeScript for Visual Studio 2017 and 2019",
    "Description": "This is a standalone power tool release of TypeScript for Visual Studio 2017 and 2019 It includes both the TypeScript experience for Visual Studio and a standalone compiler that can be used from the command line",
    "winget": "none",
    "choco": "typescript-vs2017-vs2019",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Caret",
    "Description": "Beautiful  Clever Markdown Editor Download trial",
    "winget": "Caret.Caret",
    "choco": "caret",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "iSpy",
    "Description": "iSpy is the worlds most popular open source video surveillance application Its compatible with the the vast majority of consumer webcams and IP cameras With more than 2 million users worldwide iSpy works with more cameras and devices than anything else on the market",
    "winget": "none",
    "choco": "ispy",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "WavPack",
    "Description": "WavPack is a completely open audio compression format providing lossless highquality lossy and a unique hybrid compression mode Although the technology is loosely based on previous versions of WavPack the new version 4 format has been designed from the ground up to offer unparalleled performance and functionality",
    "winget": "none",
    "choco": "wavpack",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "ProcessThreadsView",
    "Description": "ProcessThreadsView is a small utility that displays extensive information about all threads of the process that you choose",
    "winget": "none",
    "choco": "processthreadsview",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Zulu",
    "Description": "Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard Zulu is 100 open source and freely downloadable Now Java developers system administrators and end users can enjoy the full benefits of open source Java with deployment flexibility and control over upgrade timing",
    "winget": "Azul.Zulu.11.JRE",
    "choco": "zulu12",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GitHubReleaseNotesv1",
    "Description": "Generate Release Notes in MarkDown format from a GitHub project",
    "winget": "StefHeyenrath.GitHubReleaseNotes",
    "choco": "githubreleasenotes",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Tome",
    "Description": "Developing games is all about data With game systems for modifying data and user interfaces for presenting it finding a sophisticated data model is key to creating successful games Even more being able to change this data and iterate on a daytoday basis is mandatory in todays production cycles",
    "winget": "none",
    "choco": "tome-editor",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Win32 OpenSSH",
    "Description": "OpenSSH is a complete implementation of the SSH protocol version 2 for secure remote login command execution and file transfer",
    "winget": "Microsoft.OpenSSH.Beta",
    "choco": "openssh",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Komodo Edit",
    "Description": "Komodo Edit is a free and open source text editor for dynamic programming languages",
    "winget": "ActiveState.KomodoEdit",
    "choco": "komodo-edit",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "FreeCAD",
    "Description": "A free and opensource multiplatform 3D parametric modeler",
    "winget": "FreeCAD.FreeCAD",
    "choco": "freecad",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "SQLite",
    "Description": "SQLite is an inprocess library that implements a selfcontained serverless zeroconfiguration transactional SQL database engine SQLite is an embedded SQL database engine Unlike most other SQL databases SQLite does not have a separate server process SQLite reads and writes directly to ordinary disk files A complete SQL database with multiple tables indices triggers and views is contained in a single disk file",
    "winget": "SQLite.SQLite",
    "choco": "sqlite",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MkDocs",
    "Description": "MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file",
    "winget": "none",
    "choco": "mkdocs",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MkDocs Material Theme",
    "Description": "MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file",
    "winget": "none",
    "choco": "mkdocs-material",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "PuTTY",
    "Description": "A free implementation of SSH and Telnet along with an xterm terminal emulator",
    "winget": "PuTTY.PuTTY",
    "choco": "putty",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "WinSCP",
    "Description": "WinSCP is an open source free SFTP client FTP client WebDAV client S3 client and SCP client for Windows Its main function is file transfer between a local and a remote computer Beyond this WinSCP offers scripting and basic file manager functionality",
    "winget": "WinSCP.WinSCP",
    "choco": "winscp",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "LibreOffice Still",
    "Description": "LibreOffice is the free powerpacked Open Source personal productivity suite for Windows macOS and Linux that gives you six featurerich applications for all your document production and data processing needs",
    "winget": "none",
    "choco": "libreoffice-still",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Aio Runtimes",
    "Description": "All in One Runtimes also known as AIO Runtimes is a program that integrates essential runtime packages ensuring the seamless functionality of all programs by installing them automatically",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://allinoneruntimes.org/files/aio-runtimes_v2.5.0.exe",
        "args": "none",
        "portable": "false",
        "launcher": "aio-runtimes_v2.5.0.exe"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Visual-C-Runtimes All in One Oct 2024",
    "Description": "This archive contains the latest version (Oct 2024) of all VCRedist Visual Studio C++ runtimes, installable with a single click by running the included batch file installer",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://uk1-dl.techpowerup.com/files/ueTG1ZUGfNLEEZoDA7FORw/1731410753/Visual-C-Runtimes-All-in-One-Oct-2024.zip",
        "args": "none",
        "portable": "false",
        "launcher": "install_all.bat"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "GPU-Z",
    "Description": "GPUZ is a lightweight system utility designed to provide vital information about your video card and graphics processor",
    "winget": "TechPowerUp.GPU-Z",
    "choco": "gpu-z",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "MemTest86",
    "Description": "MemTest86 boots from a USB flash drive and tests the RAM in your computer for faults using a series of comprehensive algorithms and test patterns",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.memtest86.com/downloads/memtest86-usb.zip",
        "launcher": "imageUSB.exe",
        "args": "/silent",
        "portable": "ture"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Memtest86 Plus",
    "Description": "Memtest86 Plus v6 is a unified, free, open-source memory testing tool, released under GNU GPL v2.0. The new v6 code base (originally called PCMemTest) was provided by Martin Whitaker, based on Memtest86+ v5, developed by Sam Demeulemeester. Both are now working on Memtest86+",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://www.memtest.org/download/v7.20/mt86plus_7.20_USB_Installer.exe",
        "launcher": "mt86plus_7.20_USB_Installer.exe",
        "args": "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath",
        "portable": "ture"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "VLC Skins",
    "Description": "Put the downloaded VLT files in the following folder: On Windows: the skins folder in the VLC installation directory (e.g. C:\\Program Files\\VideoLAN\\VLC\\skins) On Linux/Unix: ~/.local/share/vlc/skins2",
    "winget": "none",
    "choco": "vlc-skins",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "GrepWin",
    "Description": "Regular expression search and replace for Windows",
    "winget": "StefansTools.grepWin",
    "choco": "grepwin",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NICE DCV Server",
    "Description": "NICE DCV is a remote display protocol that securely streams desktops and apps from cloud or data centers to any device, enabling graphics-intensive applications on Amazon EC2. It's used for HPC workloads and by services like Appstream 2.0 and AWS RoboMaker",
    "winget": "none",
    "choco": "nice-dcv-server",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "NTag",
    "Description": "NTag is a cross platform-graphical tag editor focused on everyday life use cases",
    "winget": "nrittsti.NTag",
    "choco": "ntag",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Radeon™ RX 570 Adrenalin Edition Windows 10",
    "Description": "RX 570 Driver Adrenalin 24.3.1 (WHQL Recommended)",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-24.3.1-win10-win11-mar20-vega-polaris.exe",
        "args": "/SILENT",
        "launcher": "whql-amd-software-adrenalin-edition-24.3.1-win10-win11-mar20-vega-polaris.exe",
        "portable": "false"
      }
    ],
    "category": "GPU Drivers",
    "check": "false"
  },
  {
    "Name": "Radeon™ RX 580 Adrenalin Edition Windows 10",
    "Description": "RX 580 Adrenalin 24.9.1 (WHQL Recommended)",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-24.9.1-win10-win11-vega-polaris.exe",
        "args": "/SILENT",
        "launcher": "whql-amd-software-adrenalin-edition-24.9.1-win10-win11-vega-polaris.exe",
        "portable": "false"
      }
    ],
    "category": "GPU Drivers",
    "check": "false"
  },
  {
    "Name": "Visual C++ Redistributable Runtimes AIO Repack",
    "Description": "Visual C++ Redistributable Runtimes AIO Repack is all the latest Microsoft Visual C++ Redistributable Runtimes, without the original setup bloat payload",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "portable": "false",
        "launcher": "VisualCppRedist_AIO_x86_x64.exe",
        "url": "https://www.majorgeeks.com/index.php?ct=files&action=download&",
        "args": "/SILENT"
      }
    ],
    "category": "Runtimes",
    "check": "false"
  },
  {
    "Name": "Volume2",
    "Description": "Advanced Windows volume control",
    "winget": "irzyxa.Volume2Portable",
    "choco": "volume2",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "qBittorrent Enhanced Edition",
    "Description": "[Unofficial] qBittorrent Enhanced, based on qBittorrent",
    "winget": "wingetinstallc0re100.qBittorrent-Enhanced-Edition",
    "choco": "qbittorrent-enhanced",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Aspia",
    "Description": "Remote desktop and file transfer tool",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/dchapyshev/aspia/releases/download/v2.7.0/aspia-host-2.7.0-x86_64.msi",
        "launcher": "aspia-host-2.7.0-x86_64.msi",
        "args": "/silent",
        "portable": "false"
      }
    ],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "SimpleTransfer Desktop",
    "Description": "Simple Transfer is the easiest way of transferring your Photos and Videos to computer and other iOS devices wirelessly or USB. No need for cable, iTunes or extra softwares on your computer!",
    "winget": "Rambax.SimpleTransfer",
    "choco": "simpletransfer",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Twitch Desktop App",
    "Description": "Servers - A virtual home for your community to chat, watch, and play with fully customizable text and voice rooms",
    "winget": "none",
    "choco": "twitch",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Remote Desktop Manager",
    "Description": "Remote Connections & Passwords. Everywhere!",
    "winget": "Devolutions.RemoteDesktopManager",
    "choco": "rdm",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Torrid",
    "Description": "Torrid is a multi-server, multi-client, multi-tracker Remote Torrent Client which allows any number of installed torrent engines.",
    "winget": "none",
    "choco": "torrid",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Mediamonkey",
    "Description": "Manage small to large collections of audio files, videos and playlists (100,000+), whether on a hard drive, network, or CDs. Rip CDs, download podcasts, lookup artwork and other missing information online, tag almost any audio or video format, and automatically rename/re-organize files on your hard drive",
    "winget": "VentisMedia.MediaMonkey",
    "choco": "mediamonkey",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "MediaInfo",
    "Description": "Convenient unified display of the most relevent technical and tag data for video and audio files",
    "winget": "MediaArea.MediaInfo.GUI",
    "choco": "mediainfo",
    "default": [],
    "category": "Media Tools",
    "check": "false"
  },
  {
    "Name": "Universal Media Server",
    "Description": "Universal Media Server is a DLNA-compliant UPnP Media Server. It is capable of sharing video, audio and images between most modern devices",
    "winget": "UniversalMediaServer.UniversalMediaServer",
    "choco": "ums",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "K-Lite Codec Pack Standard",
    "Description": "The K-Lite Codec Pack is a collection of DirectShow filters, VFW/ACM codecs, and tools. Codecs and DirectShow filters are needed for encoding and decoding audio and video formats. The K-Lite Codec Pack is designed as a user-friendly solution for playing all your audio and movie files. With the K-Lite Codec Pack you should be able to play all the popular audio and video formats and even several less common formats",
    "winget": "CodecGuide.K-LiteCodecPack.Standard",
    "choco": "k-litecodecpack-standard",
    "default": [],
    "category": "Media",
    "check": "false"
  },
  {
    "Name": "PowerISO",
    "Description": "PowerISO provides an all-in-one solution. You can do every thing with your ISO files and disc image files",
    "winget": "PowerSoftware.PowerISO",
    "choco": "poweriso",
    "default": [],
    "category": "Compression",
    "check": "false"
  },
  {
    "Name": "Screen To Gif",
    "Description": "This tool allows you to record a selected area of your screen, live feed from your webcam or live drawings from a sketchboard. Afterwards, you can edit and save the animation as a gif, apng, video, psd or png images",
    "winget": "NickeManarin.ScreenToGif",
    "choco": "screentogif.portable",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Figma",
    "Description": "The collaborative interface design tool Build better products as a team. Design, prototype, and gather feedback all in one place with Figma",
    "winget": "Figma.Figma",
    "choco": "figma",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "EarTrumpet",
    "Description": "EarTrumpet is a powerful volume control app for Windows",
    "winget": "File-New-Project.EarTrumpet",
    "choco": "eartrumpet",
    "default": [],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Visual Studio Code Insiders",
    "Description": "Microsoft Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications. Microsoft Visual Studio Code is free and available on your favorite platform - Linux, macOS, and Windows",
    "winget": "Microsoft.VisualStudioCode.Insiders",
    "choco": "vscode-insiders",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "AyuGramDesktop",
    "Description": " Desktop Telegram client with good customization and Ghost mode",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/AyuGram/AyuGramDesktop/releases/download/v5.10.3/AyuGram.exe",
        "portable": "ture",
        "args": "none",
        "launcher": "AyuGram.exe"
      }
    ],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Zettlr",
    "Description": "Zettlr is a supercharged markdown editor that combines many writing editor features and collect them in one application. It aims at speeding up your workflow and help you write without any interruptions",
    "winget": "Zettlr.Zettlr",
    "choco": "zettlr",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "RustDesk",
    "Description": "An open-source remote desktop software, works out of the box, no configuration required, written in Rust",
    "winget": "RustDesk.RustDesk",
    "choco": "rustdesk",
    "default": [],
    "category": "File Sharing",
    "check": "false"
  },
  {
    "Name": "Ente Auth",
    "Description": "An end-to-end encrypted, cross platform and free app for storing your 2FA codes with cloud backups",
    "winget": "none",
    "choco": "ente-auth",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "SQLiteStudio",
    "Description": "SQLiteStudio is desktop application for browsing and editing SQLite database files. It is aimed for people, who know what SQLite is, or what relational databases are in general",
    "winget": "sqlitestudio.pl.SQLiteStudio",
    "choco": "sqlitestudio",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "DuckStation",
    "Description": " Fast PlayStation 1 emulator for x86-64/AArch32/AArch64/RV64",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/stenzek/duckstation/releases/download/latest/duckstation-windows-x64-release.zip",
        "portable": "ture",
        "args": "none",
        "launcher": "duckstation-qt-x64-ReleaseLTCG.exe"
      }
    ],
    "category": "Portable",
    "check": "false"
  },
  {
    "Name": "Authme - Simple 2FA",
    "Description": "Simple 2FA desktop application",
    "winget": "none",
    "choco": "authme.portable",
    "default": [],
    "category": "Security",
    "check": "false"
  },
  {
    "Name": "SuperCopier2",
    "Description": "SuperCopier2 SuperCopier replaces Windows explorer file copy and adds many features",
    "winget": "none",
    "choco": "none",
    "default": [
      {
        "url": "https://github.com/gligli/SuperCopier2/releases/download/2.2b/SuperCopier22beta.exe",
        "portable": "false",
        "args": "/S /LANG=en",
        "launcher": "SuperCopier22beta.exe"
      }
    ],
    "category": "Utilities",
    "check": "false"
  },
  {
    "Name": "Octopus Deploy",
    "Description": "Octopus Deploy is a Continuous Delivery platform for complex deployments across your entire stack. Deploy with ease to Kubernetes, Linux, Windows virtual machines, Amazon Web Services, Azure, or Google Cloud. If the Octopus Tentacle agent, SSH, command line, or a web service can speak to it, Octopus can deploy to it",
    "winget": "OctopusDeploy.Tentacle",
    "choco": "octopusdeploy.tentacle",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Kindle Previewer",
    "Description": "Kindle Previewer is a graphical user interface tool that emulates how books display across Kindle devices and apps. Kindle Previewer makes it easy for publishers to preview the layout of a book and make sure its text displays properly for any orientation or font size to ensure publishers produce and submit the highest quality Kindle books",
    "winget": "none",
    "choco": "kindlepreviewer",
    "default": [],
    "category": "Documents",
    "check": "false"
  },
  {
    "Name": "Interior Design 3D",
    "Description": "Interior Design 3D is an expert program for home design and floor plan creation",
    "winget": "AMSSoftware.InteriorDesign3D-e",
    "choco": "none",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "MeshLab",
    "Description": "MeshLab is an open source, portable, and extensible system for the processing and editing of unstructured large 3D triangular meshes. It is aimed to help the processing of the typical not-so-small unstructured models",
    "winget": "CNRISTI.MeshLab",
    "choco": "meshlab",
    "default": [],
    "category": "Imaging",
    "check": "false"
  },
  {
    "Name": "GitKraken",
    "Description": "Legendary Git GUI client for Windows, Mac & Linux",
    "winget": "Axosoft.GitKraken",
    "choco": "gitkraken",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Slack",
    "Description": "Slack is a collaboration hub for work, no matter what work you do. It's a place where conversations happen, decisions are made, and information is always at your fingertips. With Slack, your team is better connected",
    "winget": "SlackTechnologies.Slack",
    "choco": "slack",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "Rocket Chat",
    "Description": "Rocket.Chat is the leading open source team chat software solution. Free, unlimited and completely customizable with on-premises and SaaS cloud hosting",
    "winget": "RocketChat.RocketChat",
    "choco": "rocketchat",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "TeamSpeak",
    "Description": "Use crystal clear sound to communicate with your team mates cross-platform with military-grade security. lag-free performance & unparalleled reliability and uptime",
    "winget": "TeamSpeakSystems.TeamSpeakClient",
    "choco": "teamspeak",
    "default": [],
    "category": "Communication",
    "check": "false"
  },
  {
    "Name": "FFFTP",
    "Description": "FFFTP is lightweight FTP client software. FFFTP has many useful feature such as directory mirroring, character encdoging conversion, Firewall and SOCK, one-time password support, and so on",
    "winget": "Sayuri.FFFTP",
    "choco": "ffftp",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "SmartFTP",
    "Description": "SmartFTP is a fast and reliable FTP, FTPS, SFTP, HTTP, Amazon S3, WebDAV, Google Drive, Google Cloud Storage, Microsoft OneDrive, Backblaze B2, Telnet, Terminal client with lots of features and a modern user interface",
    "winget": "SmartSoft.SmartFTP",
    "choco": "smartftp",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Rclone",
    "Description": "Rclone (\"rsync for cloud storage\") is a command-line program to sync files and directories to and from different cloud storage providers",
    "winget": "Rclone.Rclone",
    "choco": "rclone",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Cyberduck",
    "Description": "Cyberduck is a libre server and cloud storage browser for Mac and Windows with support for FTP, SFTP, WebDAV, Amazon S3, OpenStack Swift, Backblaze B2, Microsoft Azure & OneDrive, Google Drive and Dropbox",
    "winget": "Iterate.Cyberduck",
    "choco": "cyberduck",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "Dolphin",
    "Description": "Dolphin is an emulator for two recent Nintendo video game consoles: the GameCube and the Wii. It allows PC gamers to enjoy games for these two consoles in full HD (1080p) with several enhancements: compatibility with all PC controllers, turbo speed, networked multiplayer, and even more!",
    "winget": "DolphinEmulator.Dolphin",
    "choco": "dolphin",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "mGBA",
    "Description": "mGBA is an open-source Game Boy Advance emulator",
    "winget": "JeffreyPfau.mGBA",
    "choco": "mgba",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "EmulationStation",
    "Description": "A graphical and themeable emulator front-end that allows you to access all your favorite games in one place, even without a keyboard!",
    "winget": "Emulationstation.Emulationstation",
    "choco": "emulationstation",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "ScummVM",
    "Description": "ScummVM is a program which allows you to run certain classic graphical adventure and role-playing games, provided you already have their data files. The clever part about this: ScummVM just replaces the executables shipped with the games, allowing you to play them on systems for which they were never designed!",
    "winget": "ScummVM.ScummVM",
    "choco": "scummvm",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Project64",
    "Description": "Project64 is a free and open-source emulator for the Nintendo 64 and Nintendo 64 Disk Drive written in C++ currently for Windows",
    "winget": "Project64.Project64",
    "choco": "project64",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "DOSBox",
    "Description": "DOSBox is an emulator program which emulates an IBM PC compatible computer running a DOS operating system",
    "winget": "DOSBox.DOSBox",
    "choco": "none",
    "default": [],
    "category": "Gaming",
    "check": "false"
  },
  {
    "Name": "Kodu Game Lab",
    "Description": "Kodu Game Lab is a 3D game development environment that is designed to teach kids basic programming principles.",
    "winget": "InfiniteInstant.KoduGameLab",
    "choco": "none",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "GDevelop",
    "Description": "A free and open source nocode game engine designed to be usable by everyone.",
    "winget": "GDevelop.GDevelop",
    "choco": "gdevelop",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MongoDB Tools",
    "Description": "The MongoDB Database Tools are a collection of command-line utilities for working with a MongoDB deployment",
    "winget": "MongoDB.DatabaseTools",
    "choco": "mongodb-database-tools",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "DB Browser for SQLite",
    "Description": "DB Browser for SQLite (DB4S) is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite",
    "winget": "DBBrowserForSQLite.DBBrowserForSQLite",
    "choco": "sqlitebrowser",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MySQL",
    "Description": "The MySQL software delivers a very fast, multithreaded, multi-user, and robust SQL (Structured Query Language) database server. MySQL Server is intended for mission-critical, heavy-load production systems as well as for embedding into mass-deployed software",
    "winget": "Oracle.MySQL",
    "choco": "mysql",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MongoDB Compass",
    "Description": "Compass is a free interactive tool for querying, optimizing, and analyzing your MongoDB data",
    "winget": "MongoDB.Compass.Full",
    "choco": "mongodb-compass",
    "default": [],
    "category": "Development",
    "check": "false"
  },
  {
    "Name": "MongoDB Compass readonly",
    "Description": "Compass is a free interactive tool for analyzing your MongoDB data",
    "winget": "MongoDB.Compass.Readonly",
    "choco": "mongodb-compass-readonly",
    "default": [],
    "category": "Development",
    "check": "false"
  }
]

'@ | ConvertFrom-Json
$itt.database.locales = @'
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الاداء. انضم إلينا لتساهم في تطويرها وجعلها أكثر اكتمالًا","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Msconfig":"تكوين النظام","Environment_Variables":"متغيرات بيئة النظام","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"ادوات اخرى","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"برامج","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":" إعادة التفضيلات إلى الوضع الافتراضي","Reopen_itt_again":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","MAS":"تفعيل الويندوز","Win_Office":"تحميل ويندوز / أوفيس","IDM":"تفعيل الدونلود مانجر","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"...جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","App_empty_select":"اختر على الأقل تطبيقًا لتثبيته","Tweak_empty_select":"اختار على الاقل تحسين واحد لتطبيقه","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Happy_birthday":"!عيد ميلاد سعيد عماد","My_playlist":"انه عيد ميلادي و قائمة الموسيقى الخاصة بي","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein ","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Msconfig":"Systemkonfiguration","Environment_Variables":"Umgebungsvariablen","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","MAS":"Microsoft Aktivierungsskripte (MAS)","Win_Office":"Windows / Office ISO herunterladen","IDM":"IDM-Aktivierung","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","App_empty_select":"Wählen Sie mindestens eine App zur InstAllatiOn aus.","Tweak_empty_select":"Wählen Sie mindestens eine Optimierung zur Anwendung aus.","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund.","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Happy_birthday":"Alles Gute zum Geburtstag mir!","My_playlist":"Es ist mein Geburtstag und meine Playlist ♪","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus."},"en":{"name":"English","Welcome":"Save time and install all your programs at once and debloat windows. Be part of ITT—contribute to improving this tool with Apps/Tweaks — and more","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On","Off":"Off","Disk_Managment":"Disk Managment","Msconfig":"System Configuration","Environment_Variables":"Environment Variables","Task_Manager":"Task Manager","Apps_features":"Programs and Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power options","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"IDM Activation (WindowsAddict)","Browsers_extensions":"Browsers extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","App_empty_select":"Please select at least one app to install.","Tweak_empty_select":"Please select at least one tweak to apply.","Please_wait":"Please wait  a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? Any ongoing installations will be canceled.","Happy_birthday":"Happy Birthday to me!","My_playlist":"It's my Birthday and My Playlist ♪","Empty_save_msg":"Choose at least One app to save it"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido","Off":"Apagado","Disk_Managment":"Administración de discos","Msconfig":"Configuración del sistema","Environment_Variables":"Variables de entorno","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","MAS":"Scripts de activación de Microsoft (MAS)","Win_Office":"Descargar ISO de Windows / Office","IDM":"Activación IDM","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","App_empty_select":"SelecciOna al menos una aplicación para instalar.","Tweak_empty_select":"SelecciOna al menos un ajuste para aplicar.","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Happy_birthday":"¡Feliz cumpleaños a mí!","My_playlist":"Es mi cumpleaños y mi lista de reproducción ♪","Empty_save_msg":"Elige al menos una aplicación para guardarla."},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé ","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Msconfig":"Configuration du système","Environment_Variables":"Variables d'environnement","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","MAS":"Scripts d'activatiOn Microsoft (MAS)","Win_Office":"Télécharger l'ISO Windows / Office","IDM":"ActivatiOn IDM","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","App_empty_select":"Veuillez sélectiOnner au moins une applicatiOn à instAller.","Tweak_empty_select":"Veuillez sélectiOnner au moins un tweak à appliquer.","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues.","Happy_birthday":"Joyeux anniversaire à moi !","My_playlist":"C'est mOn anniversaire et ma playlist ♪","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder."},"ga":{"name":"Gaeilge","Welcome":"Sábháil am trí níos mó ná clár amháin a shuiteáil ag an am céanna agus feabhsaigh feidhmíocht do Windows. Bí linn ag feabhsú an uirlis seo agus ag déanamh é níos fearr. Is féidir leat do chuid Apps ceoil agus feabhsúcháin is fearr leat a chur leis freisin.","Install":"Suiteáil","Apply":"Cuir i bhfeidhm","Downloading":"Ag suiteáil...","About":"Faoi","Third_party":"Tríú páirtí","Preferences":"Roghanna","Management":"Bainistíocht","Apps":"Aplaicí","Tweaks":"Feabhsúcháin","Settings":"Socruithe","Save":"Sábháil","Restore":"Athchóirigh","Music":"Ceol","On":"Ar ","Off":"Múchta","Disk_Managment":"Bainistíocht Diosca","Msconfig":"Cumraíocht an Chórais","Environment_Variables":"Variables d'environnement","Task_Manager":"Bainisteoir Tascanna","Apps_features":"Gnéithe Aipeanna","Networks":"LíOnraí","Services":"Seirbhísí","Device_Manager":"Bainisteoir Gléasanna","Power_Options":"Roghanna Cumhachta","System_Info":"Eolas Córas","Use_system_setting":"Úsáid socrú an chórais","Create_desktop_shortcut":"Cruthaigh gearrthagairt deisce","Reset_preferences":"Athshocraigh Roghanna","Reopen_itt_again":"Oscail ITT arís le do thoil.","Theme":"Téama","Language":"Teanga","MAS":"Scripteanna Gníomhachtaithe Microsoft (MAS)","Win_Office":"Íoslódáil ISO Windows / Office","IDM":"Gníomhachtú IDM","Browsers_extensions":"Síntí Brabhsálaí","All":"Uile","Search":"Cuardaigh","Create_restore_point":"Cruthaigh pointe athchóirithe","Portable_Downloads_Folder":"Fillteán Íoslódálacha Inaistrithe","Install_msg":"An bhfuil tú cinnte gur mhaith leat na feidhmchláir seo a shuiteáil","Apply_msg":"An bhfuil tú cinnte gur mhaith leat na feabhsúcháin seo a chur i bhfeidhm","Applying":"Cur i bhfeidhm...","App_empty_select":"Roghnaigh ar a laghad aip amháin le suiteáil.","Tweak_empty_select":"Roghnaigh ar a laghad feabhsúchán amháin le cur i bhfeidhm.","Please_wait":"Fan le do thoil tá próiseas ag rith sa chúlra","Last_update":"An nuashOnrú deireanach","Exit_msg":"An bhfuil tú cinnte gur mhaith leat an clár a dhúnadh? Má tá suiteálacha ar siúl beidh siad curtha ar ceal.","Happy_birthday":"Breithlá ShOna domsa!","My_playlist":"Is é mo Bhreithlá é agus Mo Phléaráca ♪","Empty_save_msg":"Roghnaigh ar a laghad aip amháin chun é a shábháil"},"hi":{"name":"अंग्रेज़ी","Welcome":"एक बार में कई प्रोग्राम इंस्टॉल करके समय बचाएं और अपने विंडोज़ के प्रदर्शन को बढ़ावा दें। इस टूल को बेहतर बनाने और इसे और अच्छा बनाने में हमारा साथ दें। आप अपने पसंदीदा म्यूज़िक ऐप्स और ट्विक्स भी जोड़ सकते हैं।","Install":"इंस्टॉल करें","Apply":"लागू करें","Downloading":"डाउनलोड हो रहा है...","About":"के बारे में","Third_party":"थर्ड-पार्टी","Preferences":"पसंद","Management":"प्रबंधन","Apps":"ऐप्स","Tweaks":"ट्विक्स","Settings":"सेटिंग्स","Save":"सहेजें","Restore":"पुनर्स्थापित करें","Music":"संगीत","On":"चालू ","Off":"बंद","Disk_Managment":"डिस्क प्रबंधन","Msconfig":"सिस्टम कॉन्फ़िगरेशन","Environment_Variables":"एन्विर्बल वार्डियल्स","Task_Manager":"टास्क मैनेजर","Apps_features":"ऐप्स-फीचर्स","Networks":"नेटवर्क्स","Services":"सेवाएँ","Device_Manager":"डिवाइस मैनेजर","Power_Options":"पावर विकल्प","System_Info":"सिस्टम जानकारी","Use_system_setting":"सिस्टम सेटिंग का उपयोग करें","Create_desktop_shortcut":"डेस्कटॉप शॉर्टकट बनाएं","Reset_preferences":"पसंद रीसेट करें","Reopen_itt_again":"कृपया इसे फिर से खोलें।","Theme":"थीम","Language":"भाषा","MAS":"माइक्रोसॉफ्ट एक्टिवेशन स्क्रिप्ट्स (MAS)","Win_Office":"विंडोज़ / ऑफिस ISO (MAS)","IDM":"IDM एक्टिवेशन (WindowsAddict)","Browsers_extensions":"ब्राउज़र एक्सटेंशन","All":"सभी","Search":"खोज","Create_restore_point":"पुनर्स्थापना बिंदु बनाएँ","Portable_Downloads_Folder":"पोर्टेबल डाउनलोड फ़ोल्डर","Install_msg":"क्या आप निश्चित हैं कि आप निम्न ऐप्स इंस्टॉल करना चाहते हैं?","Apply_msg":"क्या आप निश्चित हैं कि आप निम्न ट्विक्स लागू करना चाहते हैं?","Applying":"लागू किया जा रहा है...","App_empty_select":"कृपया कम से कम एक ऐप इंस्टॉल करने के लिए चुनें।","Tweak_empty_select":"कृपया कम से कम एक ट्विक लागू करने के लिए चुनें।","Please_wait":"कृपया प्रतीक्षा करें बैकग्राउंड में एक प्रक्रिया चल रही है","Last_update":"आखिरी अपडेट","Exit_msg":"क्या आप निश्चित हैं कि आप प्रोग्राम बंद करना चाहते हैं? यदि कोई इंस्टॉलेशन चल रहा हो तो वह समाप्त हो जाएगा।","Happy_birthday":"मुझे जन्मदिन की शुभकामनाएँ!","My_playlist":"यह मेरा जन्मदिन है और मेरी प्लेलिस्ट ♪","Empty_save_msg":"कम से कम एक ऐप चुनें और उसे सहेजें।"},"it":{"name":"Italiano","Welcome":"Risparmia tempo installando più programmi contemporaneamente e migliora le prestazioni di Windows. Unisciti a noi per migliorare questo strumento e renderlo migliore. Puoi anche aggiungere le tue app musicali preferite e le personalizzazioni.","Install":"Installa","Apply":"Applica","Downloading":"Download in corso...","About":"Informazioni","Third_party":"Terze parti","Preferences":"Preferenze","Management":"Gestione","Apps":"App","Tweaks":"Personalizzazioni","Settings":"Impostazioni","Save":"Salva","Restore":"Ripristina","Music":"Musica","On":"Acceso","Off":"Spento","Disk_Managment":"Gestione disco","Msconfig":"Configurazione di sistema","Environment_Variables":"Variabili di ambiente","Task_Manager":"Gestore attività","Apps_features":"App-Funzionalità","Networks":"Reti","Services":"Servizi","Device_Manager":"Gestore dispositivi","Power_Options":"Opzioni risparmio energia","System_Info":"Informazioni di sistema","Use_system_setting":"Usa impostazioni di sistema","Create_desktop_shortcut":"Crea collegamento sul desktop","Reset_preferences":"Reimposta preferenze","Reopen_itt_again":"Per favore riapri di nuovo.","Theme":"Tema","Language":"Lingua","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"Attivazione IDM (WindowsAddict)","Browsers_extensions":"Estensioni per browser","All":"Tutti","Search":"Cerca","Create_restore_point":"Crea un punto di ripristino","Portable_Downloads_Folder":"Cartella download portatile","Install_msg":"Sei sicuro di voler installare le seguenti app?","Apply_msg":"Sei sicuro di voler applicare le seguenti personalizzazioni?","Applying":"Applicazione in corso...","App_empty_select":"Seleziona almeno un'app da installare.","Tweak_empty_select":"Seleziona almeno una personalizzazione da applicare.","Please_wait":"Attendere un processo è in corso in background","Last_update":"Ultimo aggiornamento","Exit_msg":"Sei sicuro di voler chiudere il programma? Se ci sono installazioni in corso verranno terminate.","Happy_birthday":"Buon compleanno a me!","My_playlist":"È il mio compleanno e la mia playlist ♪","Empty_save_msg":"Scegli almeno un'app per salvarla."},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Msconfig":"시스템 구성","Environment_Variables":"연습별 변수","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","MAS":"Microsoft 활성화 스크립트 (MAS)","Win_Office":"Windows / Office ISO 다운로드","IDM":"IDM 활성화","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","App_empty_select":"설치할 적어도 하나의 앱을 선택하십시오","Tweak_empty_select":"조정 사항 적용 대기 중","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","Happy_birthday":"생일 축하합니다 Emad!","My_playlist":"제 생일과 제 플레이리스트 ♪"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл ","Off":"Выкл","Disk_Managment":"Управление дисками","Msconfig":"Конфигурация системы","Environment_Variables":"Переменные окружения","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","MAS":"Microsoft ActivatiOn Scripts (MAS)","Win_Office":"Скачать ISO Windows / Office","IDM":"Активация IDM","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","App_empty_select":"Выберите хотя бы одно приложение для установки.","Tweak_empty_select":"Выберите хотя бы одну настройку для применения.","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Happy_birthday":"С Днем Рождения меня!","My_playlist":"Это мой день рождения и мой плейлист ♪","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения."},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık ","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Msconfig":"Sistem Yapılandırması","Environment_Variables":"Ortam Değişkenleri","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","MAS":"Microsoft Etkinleştirme Betikleri (MAS)","Win_Office":"Windows / Office ISO İndir","IDM":"IDM Etkinleştirme","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","App_empty_select":"Lütfen yüklemek için en az bir uygulama seçin.","Tweak_empty_select":"Lütfen uygulamak için en az bir ince ayar seçin.","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor.","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak.","Happy_birthday":"Kendime Mutlu Yıllar!","My_playlist":"Benim Doğum Günüm ve Benim Çalma Listem ♪","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin."},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Msconfig":"系统配置","Environment_Variables":"环境变量","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again":"请重新打开ITT。","Theme":"主题","Language":"语言","MAS":"Microsoft 激活脚本 (MAS)","Win_Office":"下载 Windows / Office ISO","IDM":"IDM 激活","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","App_empty_select":"请选择至少一款要安装的应用","Tweak_empty_select":"请等待调整应用完成","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","Happy_birthday":"生日快乐 Emad!","My_playlist":"这是我的生日和我的播放列表 ♪"}}}

'@ | ConvertFrom-Json
$itt.database.Settings = @'
[
  {
    "Name": "Show file extensions",
    "description": "Show file extensions in Windows displays the suffix at the end of file names (like .txt, .jpg, .exe), indicating file types and helping users identify which programs can open them, simplifying file management and differentiation",
    "category": "Protection"
  },
  {
    "Name": "Show Super Hidden",
    "description": "Show Super Hidden displays files and folders in Windows that are hidden beyond standard hidden files, often system files to prevent accidental changes",
    "category": "Protection"
  },
  {
    "Name": "Dark Mode",
    "description": "Dark Mode is a setting that changes the screen to darker colors, reducing eye strain and saving battery life on OLED screens",
    "category": "Personalize"
  },
  {
    "Name": "NumLook",
    "description": "Toggle the Num Lock key state when your computer starts",
    "category": "Protection"
  },
  {
    "Name": "Sticky Keys",
    "description": "Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities or help users reduce repetitive strain injury",
    "category": "Accessibility"
  },
  {
    "Name": "Mouse Acceleration",
    "description": "Cursor movement is affected by the speed of your physical mouse movements",
    "category": "Accessibility"
  },
  {
    "Name": "End Task On Taskbar Windows 11",
    "description": "Option to end task when right clicking a program in the taskbar",
    "category": "Accessibility"
  },
  {
    "Name": "Clear Page File At Shutdown",
    "description": "Page file in Windows removes sensitive data stored in virtual memory when the system shuts down. This enhances security by ensuring that the data in the page file (which may contain passwords, encryption keys, or other sensitive information) is wiped out and cannot be accessed after rebooting. However, it can increase shutdown time",
    "category": "Storage "
  },
  {
    "Name": "Auto End Tasks",
    "description": "Automatically end tasks that are not responding",
    "category": "Performance"
  },
  {
    "Name": "Performance Options",
    "description": "Adjust for best performance",
    "category": "Performance"
  },
  {
    "Name": "Launch To This PC",
    "description": "Changing the default opening location of File Explorer in Windows allows it to open directly to This PC instead of Quick Access, making it easier to quickly access main drives and system folders",
    "category": "Accessibility"
  },
  {
    "Name": "Disable Automatic Driver Installation",
    "description": "Stopping Windows from automatically downloading and installing drivers",
    "category": "Drivers"
  }
]
'@ | ConvertFrom-Json
$itt.database.Tweaks = @'
[
  {
    "Name": "Disk cleanup",
    "Description": "Clean temporary files that are not necessary",
    "Category": "Storage",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n Remove-Item -Path \"$env:LOCALAPPDATA\\Temp\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        Remove-Item -Path \"C:\\Windows\\Prefetch\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        Stop-Service -Name wuauserv -Force\r\n        takeown /f C:\\Windows\\SoftwareDistribution\\Download /r /d y\r\n        icacls C:\\Windows\\SoftwareDistribution\\Download /grant administrators:F /t\r\n        Remove-Item -Path \"C:\\Windows\\SoftwareDistribution\\Download\\*\" -Recurse -Force -ErrorAction SilentlyContinue\r\n        cleanmgr.exe /d C: /VERYLOWDISK /sagerun:1 Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase\r\n        cleanmgr.exe /d C: /sagerun:1\r\n        cleanmgr.exe /sagerun:1\r\n        Dism.exe /online /Cleanup-Image /StartComponentCleanup\r\n        cleanmgr.exe /d C: /VERYLOWDISK\r\n        Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase\r\n        Start-Service -Name wuauserv\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "System File Checker",
    "Description": "sfc /scannow Use the System File Checker tool to repair missing or corrupted system files",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n        Chkdsk /scan\r\n        sfc /scannow\r\n        DISM /Online /Cleanup-Image /Restorehealth\r\n        sfc /scannow\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Clean Taskbar",
    "Description": "Disable the (News and interests) and (People icon) Show Search icon only for Windows 10/11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "SearchboxTaskbarMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "2"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoNewsAndInterests",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Windows 10/11 Bloatware",
    "Description": "A selection of pre-installed apps, including productivity tools, games, communication apps, and entertainment software like Xbox, Microsoft News, TikTok, and more, will be removed.",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [
      "Microsoft.Copilot",
      "Microsoft.BingNews",
      "Microsoft.WindowsCamera",
      "Microsoft.Getstarted",
      "Microsoft.BingWeather_1.0.6.0_x64__8wekyb3d8bbwe",
      "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy",
      "Microsoft.GetHelp",
      "Microsoft.AppConnector",
      "Microsoft.BingFinance",
      "Microsoft.XboxGamingOverlay",
      "Microsoft.BingTranslator",
      "Microsoft.BingHealthAndFitness",
      "Microsoft.BingTravel",
      "Microsoft.MinecraftUWP",
      "PowerAutomate",
      "MicrosoftTeams",
      "Microsoft.Todos",
      "Microsoft.AsyncTextService",
      "Microsoft.GamingServices",
      "Microsoft.BingFoodAndDrink",
      "Microsoft.BingWeather",
      "Microsoft.Messaging",
      "Microsoft.Microsoft3DViewer",
      "Microsoft.MicrosoftOfficeHub",
      "Microsoft.MicrosoftSolitaireCollection",
      "Microsoft.NetworkSpeedTest",
      "Microsoft.News",
      "Microsoft.549981C3F5F10",
      "Microsoft.Office.Lens",
      "Microsoft.Office.OneNote",
      "Microsoft.Office.Sway",
      "Microsoft.OutlookForWindows",
      "Microsoft.OneConnect",
      "Microsoft.People",
      "Microsoft.Print3D",
      "Microsoft.RemoteDesktop",
      "Microsoft.SkypeApp",
      "Microsoft.StorePurchaseApp",
      "Microsoft.Office.Todo.List",
      "Microsoft.Whiteboard",
      "Microsoft.WindowsAlarms",
      "Microsoft.WindowsCamera",
      "Microsoft.windowscommunicationsapps",
      "Microsoft.WindowsFeedbackHub",
      "Microsoft.Wallet",
      "Microsoft.WindowsMaps",
      "Microsoft.YourPhone",
      "Microsoft.WindowsSoundRecorder",
      "Microsoft.Xbox.TCUI",
      "Microsoft.XboxApp",
      "Microsoft.XboxGameOverlay",
      "Microsoft.GamingApp",
      "Microsoft.XboxIdentityProvider",
      "Microsoft.XboxSpeechToTextOverlay",
      "Microsoft.Windows.Cortana",
      "Microsoft.ScreenSketch",
      "Microsoft.Windows.DevHome",
      "Microsoft.MixedReality.Portal",
      "Microsoft.MSPaint",
      "Microsoft.Getstarted",
      "Microsoft.ZuneVideo",
      "Microsoft.ZuneMusic",
      "EclipseManager",
      "ActiproSoftwareLLC",
      "AdobeSystemsIncorporated.AdobePhotoshopExpress",
      "Duolingo-LearnLanguagesforFree",
      "PandoraMediaInc",
      "CandyCrush",
      "BubbleWitch3Saga",
      "Wunderlist",
      "Flipboard",
      "Twitter",
      "Facebook",
      "Minecraft",
      "Royal Revolt",
      "Sway",
      "Disney.37853FC22B2CE",
      "disney",
      "Microsoft.549981",
      "Microsoft.MicrosoftStickyNotes",
      "TikTok.TikTok_8wekyb3d8bbwe",
      "TikTok",
      "Microsoft.NetworkSpeedTest"
    ],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Stutter in games",
    "Description": "Fix Stutter in Games (Disable GameBarPresenceWriter). Windows 10/11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/Fix-Stutter-in-Games/main/fix.ps1 | iex "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable the Ultimate Performance Power Plan",
    "Description": "Enable the Ultimate Performance Power Plan",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; Start-Process powercfg.cpl"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Reset the TCP/IP Stack",
    "Description": "If you have an internet problem, Reset network configuration",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "netsh int ip reset"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Setup Auto login",
    "Description": "Setup auto login Windows username",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "curl.exe -ss \"https://live.sysinternals.com/Autologon.exe\" -o $env:temp\\autologin.exe ; cmd /c $env:temp\\autologin.exe /accepteula"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable  Xbox Services",
    "Description": "Disables all Xbox Services Game Mode and Optimizations for Windowed Games and fix stutter playing smooth",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-MMAgent -MemoryCompression | Out-Null",
      "\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.exe\r\n\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll\r\n\r\n        takeown /f C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.exe /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll /grant administrators:F\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.exe -NewName GameBarPresenceWriter.exe_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll -NewName GameBarPresenceWriter.proxy.dll_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll -NewName Windows.Gaming.UI.GameBar.dll_backup\r\n\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AutoGameModeEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AllowAutoGameMode",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "ShowStartupPanel",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AppCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "UseNexusForGameBarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AudioCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "CursorCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameDVR",
        "Name": "AllowgameDVR",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Services\\xbgm",
        "Name": "Start",
        "Type": "DWord",
        "Value": "4",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehaviorMode",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_HonorUserFSEBehaviorMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DXGIHonorFSEWindowsCompatible",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_EFSEFeatureFlags",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences",
        "Name": "DirectXUserGlobalSettings",
        "Type": "String",
        "Value": "SwapEffectUpgradeEnable=1;",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "SwapEffectUpgradeCache",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SoftwareProtectionPlatform",
        "Name": "InactivityShutdownDelay",
        "Type": "DWord",
        "Value": "4294967295",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Dwm",
        "Name": "OverlayTestMode",
        "Type": "DWord",
        "Value": "5",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "GPU Priority",
        "Type": "DWord",
        "Value": "8",
        "defaultValue": "8"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "Scheduling Category",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "SFIO Priority",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl",
        "Name": "IRQ8Priority",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Start Menu Ads",
    "Description": "Disable Start menu Ads and Settings",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo",
        "Name": "Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SoftLandingEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowSyncProviderNotifications",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Windows Web Search",
    "Description": "Disable web search in Windows by Modify the registry settings related to Windows Search for Windows 10 and 11",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BingSearchEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Turn off background Apps",
    "Description": "Turn off background apps for Windows 10 and 11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications",
        "Name": "GlobalUserDisabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BackgroundAppGlobalToggle",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable suggestions on Start Menu",
    "Description": "Disables suggestions on start menu for Windows 10 and 11",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Folder Shortcuts From File Explorer",
    "Description": "Remove Documents, Videos, Pictures, Desktop. Shortcuts from File Explorer",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer",
        "Name": "HubMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\Wow6432Node\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{031E4825-7B94-4dc3-B131-E946B44C8DD5}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Optimize Windows Services",
    "Description": "Disable (Print Spooler), (Fax), (Diagnostic Policy), (Downloaded Maps Manager), (Windows Error Reporting Service), (Remote Registry) , (Internet Connection Sharing), (Disables Telemetry and Data)",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "Spooler",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "Fax",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "DPS",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "MapsBroker",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "WerSvc",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "RemoteRegistry",
        "StartupType": "Disabled",
        "DefaultType": "Disabled"
      },
      {
        "Name": "lmhosts",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "SharedAccess",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "DiagTrack",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Disable Hibernate",
    "Description": "Hibernate is a power-saving mode in Microsoft Windows operating systems that allows the system to save the current state of your computer to the hard disk and then power down completely",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg.exe /hibernate off"
    ],
    "UndoScript": [
      "powercfg.exe /hibernate on"
    ],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Power",
        "Name": "HibernateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings",
        "Name": "ShowHibernateOption",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable OneDrive",
    "Description": "Disabling OneDrive for Windows 10 and 11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [
      "OneDrive",
      "MicrosoftEdge"
    ],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\OneDrive",
        "Name": "DisableFileSyncNGSC",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run",
        "Name": "OneDrive",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Activate Windows Old Photo Viewer",
    "Description": "Enables the classic Windows Photo Viewer for Windows 10",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpeg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".png",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".bmp",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".gif",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationIcon",
        "Type": "String",
        "Value": "C:\\Program Files (x86)\\Windows Photo Viewer\\photoviewer.dll",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationName",
        "Type": "String",
        "Value": "Windows Photo Viewer",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Restore Classic Context Menu Windows 11",
    "Description": "Restore the old context menu for Windows 11",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\",
        "Name": "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}",
        "Type": "String",
        "Value": "",
        "defaultValue": ""
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\\InprocServer32",
        "Name": "",
        "Type": "String",
        "Value": "",
        "defaultValue": "default"
      }
    ]
  },
  {
    "Name": "Remove Copilot in Windows 11",
    "Description": "Copilot in Windows provides centralized generative AI assistance to your users right from the Windows desktop Copilot in Windows appears as a side bar docked on the Windows desktop and is designed to help users get things done in Windows Copilot in Windows can perform common tasks in Windows like changing Windows settings which makes it different from the browserbased Copilot in Edge",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "HubsSidebarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Recall Snapshots in Windows 11 24H",
    "Description": "Recall is an upcoming preview experience exclusive to Copilot+ PCs that will help you easily find and remember things you've seen using natural language",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Delete Thumbnail Cache",
    "Description": "removing the stored image thumbnails on your computer These thumbnails are small versions of images used by the operating system to display image previews quickly Over time the cache can become large or corrupted causing slowdowns or display issues Deleting it can free up space.",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Remove-Item \"$env:LocalAppData\\Microsoft\\Windows\\Explorer\\thumbcache*\" -Force -Recurse"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Old Volume Control in Windows 10",
    "Description": "The old volume control in Windows 10 refers to the classic audio mixer interface that was used in earlier versions of Windows, before the modern volume control system was introduced.",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\MTCUVC",
        "Name": "EnableMtcUvc",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Toggle Key Sounds",
    "Description": "Toggle key sounds in Windows are audio cues that play when you press the Caps Lock, Num Lock, or Scroll Lock keys. These sounds help users identify when these keys are activated or deactivated",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Control Panel\\Accessibility\\ToggleKeys",
        "Name": "Flags",
        "Type": "String",
        "Value": "58",
        "defaultValue": "62"
      }
    ]
  },
  {
    "Name": "Disable Homegroup",
    "Description": "Disables HomeGroup  HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs that are currently running and connected to your network",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "HomeGroupListener",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      },
      {
        "Name": "HomeGroupProvider",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Remove Home and Gallery from explorer in Windows 11",
    "Description": "Removes the Home and Gallery from explorer and sets This PC as default",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "1",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "1"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
        "Value": "Remove"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Disable all Privacy Settings",
    "Description": "Disable Wifi-Sense & Activity History & ActivityFeed Telemetry & DataCollection",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\Microsoft Compatibility Appraiser' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\ProgramDataUpdater' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Autochk\\Proxy' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\UsbCeip' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
        "Name": "Value",
        "Type": "String",
        "Value": "Deny",
        "defaultValue": "Deny"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Sensor\\Overrides\\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",
        "Name": "SensorPermissionState",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\lfsvc\\Service\\Configuration",
        "Name": "Status",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\Maps",
        "Name": "AutoUpdateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "EnableActivityFeed",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
        "Name": "Value",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowTelemetry",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "ContentDeliveryAllowed",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "OemPreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEverEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SilentInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338387Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338388Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338389Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-353698Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Siuf\\Rules",
        "Name": "NumberOfSIUFInPeriod",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "DoNotShowFeedbackNotifications",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableTailoredExperiencesWithDiagnosticData",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AdvertisingInfo",
        "Name": "DisabledByGroupPolicy",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config",
        "Name": "DODownloadMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Remote Assistance",
        "Name": "fAllowToGetHelp",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\OperationStatusManager",
        "Name": "EnthusiastMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowTaskViewButton",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "LaunchTo",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem",
        "Name": "LongPathsEnabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DriverSearching",
        "Name": "SearchOrderConfig",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "SystemResponsiveness",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "NetworkThrottlingIndex",
        "Value": "4294967295",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "MenuShowDelay",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "AutoEndTasks",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
        "Name": "ClearPageFileAtShutdown",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SYSTEM\\ControlSet001\\Services\\Ndu",
        "Name": "Start",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseHoverTime",
        "Value": "400",
        "Type": "String",
        "defaultValue": "400"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters",
        "Name": "IRPStackSize",
        "Value": "30",
        "Type": "DWord",
        "defaultValue": "20"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\UserProfileEngagement",
        "Name": "ScoobeSystemSettingEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Autoplay and Autorun",
    "Description": "Disabling autoplay in Windows prevents the automatic launch of media or applications when a removable device, such as a USB drive or CD, is connected to the computer",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoplayHandlers",
        "Name": "DisableAutoplay",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoDriveTypeAutoRun",
        "Type": "DWord",
        "Value": "255",
        "defaultValue": "255"
      }
    ]
  },
  {
    "Name": "Disable SMB Server",
    "Description": "SMB Server enables file and printer sharing over a network, allowing access to resources on remote computers as if they were local",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force; Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set current network profile to public",
    "Description": "Deny file sharing, device discovery, etc",
    "Category": "",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-NetConnectionProfile -NetworkCategory Public"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable F8 boot menu options",
    "Description": "Enable F8 boot menu options",
    "Category": "BIOS",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "bcdedit /set bootmenupolicy Standard | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable display and sleep mode timeouts",
    "Description": "If you frequently use your device, disable this",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n        powercfg /X monitor-timeout-ac 0\r\n        powercfg /X monitor-timeout-dc 0\r\n        powercfg /X standby-timeout-ac 0\r\n        powercfg /X standby-timeout-dc 0\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set Wallpaper desktop Quality to 100%",
    "Description": "It's Microsoft, what should I say!",
    "Category": "Personalization",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\CrashControl",
        "Name": "DisplayParameters",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Windows Transparency",
    "Description": "It's Microsoft, what should I say!",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
        "Name": "EnableTransparency",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable scheduled defragmentation task",
    "Description": "Defragmentation in Windows optimizes disk performance by reorganizing fragmented data, improving access times and system efficiency",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Defrag\\ScheduledDefrag' | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable NET 3.5",
    "Description": "Some old games and applications require .NET Framework 3.5",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "DISM /Online /Enable-Feature /FeatureName:NetFx3 /All"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Super Performance",
    "Description": "All Windows effects disabled and optimized for windowed games. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "0",
        "Name": "DragFullWindows"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "200",
        "Name": "MenuShowDelay"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop\\WindowMetrics",
        "Value": "0",
        "Name": "MinAnimate"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Control Panel\\Keyboard",
        "Value": "0",
        "Name": "KeyboardDelay"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewAlphaSelect"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewShadow"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarAnimations"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects",
        "Value": "2",
        "Name": "VisualFXSetting"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\DWM",
        "Value": "0",
        "Name": "EnableAeroPeek"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarMn"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarDa"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ShowTaskViewButton"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Value": "0",
        "Name": "SearchboxTaskbarMode"
      }
    ]
  },
  {
    "Name": "Remove Widgets from Taskbar in Windows 11",
    "Description": "Widgets are one of the new user interface elements in Windows 11 They are used to display dynamic information on the desktop including weather news and other information from various sources",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "winget uninstall 'windows web experience pack' --silent"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Name": "TaskbarDa",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings",
        "defaultValue": "1",
        "Value": "0",
        "Type": "DWord"
      }
    ]
  },
  {
    "Name": "Unknown",
    "Description": "Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Rename-Computer -NewName 'Unknown'",
      "$currentUsername = $env:USERNAME; Rename-LocalUser -Name $currentUsername -NewName 'Unknown'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Arabic encoding",
    "Description": "Fix issues related to strange symbols appearing in Arabic text",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-WinSystemLocale -SystemLocale 'ar-EG'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  }
]
'@ | ConvertFrom-Json
#===========================================================================
#endregion End Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
#===========================================================================
#region Begin Main Functions
#===========================================================================
function Invoke-Button {

    <#
        .SYNOPSIS
            Handles various button actions and commands based on the specified action parameter.
        .DESCRIPTION
            The `Invoke-Button` function executes different actions depending on the input parameter. It manages operations such as installing apps.
        .EXAMPLE
            Invoke-Button -action "sysinfo"
    #>

    Param ([string]$action,[string]$Content)
    # debug start
        function Debug-Message {
                if($Debug) {  Add-Log "$action,$Content" -Level "Debug"  }
        }
    # debug end

    # Switch block to handle different actions
    Switch -Wildcard ($action) {
        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
            # debug start
                Debug-Message $action
            # debug end
        }
        "applyBtn" {
            Invoke-Apply
            # debug start
                Debug-Message $action
            # debug end
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
            # debug start
                Debug-Message $action
            # debug end

        }
        "searchInput" {
            Search
            # debug start
                Debug-Message $action
            # debug end
        }
        # Menu items
        "systemlang" {
            Set-Language -lang "default"
            # debug start
                Debug-Message $action
            # debug end
        }
                    "ar" {
                Set-Language -lang "ar"
                # debug start
                Debug-Message 
                # debug end
            }
            "de" {
                Set-Language -lang "de"
                # debug start
                Debug-Message 
                # debug end
            }
            "en" {
                Set-Language -lang "en"
                # debug start
                Debug-Message 
                # debug end
            }
            "es" {
                Set-Language -lang "es"
                # debug start
                Debug-Message 
                # debug end
            }
            "fr" {
                Set-Language -lang "fr"
                # debug start
                Debug-Message 
                # debug end
            }
            "ga" {
                Set-Language -lang "ga"
                # debug start
                Debug-Message 
                # debug end
            }
            "hi" {
                Set-Language -lang "hi"
                # debug start
                Debug-Message 
                # debug end
            }
            "it" {
                Set-Language -lang "it"
                # debug start
                Debug-Message 
                # debug end
            }
            "ko" {
                Set-Language -lang "ko"
                # debug start
                Debug-Message 
                # debug end
            }
            "ru" {
                Set-Language -lang "ru"
                # debug start
                Debug-Message 
                # debug end
            }
            "tr" {
                Set-Language -lang "tr"
                # debug start
                Debug-Message 
                # debug end
            }
            "zh" {
                Set-Language -lang "zh"
                # debug start
                Debug-Message 
                # debug end
            }
        "save" {
            Save-File
            # debug start
                Debug-Message $action
            # debug end
        }
        "load" {
            Load-SavedFile
            # debug start
                Debug-Message $action
            # debug end
        }
        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
            # debug start
                Debug-Message $action
            # debug end
        }
        "poweroption" {
            Start-Process powercfg.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "services" {
            Start-Process services.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "network" {
            Start-Process ncpa.cpl
            # debug start
                Debug-Message $action
            # debug end

        }
        "taskmgr" {
            Start-Process taskmgr.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
            # debug start
                Debug-Message $action
            # debug end
        }
        "msconfig" {
            Start-Process msconfig.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "ev" {
            rundll32 sysdm.cpl,EditEnvironmentVariables
        }
        "systheme" {
            SwitchToSystem 
            # debug start
                Debug-Message $action
            # debug end
        }
                    "Dark" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "DarkKnight" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "Light" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "Palestine" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
        # chocoloc
        "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
            # debug start
                Debug-Message $action
            # debug end
        }
        # itt Dir
        "itt" {
            Start-Process explorer.exe $env:ProgramData\itt
            # debug start
                Debug-Message $action
            # debug end

        }
        # restore point
        "restorepoint" {
            RestorePoint
            # debug start
                Debug-Message $action
            # debug end
        }
        # Music
        "moff" {
            Manage-Music -action "SetVolume" -volume 0 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mon" {
            Manage-Music -action "SetVolume" -volume 100 
            # debug start
                Debug-Message $action
            # debug end
        }
        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mas" {
            Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
            # debug start
                Debug-Message $action
            # debug end
        }
        "idm" {
            Add-Log -Message "IDM Activation Script (WindowsAddict)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://massgrave.dev/ias | iex}
            # debug start
                Debug-Message $action
            # debug end
        }
        "neat" {
            Start-Process "https://addons.mozilla.org/en-US/firefox/addon/neatdownloadmanager-extension/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/"
            # debug start
                Debug-Message $action
            # debug end
        }
        # Other actions
        "ittshortcut" {
            ITTShortcut $action
            # debug start
                Debug-Message $action
            # debug end
        }
        "dev" {
            About
            # debug start
                Debug-Message $action
            # debug end
        }
        # Reset-Preferences
        "reset"{
            Reset-Preferences
            # debug start
                Debug-Message $action
            # debug end
        }
        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
            # debug start
                Debug-Message $action
            # debug end
        }
        "fmhy"{
            Start-Process ("https://fmhy.net/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "rapidos"{
            Start-Process ("https://github.com/rapid-community/RapidOS")
            # debug start
                Debug-Message $action
            # debug end
        }
        "asustool"{
            Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
            # debug start
                Debug-Message $action
            # debug end
        }
        "webtor"{
            Start-Process ("https://webtor.io/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "spotifydown"{
            Start-Process ("https://spotifydown.com")
            # debug start
                Debug-Message $action
            # debug end
        }
        "taps"{
            ChangeTap
            # debug start
                Debug-Message $action
            # debug end
        }
        Default {
            Write-Host "Unknown action: $action"
        }
    }
}
function ITT-ScriptBlock {
    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.
        .DESCRIPTION
        This function creates a new PowerShell instance to execute a provided script block asynchronously. It accepts an optional array of arguments to pass to the script block and manages the runspace and PowerShell instance resources. The function ensures that resources are properly disposed of after the script block completes execution.
        .EXAMPLE
        ITT-ScriptBlock -ScriptBlock { param($arg1) Write-Output $arg1 } -ArgumentList @("Hello, World!")
        Executes the script block that outputs the provided argument "Hello, World!" asynchronously.
    #>
    param(
        [scriptblock]$ScriptBlock,
        [array]$ArgumentList = @()
    )
    $script:powershell = [powershell]::Create()
    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)

    foreach ($arg in $ArgumentList) {
        $script:powershell.AddArgument($arg)
    }

    $script:powershell.RunspacePool = $itt.runspace
    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()
    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)
        $script:powershell.Dispose()
        $itt.runspace.Dispose()
        $itt.runspace.Close()
        [System.GC]::Collect()
    }

    return $handle
}
function RestorePoint {
    <#
        .SYNOPSIS
        Creates a system restore point on the local computer.
        .DESCRIPTION
        This function creates a system restore point using the Checkpoint-Computer cmdlet. It logs the process of creating the restore point and handles any errors that occur during the creation. If the restore point creation fails, an error message is displayed.
        .EXAMPLE
        RestorePoint
        Creates a restore point and logs the success or failure of the operation.
    #>
    ITT-ScriptBlock -ScriptBlock {
        Try {
            Add-Log -Message "Creating Restore point..." -Level "INFO"
            Start-Process powershell.exe -ArgumentList "-NoExit", "-Command `"Enable-ComputerRestore -Drive '$env:SystemDrive'; Checkpoint-Computer -Description 'ITT' -RestorePointType 'MODIFY_SETTINGS'; exit`"" -Wait -Verb RunAs
            Add-Log -Message "Created successfully" -Level "INFO"
        } Catch {
            Add-Log -Message "An error occurred while enabling System Restore: $_" -Level "ERROR"
        }
    }
}
function Add-Log {
    param ([string]$Message, [string]$Level = "INFO")

    $level = $Level.ToUpper()
    $colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
    $iconMap  = @{ INFO="i"; WARNING="!"; ERROR="X"; INSTALLED="√"; APPLY="√"; DISABLED="X"; ENABLED="√"; DEBUG="Debug" }

    $color = if ($colorMap.ContainsKey($level)) { $colorMap[$level] } else { "White" }
    $icon  = if ($iconMap.ContainsKey($level)) { $iconMap[$level] } else { "i" }

    Write-Host "[$icon] $Message" -ForegroundColor $color
}
function Disable-Service {
    <#
        .SYNOPSIS
        Disables a specified service by changing its startup type and stopping it.
        .DESCRIPTION
        This function disables a Windows service by first changing its startup type to the specified value, then stopping the service if it is running. The function logs the outcome of the operation, including whether the service was found and successfully disabled or if an error occurred.
        .PARAMETER ServiceName
        The name of the service to be disabled. This is a required parameter.
        .PARAMETER StartupType
        The desired startup type for the service. Common values include 'Disabled', 'Manual', and 'Automatic'. This is a required parameter.
        .EXAMPLE
        Disable-Service -ServiceName "wuauserv" -StartupType "Disabled"
    #>
    param(
        [array]$tweak
    )
    foreach ($serv in $tweak) {
        try {
            Add-Log  -Message "Setting Service $($serv.Name)" -Level "info"
            $service = Get-Service -Name $serv.Name -ErrorAction Stop
            Stop-Service -Name $serv.Name -ErrorAction Stop
            $service | Set-Service -StartupType $serv.StartupType -ErrorAction Stop
        }
        catch {
            Add-Log -Message "Service $Name was not found" -Level "info"
        }
    }
}
function ExecuteCommand {
    <#
    .SYNOPSIS
    Executes a PowerShell command in a new process.
    .DESCRIPTION
    This function starts a new PowerShell process to execute the specified command. It waits for the command to complete before returning control to the caller. The function handles any errors that occur during the execution of the command and outputs an error message if needed.
    .PARAMETER Name
    An optional name or identifier for the command being executed. This parameter is currently not used in the function but could be used for logging or tracking purposes.
    .PARAMETER Command
    The PowerShell command to be executed. This parameter is required.
    .EXAMPLE
    ExecuteCommand -Name "Greeting" -Command "Write-Output 'Welcome to ITT'"
    Executes the PowerShell command `Write-Output 'Welcome to ITT'` in a new PowerShell process.
    #>
    param (
        [array]$tweak
    )
    try {
        foreach ($cmd in $tweak) {
            Add-Log -Message "Please wait..."
            $script = [scriptblock]::Create($cmd)
            Invoke-Command  $script -ErrorAction Stop
        }
    } catch  {
        Add-Log -Message "The specified command was not found." -Level "WARNING"
    }
}
function Finish {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
    #>

    param (
       [string]$ListView,
       [string]$title = "ITT Emad Adel",
       [string]$icon = "Info"
    )
    switch($ListView)
    {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Install" -TextIcon "installIcon" -Icon "  " -Width "140"
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
            Add-Log -Message "Done." -Level "Apply"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action]{
        # Uncheck all items
        foreach ($item in $itt.$ListView.Items) {
            if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                $item.Children[0].Children[0].IsChecked = $false
            }
        }
    

        Write-Host $global:CheckedItems

        # Clear the list view selection and reset the filter
        $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
        $collectionView.Filter = $null
        $collectionView.Refresh()
    })
}
function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                # Ensure item structure is valid
                if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
                    return $false
                }

                # Check if item is selected
                return $item.Children[0].Children[0].IsChecked -eq $true
            }
        }
        Default {
            # Clear filter instead of removing all items
            $collectionView.Filter = $null

            # Reset selection to the first item (if available)
            $listView = $itt['window'].FindName($itt.CurrentList)
            if ($listView.Items.Count -gt 0) {
                $listView.SelectedIndex = 0
            }
        }
    }

    # Refresh the collection view
    $collectionView.Refresh()
}

function Clear-Item {
    param (
        $ListView
    )

    # Invoke the operation on the UI thread to ensure thread safety
    $itt.$ListView.Dispatcher.Invoke({
        
        # Loop through each item in the ListView
        foreach ($item in $itt.$ListView.Items) {

            # Ensure the item structure is valid before accessing properties
            if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                
                # Uncheck the checkbox in the first child element
                $item.Children[0].Children[0].IsChecked = $false
            }
        }

        # Clear all items from the ListView
        $itt.$ListView.Clear()
        $global:CheckedItems = @()

        # Reset the filter to show all items
        [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null

        # Reset selection to the first item (if available)
        $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
    })
}
function Get-SelectedItems {
    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.
        .PARAMETER Mode
        Specifies the mode for item retrieval. Options include:
        - `Apps`: Retrieves information about selected applications from the `AppsListView`.
        - `Tweaks`: Retrieves information about selected tweaks from the `TweaksListView`.
        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.
        .EXAMPLE
        Get-SelectedItems -Mode "Tweaks"
        Retrieves and returns a list of selected tweaks from the `TweaksListView`.
        .NOTES
        - The function relies on the `$itt` object, which must be initialized and accessible within the scope of the function.
        - The function processes items from the ListView by iterating through nested StackPanel controls and their child CheckBox controls.
        - The resulting items are returned as an array of hashtables, with each hashtable containing details about the selected item based on the mode.
    #>
    param (
        [string]$Mode
    )
    $items = @()
    switch ($Mode) {
        "Apps" {
            foreach ($Name in $global:CheckedItems) {
                $app = $itt.database.Applications | Where-Object { $_.Name -eq $Name.Content -and $Name.IsChecked }
            
                if ($app) {
                    $items += [PSCustomObject]@{
                        Name    = $app.Name
                        Choco   = $app.Choco
                        Winget  = $app.Winget
                        Default = $app.Default
                    }
                }
            }
        }
        "Tweaks" {
            $itt.TweaksListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $tweak = $itt.database.Tweaks | Where-Object { $_.Name -eq $checkbox.Content }
                                    if ($tweak) {
                                        $items += @{
                                            Name                = $tweak.Name
                                            Registry            = $tweak.Registry
                                            Services            = $tweak.Services
                                            ScheduledTask       = $tweak.ScheduledTask
                                            AppxPackage         = $tweak.AppxPackage
                                            Script              = $tweak.Script
                                            UndoScript          = $tweak.UndoScript
                                            Refresh             = $tweak.Refresh
                                            # Add a new method tweak here
                                        }
                                    }
                                }
                        }
                }
        }
        default {
            Write-Error "Invalid Mode specified. Please choose 'Apps' or 'Tweaks'."
        }
    }
    return $items
}
function Get-ToggleStatus {

    
    Param($ToggleSwitch)
    # Check status of "ToggleDarkMode"
    if($ToggleSwitch -eq "darkmode"){
        $app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
        $system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
        if($app -eq 0 -and $system -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }
    # Check status of "ToggleShowExt" (Show File Extensions)
    if($ToggleSwitch -eq "showfileextensions"){
        $hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
        if($hideextvalue -eq 0){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }
    # Check status of "showsuperhidden" (Show Hidden Files)
    if($ToggleSwitch -eq "showsuperhidden"){
        $hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
        if($hideextvalue -eq 1){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    }
    # Check status of "ToggleNumLock"
    if($ToggleSwitch -eq "numlook"){
        $numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
        if($numlockvalue -eq 2){
            return $true
        }
        else{
            # Return true if Sticky Keys are enabled
            return $false
        }
    } 
    # Check status of "ToggleStickyKeys"    
    if ($ToggleSwitch -eq "stickykeys") {
        $StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
        if($StickyKeys -eq 58){
            return $false
        }
        else{
            # Return true if Sticky Keys are enabled
            return $true
        }
    }
    # Check status of "MouseAcceleration"    
    if($ToggleSwitch -eq "mouseacceleration") {
        $Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
        $Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
        $Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2
        if($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
            return $true
        } else {
            return $false
        }
    }
    # EndTaskOnTaskbar     
    if($ToggleSwitch -eq "endtaskontaskbarwindows") 
    {
        $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
        if (-not (Test-Path $path))
        {
            return $false
        }
        else 
        {
            $TaskBar = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings').TaskbarEndTask
            if($TaskBar -eq 1) 
            {
                return $true
            } 
            else 
            {
                return $false
            }
        }
    }
    # Remove Page file     
    if($ToggleSwitch -eq "clearpagefileatshutdown") 
    {
        $PageFile = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management').ClearPageFileAtShutdown
        if($PageFile -eq 1) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }
     # Auto end tasks     
    if($ToggleSwitch -eq "autoendtasks") 
    {
         $PageFile = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop').AutoEndTasks
         if($PageFile -eq 1) 
         {
             return $true
         } 
         else 
         {
             return $false
         }
    }
    # Auto end tasks     
    if($ToggleSwitch -eq "performanceoptions") 
    {
        $VisualFXSetting = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects').VisualFXSetting
        if($VisualFXSetting -eq 2) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }
    # Quick Access   
    if($ToggleSwitch -eq "launchtothispc") 
    {
        $LaunchTo = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').LaunchTo
        if($LaunchTo -eq 1) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }
    # 
    if($ToggleSwitch -eq "disableautomaticdriverinstallation") 
    {
        $aaa = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching').SearchOrderConfig
        if($aaa -eq 1) 
        {
            return $true
        } 
        else 
        {
            return $false
        }
    }
}
function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.

        .DESCRIPTION
        The Install-App function automates the installation of applications using Chocolatey and Winget. 
        It first attempts to install the application with Chocolatey if provided. If Chocolatey is not 
        available or fails, it falls back to Winget for installation. The function also logs the 
        installation attempts, successes, and failures.

        .EXAMPLE
        Install-App -Name "Google Chrome" -Choco "googlechrome" -Winget "Google.Chrome"
    #>

    param (
        [string]$Name,
        [string]$Choco,
        [string]$Winget
    )

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param (
            [string]$Installer,
            [string]$InstallArgs
        )

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log-Result {
        param (
            [string]$Installer,
            [string]$Source
        )

        if ($Installer -ne 0) {
            Add-Log -Message "$Source Installation Failed for ($Name). Please report the issue in the ITT repository." -Level "ERROR"
        } else {
            Add-Log -Message "($Name) Successfully Installed Using $Source." -Level "Installed"
        }
    }

    # Common Winget Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"

    # If Chocolatey is 'none', use Winget
    if ($Choco -eq "none" -and $Winget -ne "none") {

        #Check Winget is installed
        Install-Winget

        Add-Log -Message "Attempting to install $Name using Winget." -Level "INFO"
        Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
        $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
        Log-Result $wingetResult "Winget"

    }
    else {

        # Attempt Chocolatey installation first
        Install-Choco
        
        Add-Log -Message "Attempting to install $Name using Chocolatey." -Level "INFO"
        $chocoArgs = "install $Choco --confirm --acceptlicense -q -r --ignore-http-cache --allowemptychecksumsecure --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests --limitoutput"
        $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

        # If Chocolatey fails, fallback to Winget
        if ($chocoResult -ne 0) {

            Install-Winget

            Add-Log -Message "Chocolatey installation failed, falling back to Winget." -Level "ERROR"
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log-Result $wingetResult "Winget"

        } else {
            Log-Result $chocoResult "Chocolatey"
        }
    }
}
function Install-Choco {

    if (-not (Get-Command choco -ErrorAction SilentlyContinue))
    {
        Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
    }
}
function Install-Winget {

    <#
        .SYNOPSIS
        Installs Winget on Windows systems that support it.

        .DESCRIPTION
        This function checks if Winget is installed on the system. If not, it verifies the system's architecture and Windows version to ensure compatibility. It 
        then downloads and installs the necessary dependencies and Winget itself.
    #>

    if(Get-Command winget -ErrorAction SilentlyContinue) {return}
    $ComputerInfo = Get-ComputerInfo -ErrorAction Stop
    $arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')

    if ($ComputerInfo.WindowsVersion -lt "1809") {
        Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info" 
        return
    }

    $VCLibs = "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx"
    $UIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x$arch.appx"
    $WingetLatset = "https://aka.ms/getwinget"

    try {
        
        Add-Log -Message "Installing Winget... This might take several minutes" -Level "info"
        Start-BitsTransfer -Source $VCLibs -Destination "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Start-BitsTransfer -Source $UIXaml -Destination "$env:TEMP\Microsoft.UI.Xaml.appx"
        Start-BitsTransfer -Source $WingetLatset -Destination "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

        Add-AppxPackage "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.UI.Xaml.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Start-Sleep -Seconds 1
        Add-Log -Message "Successfully installed Winget. Continuing to install selected apps..." -Level "info"
        return
    }
    catch {
        Write-Error "Failed to install $_"
    }
}
function Native-Downloader {
    param (
        [string]$url,
        [string]$name,
        [string]$launcher,
        [string]$portable,
        [string]$installArgs
    )
    # Define the destination directory
    $Destination_Directory = Join-Path -Path "$env:ProgramData\itt\Downloads" -ChildPath $name
    # Ensure destination directory exists
    if (-not (Test-Path -Path $Destination_Directory)) {
        New-Item -ItemType Directory -Path $Destination_Directory -Force | Out-Null
    }
    # Extract file name and ensure we have the file with extension
    $File = [System.IO.Path]::GetFileName($url)
    $DownloadPath = Join-Path -Path $Destination_Directory -ChildPath $File
    $targetPath = Join-Path -Path $Destination_Directory -ChildPath $launcher
    try {
        # Start downloading the file
        Add-Log -Message "Downloading $name using Invoke-WebRequest" -Level "INFO"
        Invoke-WebRequest -Uri $url -OutFile $DownloadPath -ErrorAction Stop
        Expand-Archive -Path $DownloadPath -DestinationPath $Destination_Directory -Force -ErrorAction Stop
    }
    catch {
        Write-Error "An error occurred during the download or extraction process: $_"
    }
    if ($portable -eq "true") {
        # Check if the target file exists
        if (-not (Test-Path -Path $targetPath)) {
            Add-Log -Message  "Target file '$targetPath' does not exist after extraction." -Level "error"
            return
        }

        if ($launcher -ne "none" -or "") {
            # Define the path to the desktop shortcut
            $desktopPath = [System.Environment]::GetFolderPath('Desktop')
            $shortcutPath = Join-Path -Path $desktopPath -ChildPath "$name.lnk"
            try {
                # Create the shortcut
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($shortcutPath)
                $shortcut.TargetPath = $targetPath
                $shortcut.Save()
                Add-Log -Message "Shortcut created on Destkop" -Level "info"
            }
            catch {
                Write-Error "Failed to create shortcut. Error: $_"
            }
        }
    }
    else {
        Start-Process -FilePath $targetPath -ArgumentList $installArgs -Wait
        # debug start
        if ($debug) { Write-Host $targetPath }
        # debug end
    }
}
function Refresh-Explorer {
    # Check if explorer is not running and start it if needed
    Add-Log -Message "Restart explorer." -Level "Apply"
    Stop-Process -Name explorer -Force
    Start-Sleep -Seconds 1
    if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
        Start-Process explorer.exe -Verb RunAs
    }
}
function Remove-ScheduledTasks {
    param (
        [Parameter(Mandatory = $true)]
        [array]$tweak
    )
    foreach ($task in $tweak) {
        Add-Log -Message "Removing $task ScheduledTask..." -Level "info"
        $tasks = Get-ScheduledTask -TaskName "*$task*" -ErrorAction SilentlyContinue
        if ($tasks) 
        {
            foreach ($task in $tasks) 
            {
                Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
                Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
            }
        } 
        else
        {
            if ($Debug) 
            {
                Add-Log -Message "No tasks matching '$task' found" -Level "debug"
            }
        }
    }
}
function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.
    #>

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value 0 -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value 100 -Force
    SwitchToSystem
    System-Default
    Message -key "Reopen_itt_again" -icon "Information" -action "OK"
}
# Function to get all CheckBoxes from a StackPanel
function Get-CheckBoxes {
    $item.Children[0].Children[0]
    return $item
}

# Load JSON data and update the UI
function Load-SavedFile {
    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Open file dialog to select JSON file
    $openFileDialog = New-Object Microsoft.Win32.OpenFileDialog -Property @{
        Filter = "itt files (*.itt)|*.itt"
        Title  = "itt File"
    }

    if ($openFileDialog.ShowDialog() -eq $true) {

        try {

       

            # Load and parse JSON data
            $FileContent = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json -ErrorAction Stop
            $filteredNames = $FileContent.Name

            if (-not $global:CheckedItems) {
                $global:CheckedItems = [System.Collections.ArrayList]::new()
            }
        
            foreach ($MyApp in $FileContent) {
                $global:CheckedItems.Add(@{ Content = $MyApp.Name; IsChecked = $true })
            }


            # Get the apps list and collection view
            $appsList = $itt['window'].FindName('appslist')
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($appsList.Items)

            # Define the filter predicate
            $collectionView.Filter = {
                param($item)

                if ($FileContent.Name -contains $item.Children[0].Children[0].Content) {
                    $item.Children[0].Children[0].IsChecked = $true
                    return $true
                }
                return $false
            }

            # Show success message
            Message -NoneKey "Restored successfully" -icon "info" -action "OK"


        } catch {
            Write-Warning "Failed to load or parse JSON file: $_"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Save selected items to a JSON file
function Save-File {
    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "warning" -action "OK"
        return
    }

    # Clear any existing filters
    ClearFilter

    # Create a dictionary for faster lookups
    $appsDictionary = $itt.database.Applications | ForEach-Object { @{ $_.Name = $_ } }

    # Collect checked items
    $items = foreach ($item in $itt.AppsListView.Items) {
        
        $MyApp = Get-CheckBoxes
        
        if ($MyApp.IsChecked -and $appsDictionary.ContainsKey($MyApp.Content)) {
            [PSCustomObject]@{
                Name  = $MyApp.Content
                Check = "true"
            }
        }
    }

    # If no items are selected, show a message and return
    if ($items.Count -eq 0) {
        Message -key "Empty_save_msg" -icon "Information" -action "OK"
        return
    }

    # Open save file dialog
    $saveFileDialog = New-Object Microsoft.Win32.SaveFileDialog -Property @{
        Filter = "JSON files (*.itt)|*.itt"
        Title  = "Save JSON File"
    }

    if ($saveFileDialog.ShowDialog() -eq $true) {
        try {
            # Save items to JSON file
            $items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
            Write-Host "Saved: $($saveFileDialog.FileName)"
            Message -NoneKey "Saved successfully" -icon "info" -action "OK"

            # Uncheck all checkboxes
            foreach ($item in $itt.AppsListView.Items) {

                $item.Children[0].Children[0]

                if ($item.IsChecked) {
                    $item.IsChecked = $false
                }
            }
        } catch {
            Write-Warning "Failed to save file: $_"
            Message -NoneKey "Failed to save file" -icon "error" -action "OK"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Quick Install 
function Quick-Install {
    param (
        [string]$file
    )

    $QuickInstall = $true

    try {
        # Get file local or remote
        if ($file -match "^https?://") {

            $FileContent = Invoke-RestMethod -Uri $file -ErrorAction Stop

            if ($FileContent -isnot [array] -or $FileContent.Count -eq 0) {
                Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
                return
            }

        } else {

            $FileContent = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop

            if($file -notmatch "\.itt"){
                Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
                return
            }
        }

    } catch {
        Write-Warning "Failed to load or parse JSON file: $_"
        return
    }

    if($FileContent -eq $null){return}

    # Extract names from JSON data
    $filteredNames = $FileContent

    if (-not $global:CheckedItems) {
        $global:CheckedItems = [System.Collections.ArrayList]::new()
    }

    foreach ($MyApp in $FileContent) {
        $global:CheckedItems.Add(@{ Content = $MyApp.Name; IsChecked = $true })
    }

    # Get the apps list and collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['Window'].FindName('appslist').Items)

    # Set the filter predicate
    $collectionView.Filter = {
        param($item)

        if ($FileContent.Name -contains (Get-CheckBoxes).Content) {
            $item.Children[0].Children[0].IsChecked = $true
            return $true
        }
        return $false
    }

    # Start the installation process
    try {
        Invoke-Install *> $null
    } catch {
        Write-Warning "Installation failed: $_"
    }
}
function Set-Registry {
    <#
        .SYNOPSIS
        Sets or creates a registry value at a specified path.
        .DESCRIPTION
        This function sets a registry value at a given path. If the specified registry path does not exist, the function attempts to create the path and set the value. It handles different registry value types and includes error handling to manage potential issues during the process.
        .PARAMETER Name
        The name of the registry value to set or create. This parameter is required.
        .PARAMETER Type
        The type of the registry value. Common types include `String`, `DWord`, `QWord`, etc. This parameter is required.
        .PARAMETER Path
        The full path of the registry key where the value is to be set. This parameter is required.
        .PARAMETER Value
        The value to be set for the registry key. This parameter is required.
        .EXAMPLE
        Set-Registry -Name "EnableFeeds" -Type "DWord" -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Value 0
        Sets the registry value named "EnableFeeds" to 0 (DWORD) under "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds". If the path does not exist, it attempts to create it.
    #>
    param (
        [array]$tweak
    )
    try {
        if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}
        $tweak | ForEach-Object {
            if($_.Value -ne "Remove")
            {
                If (!(Test-Path $_.Path)) {
                    Add-Log -Message "$($_.Path) was not found, Creating..." -Level "info"
                    New-Item -Path $_.Path | Out-Null   
                }
                Add-Log -Message "Optmize $($_.name)..." -Level "info"
                New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null     
            }else
            {
                if($_.Name -ne $null)
                {
                    # Remove the specific registry value
                    Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
                    Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue
                }else{
                    # remove the registry path
                    Add-Log -Message "Remove $($_.Path)..." -Level "info"
                    Remove-Item -Path $_.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }
    } catch {
        Add-Log -Message "An error occurred: $_" -Level "WARNING"
    }
}
function Set-Taskbar {
    <#
        .SYNOPSIS
        Sets the taskbar progress and overlay icon in the application window.
        .DESCRIPTION
        The `Set-Taskbar` function allows setting the taskbar progress state, progress value, 
        and overlay icon for the application's taskbar item. 
        You can specify the progress state, value, and change the icon displayed on the taskbar.
        .EXAMPLE
        Set-Taskbar -progress 'Normal' -value 0.5 -icon 'done'
        This example sets the taskbar progress state to 'Normal' with a progress value of 50% 
        and shows a 'done' icon as an overlay for 2 seconds before switching back to the default icon.
    #>
    param (
        [string]$progress,
        [double]$value,
        [string]$icon
    )
    if ($value) {
        $itt["window"].taskbarItemInfo.ProgressValue = $value
    }
    if($progress)
    {
        switch ($progress) {
            'None' { $itt["window"].taskbarItemInfo.ProgressState = "None" }
            'Normal' { $itt["window"].taskbarItemInfo.ProgressState = "Normal" }
            'Indeterminate' { $itt["window"].taskbarItemInfo.ProgressState = "Indeterminate" }
            'Error' { $itt["window"].taskbarItemInfo.ProgressState = "Error" }
            default { throw "Set-Taskbar Invalid state" }
        }
    }
    if($icon)
    {
        switch ($icon) {
            "done" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/done.png"
            }
            "logo" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
            }
            "error" {
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/IT/main/static/Icons/error.png"
            }
            default{
                $itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/main//static/Icons/icon.ico"
            }
        }   
    }
}
function Startup  {

    $UsersCount = "https://ittools-7d9fe-default-rtdb.firebaseio.com/Count.json"
 
     ITT-ScriptBlock -ArgumentList $Debug $UsersCount -ScriptBlock {
 
         param($Debug,$UsersCount)
        function Telegram {
                 param (
                 [string]$Message
             )
             try {
                 #===========================================================================
                 #region Plz don't use this for bad things
                 #===========================================================================
                 $BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI"
                 $ChatID = "1299033071"
                 #===========================================================================
                 #endregion Plz don't use this for bad things
                 #===========================================================================
                 $SendMessageUrl = "https://api.telegram.org/bot$BotToken"
                 $PostBody = @{
                     chat_id    = $ChatID
                     text       = $Message
                 }
                 $Response = Invoke-RestMethod -Uri "$SendMessageUrl/sendMessage" -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
             }
             catch {
                 Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
             }
        }
 
        function GetCount {
             # Fetch data using GET request
             $response = Invoke-RestMethod -Uri $UsersCount -Method Get
         
             # Output the Users count
             return $response
        }
         
         function PlayMusic {

            $ST = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/OST.json" -Method Get

            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()
                # debug start
                    #$currentFileName = $itt.mediaPlayer.currentMedia.name
                    #Write-Host "Currently playing: $currentFileName"
                # debug end
            }
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
                switch ($itt.Date.Month, $itt.Date.Day) {
                    { $_ -eq 9, 1 } { return $ST.Favorite | Get-Random -Count $ST.Favorite.Count }
                    { $_ -eq 10, 6 -or $_ -eq 10, 7 } { return $itt.database.OST.Otobers | Get-Random -Count $ST.Otobers.Count }
                    default { return $ST.Tracks | Get-Random -Count $ST.Tracks.Count }
                }
            }
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                # Preload the shuffled playlist
                $shuffledTracks = GetShuffledTracks
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track.url
                    # Wait for the track to finish playing
                    while ($itt.mediaPlayer.playState -in @(3, 6)) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
            # Play the preloaded playlist
            PlayPreloadedPlaylist
        }
 
        function Quotes {
            function Get-Quotes {
                (Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }
            }
            
            function Show-Quote($text, $icon) {
                $itt.Quotes.Dispatcher.Invoke([Action]{ 
                    $itt.QuoteIcon.Text = $icon
                    $itt.Quotes.Text = $text
                })
            }
        
            Show-Quote $itt.database.locales.Controls.$($itt.Language).welcome ""
            Start-Sleep 20
            Show-Quote "Can you uncover the hidden secret? Dive into the source code, be the first to discover the feature, and integrate it into the tool" ""
            Start-Sleep 18
            $iconMap = @{quote=""; info=""; music=""; Cautton=""; default=""}
            do {
                foreach ($q in Get-Quotes) {
                    $icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
                    $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
                    Show-Quote $text $icon
                    Start-Sleep 20
                }
            } while ($true)
        }
 
        function NewUser {
 
             # Fetch current count from Firebase and increment it
             $currentCount = (Invoke-RestMethod -Uri $UsersCount -Method Get)
             $Runs = $currentCount + 1
 
             # Update the count in Firebase (no nesting, just the number)
             Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($Runs | ConvertTo-Json) -Headers @{ "Content-Type" = "application/json" }
 
             # Output success
             Telegram -Message "🎉New User`n`👤 $env:USERNAME `n`🌐 Language: $($itt.Language)`n`🖥 Total devices: $(GetCount)"
 
        }
 
        function Welcome {
 
             # Get the current value of the key
             $currentValue = (Get-ItemProperty -Path $itt.registryPath -Name "Runs" -ErrorAction SilentlyContinue).Runs
 
             # Increment the value by 1
             $newValue = [int]$currentValue + 1
 
             # Set the new value in the registry
             Set-ItemProperty -Path $itt.registryPath -Name "Runs" -Value $newValue
 
             # Check if the value is equal 1
             if ($newValue -eq 1) {NewUser}
 
             Write-Host "`n ITT has been used on $(GetCount) devices worldwide.`n" -ForegroundColor White
        }
 
        function LOG {
             param (
                 $message,
                 $color
             )
             Write-Host "`n` #StandWithPalestine"
             Write-Host "  ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _"
             Write-Host " |_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |"
             Write-Host "  | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |"
             Write-Host "  | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___"
             Write-Host " |___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|"
             Write-Host " Launch Anytime, Anywhere! `n` " 
             Write-Host " Telegram: https://t.me/emadadel4"
             Write-Host " Source Code: https://github.com/emadadel4/itt"
             Welcome
        }
         # debug start
             if($Debug){return}
         # debug end
         LOG
         PlayMusic
         Quotes
     }
 }
function ChangeTap {
    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.
        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface. It uses a hash table to map tab names to their corresponding button visibility settings and list values. The function iterates through the tabs and updates the UI elements accordingly.
        .EXAMPLE
        ChangeTap
        Updates the visibility of the 'installBtn' and 'applyBtn' and sets the 'currentList' property based on the currently selected tab.
        .PARAMETER None
        This function does not take any parameters. It operates on predefined UI elements and settings.
        .NOTES
        Ensure that the `$itt['window']` object and its method `FindName` are correctly implemented and available in the context where this function is used. The function relies on these objects to access and modify UI elements.
    #>
    $tabSettings = @{
            'apps'        = @{ 
            'installBtn' = 'Visible';
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'appslist'; 
            'CurrentCategory' = 'AppsCategory' 
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'tweakslist'; 
            'CurrentCategory' = 'TwaeksCategory'
        }
        'SettingsTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'SettingsList'
        }
    }
    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {
        # Check if the current tab is selected
        if ($itt['window'].FindName($tab).IsSelected) {
            $settings = $tabSettings[$tab]
            # Update button visibility and currentList based on the selected tab
            $itt.CurrentList = $settings['CurrentList']
            $itt.CurrentCategory = $settings['CurrentCategory']
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            $itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
            break
        }
    }
}
function Uninstall-AppxPackage {
    <#
        .SYNOPSIS
        Uninstalls an AppX package and removes any provisioned package references.
        .DESCRIPTION
        This function uninstalls a specified AppX package from the current user profile and removes any provisioned package references from the system. It uses PowerShell commands to handle both the removal of the AppX package and any associated provisioned package. Logging is used to track the process.
        .PARAMETER Name
        The name or partial name of the AppX package to be uninstalled. This parameter is required.
        .EXAMPLE
        Uninstall-AppxPackage -Name "Microsoft.BingNews"
        Attempts to remove the AppX package with a display name that includes "Microsoft.BingNews" from the current user profile and any provisioned package references from the system.
        .NOTES
        - Ensure that the `$Name` parameter correctly matches the display name or part of the display name of the AppX package you wish to uninstall.
        - The function runs PowerShell commands in a new process to handle the removal operations.
        - Add-Log should be implemented in your script or module to handle logging appropriately.
    #>
    param (
        [array]$tweak
    )
    try {
        foreach ($name in $tweak) {
            Add-Log -Message "Removing $name..." -Level "info"
            Get-AppxPackage "*$name*" | Remove-AppxPackage -ErrorAction SilentlyContinue
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        }
    } 
    catch 
    {
        Add-Log -Message "PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL $NAME." -Level "WARNING"
    }
}
function Invoke-Install {
    <#
        .SYNOPSIS
        Handles the installation of selected applications by invoking the appropriate installation methods.
        .DESCRIPTION
        The `Invoke-Install` function manages the process of installing applications based on user selection. It performs the following tasks:
        1. Checks if there are any selected applications to install.
        2. Displays a warning message if no applications are selected or if a process is already running.
        3. Shows a confirmation dialog to the user asking for permission to proceed with the installation.
        4. If confirmed, it filters the list view to show only selected items and starts the installation process.
        5. Updates the UI to reflect the installation status.
        6. Executes installation commands for applications using Chocolatey (`Choco`), Winget, or custom download methods.
        7. Updates the UI once the installation is complete and finishes the process.
    #>
    
    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"
    
    if($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }
    # Get Selected apps
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    $selectedApps = Get-SelectedItems -Mode "Apps"

    if($selectedApps.Count -gt 0)
    {
        # Show only selected item
        Show-Selected -ListView "AppsListView" -Mode "Filter"
    }
    else
    {
        # Show Message
        Message -key "App_empty_select" -icon "info" -action "OK"
        return
    }

    if($QuickInstall -eq $false)
    {
        $result = Message -key "Install_msg" -icon "ask" -action "YesNo"
    }
    
    if ($result -eq "no") {
        Show-Selected -ListView "AppsListView" -Mode "Default"
        Clear-Item -ListView "AppsListView"
        return
    }

    ITT-ScriptBlock -ArgumentList @($SelectedApps,$QuickInstall,$Debug) -ScriptBlock {

        param($SelectedApps,$QuickInstall,$debug)

        $itt.ProcessRunning = $true

        UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Downloading" -TextIcon "installIcon" -Icon "  " -Width "auto"

        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($app in $SelectedApps) {
            
            if ($app.Winget -ne "none" -or $app.Choco -ne "none") {

                $chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($app.Choco)"
                #Remove-Item -Path "$chocoFolder" -Recurse -Force
                #Remove-Item -Path "$chocoFolder.install" -Recurse -Force
                #Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
                
                Install-App -Name $app.Name -Winget $app.Winget -Choco $app.Choco
                
                # Debugging
                if ($Debug) { Write-Host "$($app.Name) $($app.Default.url)" }
            }
            else {
                Native-Downloader `
                -name           $app.Name `
                -url            $app.Default.url `
                -launcher       $app.Default.launcher `
                -portable       $app.Default.portable `
                -installArgs    $app.Default.args
        
                # Debugging
                if ($Debug) { Add-Log -Message "$($app.Name) $($app.Default.url)" -Level "debug" }
            }
        }
        
        Finish -ListView "AppsListView"

        $itt.ProcessRunning = $false
        $QuickInstall = $false


        
    }

    #Clear the checked items
    $global:CheckedItems = @()
}
function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
        .DESCRIPTION
        The `Invoke-Apply` function manages the process of applying selected tweaks based on user selection. It performs the following tasks:
        1. Retrieves the list of selected tweaks using `Get-SelectedItems` with mode "Tweaks".
        2. Displays a warning message if a process is already running or if no tweaks are selected.
        3. Filters the list view to show only selected items and asks for user confirmation to proceed with applying tweaks.
        4. If confirmed, it starts the application of the selected tweaks.
        5. Executes the appropriate tweak operations based on the type of tweak (e.g., commands, registry modifications, Appx package removal, service management).
        6. Updates the UI to reflect the progress and completion of the tweak application.
        7. Finishes the process and logs a message indicating that some tweaks may require a restart.
    #>

    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0

    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    if ($selectedTweaks.Count -eq 0)
    {
        Message -key "Tweak_empty_select" -icon "info" -action "OK"
        return
    }
    else
    {
        Show-Selected -ListView "TweaksListView" -Mode "Filter"
    }

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

    if ($result -eq "no") 
    {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        Clear-Item -ListView "TweaksListView"
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks,$debug)

        $itt.ProcessRunning = $true

        UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Applying" -TextIcon "applyIcon" -Icon "  " -Width "auto"

        $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {
            Add-Log -Message "::::$($tweak.Name)::::" -Level "info"
            $tweak | ForEach-Object {
                if ($_.Script -and $_.Script.Count -gt 0) {
                    ExecuteCommand -tweak $tweak.Script
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.Registry -and $_.Registry.Count -gt 0) {
                  Set-Registry -tweak $tweak.Registry
                  if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.AppxPackage -and $_.AppxPackage.Count -gt 0) {
                    Uninstall-AppxPackage -tweak $tweak.AppxPackage
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.ScheduledTask -and $_.ScheduledTask.Count -gt 0) {
                    Remove-ScheduledTasks -tweak $tweak.ScheduledTask
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
                if ($_.Services -and $_.Services.Count -gt 0) {
                    Disable-Service -tweak $tweak.Services
                    if($_.Refresh -eq $true)
                    {
                        Refresh-Explorer
                    }
                } 
            }
        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}
function Invoke-Toogle {

    <#
        .SYNOPSIS
        Toggles various system settings based on the provided debug parameter.

        .DESCRIPTION
        The `Invoke-Toggle` function dynamically toggles system settings such as dark mode, file extensions visibility, 
        and performance options. It determines the appropriate action based on the input parameter and executes 
        the corresponding function.

        .EXAMPLE
        Invoke-Toggle -Debug "darkmode"
        Toggles the system's dark mode setting.
    #>

    Param ([string]$Debug)

    $toggleActions = @{
        "showfileextensions" = "Invoke-ShowFile-Extensions"; "darkmode" = "Invoke-DarkMode"
        "showsuperhidden" = "Invoke-ShowFile"; "numlock" = "Invoke-NumLock"
        "stickykeys" = "Invoke-StickyKeys"; "mouseacceleration" = "Invoke-MouseAcceleration"
        "endtaskontaskbarwindows11" = "Invoke-TaskbarEnd"; "clearpagefileatshutdown" = "Invoke-ClearPageFile"
        "autoendtasks" = "Invoke-AutoEndTasks"; "performanceoptions" = "Invoke-PerformanceOptions"
        "launchtothispc" = "Invoke-LaunchTo"; "disableautomaticdriverinstallation" = "Invoke-DisableAutoDrivers"
    }

    if ($toggleActions[$Debug.ToLower()]) { & $toggleActions[$Debug.ToLower()] $(Get-ToggleStatus $Debug) }
    else { Write-Warning "Invalid toggle: $Debug"; Add-Log -Message "Invalid toggle: $Debug" -Level "warning" }
}

function Invoke-AutoEndTasks {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Control Panel\Desktop",
        [string]$name = "AutoEndTasks"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto end tasks" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "Disabled"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-LaunchTo {
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
        [string]$name = "LaunchTo"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Launch to This PC" -Level "Apply"
            }
            else {
                $value = 2
                Add-Log -Message "Launch to Quick Access" -Level "Disabled"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        Refresh-Explorer
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-ClearPageFile {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param(
        $Enabled,
        [string]$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management",
        [string]$name = "ClearPageFileAtShutdown"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Show End Task on taskbar" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disable End Task on taskbar" -Level "Disabled"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-DarkMode {
    <#
        .SYNOPSIS
        Toggles the Windows theme between Dark Mode and Light Mode based on the provided setting.
        .DESCRIPTION
        The `Invoke-DarkMode` function enables or disables Dark Mode for Windows based on the `$DarkModeEnabled` parameter.
        - If `$DarkModeEnabled` is `$true`, it sets the system to Dark Mode.
        - If `$DarkModeEnabled` is `$false`, it sets the system to Light Mode.
        The function updates the application's theme resources accordingly and restarts the Windows Explorer process to apply the changes.
        .PARAMETER DarkModeEnabled
        A boolean value indicating whether Dark Mode should be enabled (`$true`) or Light Mode should be enabled (`$false`).
        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $true
        This example sets the Windows theme to Dark Mode.
        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $false
        This example sets the Windows theme to Light Mode.
        .NOTES
        - The function modifies registry settings related to Windows themes.
        - It restarts Windows Explorer to apply the theme changes.
        - Error handling is included for security exceptions and item not found exceptions.
    #>
    Param($DarkMoveEnabled)
    Try{
        $Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme").Theme
        if ($DarkMoveEnabled -eq $false){
            $DarkMoveValue = 0
            Add-Log -Message "Dark Mode" -Level "Apply"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            }
        }
        else {
            $DarkMoveValue = 1
            Add-Log -Message "Light Mode" -Level "Disabled"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            }
        }
        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $DarkMoveValue
        Set-ItemProperty -Path $Path -Name SystemUsesLightTheme -Value $DarkMoveValue
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-DisableAutoDrivers {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param(
        $Enabled,
        [string]$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching",
        [string]$name = "SearchOrderConfig"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto drivers update" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto drivers update" -Level "Disabled"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-MouseAcceleration {
    <#
        .SYNOPSIS
        Toggles mouse acceleration settings on or off.
        .DESCRIPTION
        This function allows you to enable or disable mouse acceleration by adjusting the related registry settings. 
        If the `$Mouse` parameter is set to `$false`, mouse acceleration is enabled with default values. 
        If it is set to `$true`, mouse acceleration is disabled. Additionally, you can specify custom values for 
        `MouseSpeed`, `Threshold1`, and `Threshold2`.
        .EXAMPLE
        # Disables mouse acceleration
        MouseAcceleration -Mouse $true
        # Enables mouse acceleration with default values
        MouseAcceleration -Mouse $false
        # Enables mouse acceleration with custom values
        MouseAcceleration -Mouse $false -MouseSpeed 1 -Threshold1 4 -Threshold2 8
        # Disables mouse acceleration and logs actions
        MouseAcceleration -Mouse $true -Path "HKCU:\Control Panel\Mouse"
    #>
    param (
        $Mouse,
        $Speed = 0,
        $Threshold1  = 0,
        $Threshold2  = 0,
        [string]$Path = "HKCU:\Control Panel\Mouse"
    )
    try {
        if($Mouse -eq $false)
        {
            Add-Log -Message "Mouse Acceleration" -LEVEL "Apply"
            $Speed = 1
            $Threshold1 = 6
            $Threshold2 = 10
        }else {
            $Speed = 0
            $Threshold1 = 0
            $Threshold2 = 0
            Add-Log -Message "Mouse Acceleration" -LEVEL "Disabled"
        }
        Set-ItemProperty -Path $Path -Name MouseSpeed -Value $Speed
        Set-ItemProperty -Path $Path -Name MouseThreshold1 -Value $Threshold1
        Set-ItemProperty -Path $Path -Name MouseThreshold2 -Value $Threshold2
    }
    catch {
        Add-Log -Message "Unable  set valuse" -LEVEL "ERROR"
    }
}
function Invoke-NumLock {
    <#
        .SYNOPSIS
        Toggles the Num Lock state on the system by modifying registry settings.
        .DESCRIPTION
        The `Invoke-NumLock` function sets the state of the Num Lock key based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Num Lock is enabled.
        - If `$Enabled` is `$false`, Num Lock is disabled.
        The function modifies the registry settings under `HKU\.Default\Control Panel\Keyboard` to achieve this.
        .PARAMETER Enabled
        A boolean value that determines whether Num Lock should be enabled (`$true`) or disabled (`$false`).
        .EXAMPLE
        Invoke-NumLock -Enabled $true
        This example enables Num Lock.
        .EXAMPLE
        Invoke-NumLock -Enabled $false
        This example disables Num Lock.
        .NOTES
        - Requires administrative privileges to modify registry settings.
        - The registry path used is for the default user profile and may not affect the currently logged-in user.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Enabled
    )
    try {
        if ($Enabled -eq $false)
        { 
            Add-Log -Message "Numlock Enabled" -Level "Apply"
            $value = 2 
        } 
        else
        { 
            Add-Log -Message "Numlock Disabled" -Level "Disabled"
             $value = 0
        }
        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS -ErrorAction Stop
        $Path = "HKU:\.Default\Control Panel\Keyboard"
        $Path2 = "HKCU:\Control Panel\Keyboard"
        Set-ItemProperty -Path $Path -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
        Set-ItemProperty -Path $Path2 -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
    }
    catch {
        Write-Warning "An error occurred: $($_.Exception.Message)"
    }
}
function Invoke-PerformanceOptions {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects",
        [string]$name = "VisualFXSetting"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 2
                Add-Log -Message "Enabled auto end tasks" -Level "Apply"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "Disabled"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        Refresh-Explorer
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-ShowFile {
    <#
        .SYNOPSIS
        Toggles the visibility of hidden files and folders in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile` function updates the Windows registry to show or hide hidden files and folders in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, hidden items and super-hidden items (e.g., system files) are shown.
        - If `$Enabled` is `$false`, these items are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether hidden files and folders should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile -Enabled $true
        This example makes hidden files and folders visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile -Enabled $false
        This example hides hidden files and folders in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param($Enabled)
    Try {
        if ($Enabled -eq $false)
        { 
           $value = 1
           Add-Log -Message "Show hidden files , folders etc.." -Level "Apply"
        } 
        else 
        { 
            $value = 2
            Add-Log -Message "Don't Show hidden files , folders etc.." -Level "Disabled"
        }
        $hiddenItemsKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set registry values to show or hide hidden items
        Set-ItemProperty -Path $hiddenItemsKey -Name Hidden -Value $value
        Set-ItemProperty -Path $hiddenItemsKey -Name ShowSuperHidden -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set registry keys due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set registry keys due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-ShowFile-Extensions {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 0
            Add-Log -Message "Hidden extensions" -Level "Apply"
        }
        else {
            $value = 1
            Add-Log -Message "Hidden extensions" -Level "Disabled"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $Path -Name HideFileExt -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-TaskbarEnd {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 1
            Add-Log -Message "Show End Task on taskbar" -Level "Apply"
        }
        else {
            $value = 0
            Add-Log -Message "Disable End Task on taskbar" -Level "Disabled"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings\"
        $name = "TaskbarEndTask"
        if (-not (Test-Path $path)) {
            New-Item -Path $path -Force | Out-Null
            New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
        }else {
            Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
            Refresh-Explorer
            Add-Log -Message "This Setting require a restart" -Level "INFO"
        }
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-StickyKeys {
     <#
        .SYNOPSIS
        Toggles Sticky Keys functionality in Windows.
        .DESCRIPTION
        The `Invoke-StickyKeys` function updates the Windows registry settings to enable or disable Sticky Keys based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Sticky Keys is enabled with a specific configuration.
        - If `$Enabled` is `$false`, Sticky Keys is disabled with a different configuration.
        - Note: Enabling Sticky Keys may require restarting Windows Explorer.
        .PARAMETER Enabled
        A boolean value that determines whether Sticky Keys should be enabled (`$true`) or disabled (`$false`).
        .EXAMPLE
            Invoke-StickyKeys -Enabled $true
        This example enables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.
        .EXAMPLE
            Invoke-StickyKeys -Enabled $false
        This example disables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param($Enabled)
    Try {
        if ($Enabled -eq $false){
            $value = 510
            $value2 = 510
            Add-Log -Message "Sticky Keys" -Level "Apply"
        }
        else {
            $value = 58
            $value2 = 122
            Add-Log -Message "Sticky Keys" -Level "Disabled"
        }
        $Path = "HKCU:\Control Panel\Accessibility\StickyKeys"
        $Path2 = "HKCU:\Control Panel\Accessibility\Keyboard Response"
        Set-ItemProperty -Path $Path -Name Flags -Value $value
        Set-ItemProperty -Path $Path2 -Name Flags -Value $value2
        Refresh-Explorer
        Add-Log -Message "This Setting require a restart" -Level "INFO"
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
    }
}
function About {
    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)
    # Get main style theme
    $itt['about'].Resources.MergedDictionaries.Clear()
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($($itt.Theme)))
    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_Click({Start-Process("https://t.me/emadadel4")})
    $itt.about.FindName("github").Add_Click({Start-Process("https://github.com/emadadel4/itt")})
    $itt.about.FindName("blog").Add_Click({Start-Process("https://emadadel4.github.io")})
    $itt.about.FindName("yt").Add_Click({Start-Process("https://www.youtube.com/@emadadel4")})
    $itt.about.FindName("coffee").Add_Click({Start-Process("https://buymeacoffee.com/emadadel")})
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.$($itt.Language)
    # Show window
    $itt.about.ShowDialog() | Out-Null
}
function ITTShortcut {
    $iconPath = "$env:ProgramData\itt\itt.ico"
    Invoke-WebRequest -Uri $itt.icon -OutFile $iconPath
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
    $Shortcut.TargetPath, $Shortcut.Arguments, $Shortcut.IconLocation = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe", "-ExecutionPolicy Bypass -Command ""irm bit.ly/ittea | iex""", $iconPath
    $Shortcut.Save()
}
function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
        .DESCRIPTION
        The `Search` function retrieves the text from the search input, converts it to lowercase, and removes any non-alphanumeric characters. It then applies a filter to the items in the currently displayed list view based on the search input. The filter checks if the search input matches any checkbox content within stack panels in the list view.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)

    $collectionView.Filter = {
        param ($item)

        # Ensure item structure is valid
        if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
            return $false
        }

        # Search within first-level child content
        return $item.Children[0].Children[0].Content -match $filter
    }
}

function FilterByCat {

    <#
        .SYNOPSIS
        Filters the items in the Apps list view based on the selected category.
        .DESCRIPTION
        The `FilterByCat` function filters the items displayed in the Apps list view based on a specified category. It updates the view to show only those items that match the selected category. If the selected category is not valid, it clears the filter and displays all items. The function also ensures that the Apps tab is selected and scrolls to the top of the list view after applying the filter.
        .EXAMPLE
        FilterByCat -Cat "Media"
    #>

    param ($Cat)

    # List of valid categories
    $validCategories = @(
        "Web Browsers", "Media", "Media Tools", "Documents", "Compression",
        "Communication", "File Sharing", "Imaging", "Gaming", "Utilities",
        "Disk Tools", "Development", "Security", "Portable", "Runtimes",
        "Drivers", "Performance", "Privacy", "Fixer", "Personalization",
        "Power", "Protection", "Classic", "GPU Drivers"
    )

    # Get the collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)

    if ($validCategories -contains $Cat) {
        # Apply the filter
        $collectionView.Filter = {
            param ($item)

            # Ensure item structure is valid
            if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
                return $false
            }

            # Filter by category tag
            return $item.Children[0].Children[0].Tag -eq $Cat
        }
    }
    else {
        # Clear filter if category is invalid
        $collectionView.Filter = $null
    }

    # Refresh the view
    $collectionView.Refresh()

    # Scroll to top if items exist
    $listView = $itt['window'].FindName($itt.CurrentList)
    if ($listView.Items.Count -gt 0) {
        $itt.AppsListView.ScrollIntoView($listView.Items[0])
    }
}

function ClearFilter {

    $itt.AppsListView.Clear()
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)
    $collectionView.Filter = $null
}
$KeyEvents = {
    if ($itt.ProcessRunning) { return }

    $modifiers = $_.KeyboardDevice.Modifiers
    $key = $_.Key

    switch ($key) {
        "Enter" {
            if ($itt.currentList -eq "appslist") { Invoke-Install }
            elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
        }
        "S" {
            if ($modifiers -eq "Ctrl") {
                if ($itt.currentList -eq "appslist") { Invoke-Install }
                elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
            }
            elseif ($modifiers -eq "Shift") { Save-File }
        }
        "D" { if ($modifiers -eq "Shift") { Load-SavedFile } }
        "M" {
            if ($modifiers -eq "Shift") {
                $global:toggleState = -not $global:toggleState
                if ($global:toggleState) { Manage-Music -action "SetVolume" -volume 100 }
                else { Manage-Music -action "SetVolume" -volume 0 }
            }
        }
        # Easter Egg: Uncomment to enable functionality
        # "N" { if ($modifiers -eq "Ctrl") { $itt.mediaPlayer.controls.next() } }
        # "B" { if ($modifiers -eq "Ctrl") { $itt.mediaPlayer.controls.previous() } }
        "Q" {
            if ($modifiers -eq "Ctrl") {
                $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "apps" }
            }
            elseif ($modifiers -eq "Shift") { RestorePoint }
        }
        "W" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "tweeksTab" } } }
        "E" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "SettingsTab" } } }
        "I" {
            if ($modifiers -eq "Ctrl") { About }
            elseif ($modifiers -eq "Shift") { ITTShortcut }
        }
        "C" { if ($modifiers -eq "Shift") { Start-Process explorer.exe "C:\ProgramData\chocolatey\lib" } }
        "T" { if ($modifiers -eq "Shift") { Start-Process explorer.exe $env:ProgramData\itt } }
        "G" { if ($modifiers -eq "Ctrl") { $this.Close() } }
        "F" { if ($modifiers -eq "Ctrl") { $itt.SearchInput.Focus() } }
        "Escape" {
            $itt.SearchInput.MoveFocus([System.Windows.Input.TraversalRequest]::New([System.Windows.Input.FocusNavigationDirection]::Next))
            $itt.SearchInput.Text = $null
            $itt["window"].FindName("search_placeholder").Visibility = "Visible"
        }
        "A" {
            if ($modifiers -eq "Ctrl" -and ($itt.CurrentCategory -eq "AppsCategory" -or $itt.CurrentCategory -eq "TwaeksCategory")) {
                $itt["window"].FindName($itt.CurrentCategory).SelectedIndex = 0
            }
        }
    }
}
function Message {
    <#
        .SYNOPSIS
            Displays a localized message box to the user with a specified icon.
        .DESCRIPTION
            The `Message` function shows a message box with a localized message based on the provided key and icon type.
            It retrieves the message text from a localization database and displays it using the Windows MessageBox class.
            The icon type determines the visual representation of the message box, which can be "Warning" or "Question".
        .PARAMETER key
            The key used to retrieve the localized message from the `itt.database.locales.Controls` object.
            This key should correspond to a valid entry in the localization database for the current language.
        .PARAMETER icon
            The type of icon to be displayed in the message box. Valid values are:
            - "Warning" for a warning icon
            - "Question" for a question icon
            - "Information" for Information icon
        .EXAMPLE
            Message -key "Welcome" -icon "Warning"
            Displays a message box with the message associated with the "Welcome" key and a warning icon.
        .EXAMPLE
            Message -key "ConfirmAction" -icon "Question"
            Displays a message box with the message associated with the "ConfirmAction" key and a question icon.
        .NOTES
            Ensure that the `itt.database.locales.Controls` object is properly populated with localization data and that the specified keys exist for the current language.
    #>
    param(
        [string]$key,
        [string]$NoneKey,
        [string]$title = "ITT",
        [string]$icon,
        [string]$action
    )

    $iconMap = @{ info = "Information"; ask = "Question"; warning = "Warning"; default = "Question" }
    $actionMap = @{ YesNo = "YesNo"; OK = "OK"; default = "OK" }
    $icon = if ($iconMap.ContainsKey($icon.ToLower())) { $iconMap[$icon.ToLower()] } else { $iconMap.default }
    $action = if ($actionMap.ContainsKey($action.ToLower())) { $actionMap[$action.ToLower()] } else { $actionMap.default }
    $msg = if ([string]::IsNullOrWhiteSpace($key)) { $NoneKey } else { $itt.database.locales.Controls.$($itt.Language).$key }
    [System.Windows.MessageBox]::Show($msg, $title, [System.Windows.MessageBoxButton]::$action, [System.Windows.MessageBoxImage]::$icon)
}    
function Notify {
    param([string]$title, [string]$msg, [string]$icon, [int]$time)
    $n = New-Object System.Windows.Forms.NotifyIcon -Property @{ 
        Icon = [System.Drawing.SystemIcons]::Information
        BalloonTipIcon = $icon; BalloonTipText = $msg; BalloonTipTitle = $title; Visible = $true 
    }
    $n.ShowBalloonTip($time); $n.Dispose()
}
function Manage-Music {

    <#
        .SYNOPSIS
        Manages music playback, volume, and related resources in the Install Tweaks Tool.

        .DESCRIPTION
        This function allows you to control the music volume, stop music playback, and clean up resources.
        It supports setting the volume, stopping music, and stopping all runspaces and processes.
    #>

    param([string]$action, [int]$volume = 0)

    switch ($action) {
        "SetVolume" {
            $itt.mediaPlayer.settings.volume = $volume
            $global:toggleState = ($volume -ne 0)
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$volume" -Force
            $itt["window"].title = "Install Tweaks Tool #StandWithPalestine " + @("🔊", "🔈")[$volume -eq 0]
        }
        "StopAll" {
            $itt.mediaPlayer.controls.stop(); $itt.mediaPlayer = $null
            $itt.runspace.Dispose(); $itt.runspace.Close()
            $script:powershell.Dispose(); $script:powershell.Stop()
            $newProcess.exit; [System.GC]::Collect()
        }
        default { Write-Host "Invalid action. Use 'SetVolume' or 'StopAll'." }
    }
}
function System-Default {
    try {
        $dc = $itt.database.locales.Controls.$shortCulture
        if (-not $dc -or [string]::IsNullOrWhiteSpace($dc)) {
            Add-Log -Message "This language ($shortCulture) is not supported yet, fallback to English" -Level "Info"
            $dc = $itt.database.locales.Controls.en
        }
        $itt["window"].DataContext = $dc
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}

function Set-Language {
    param ([string]$lang)
    if ($lang -eq "default") { System-Default }
    else {
        $itt.Language = $lang
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value $lang -Force
        $itt["window"].DataContext = $itt.database.locales.Controls.$lang
    }
}

function SwitchToSystem {

    <#
        .SYNOPSIS
        Functions to manage application theme settings.

        .DESCRIPTION
        SwitchToSystem resets the theme to the system default and applies the appropriate resource.
        Set-Theme applies a user-defined theme and updates the registry accordingly.
    #>

    try {
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $theme = if ($AppsTheme -eq "0") { "Dark" } elseif ($AppsTheme -eq "1") { "Light" } else { Write-Host "Unknown theme: $AppsTheme"; return }
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($theme))
    }
    catch { Write-Host "Error: $_" }
}

function Set-Theme {
    param ([string]$Theme)
    try {
        $itt['window'].Resources.MergedDictionaries.Clear()
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($Theme))
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value $Theme -Force
        $itt.Theme = $Theme
    }
    catch { Write-Host "Error: $_" }
}
function UpdateUI {
    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.
        .DESCRIPTION
        The `UpdateUI` function is designed to modify various UI components within the application. 
        It updates the width and text of a specified button, changes the text of a related text block, and sets the icon for another text block. 
        This function is typically used to reflect different states of the application, such as during installations or other processes.
        .PARAMETER Button
        Specifies the name of the button element to be updated.
        .PARAMETER ButtonText
        Specifies the name of the text block associated with the button whose text will be updated.
        .PARAMETER Icon
        Specifies the icon to be set in the text block.
        .PARAMETER Content
        Specifies the content to be displayed as button text. This content is localized based on the application's current language setting.
        .PARAMETER TextIcon
        Specifies the name of the text block where the icon will be displayed.
        .PARAMETER Width
        Specifies the width to set for the button. The default value is "100".
        .EXAMPLE
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "downloading" -TextIcon "installIcon" -Icon "  " -Width "150"
        This example updates the UI by setting the width of the "InstallBtn" button to 150, changing the text of the "installText" text block to "downloading", 
        and setting the icon for the "installIcon" text block to "  ".
    #>
    param(
        [string]$Button,
        [string]$ButtonText,
        [string]$Icon,
        [string]$Content,
        [string]$TextIcon,
        [string]$Width = "100"
    )
    $applyBtn = $itt.database.locales.Controls.$($itt.Language).$Content
    $itt['window'].Dispatcher.Invoke([Action]{
        # Button and Button Text
        $itt.$Button.Width = $Width
        $itt.$ButtonText.Text = "$applyBtn"
        # Textblock as Icon
        $itt.$TextIcon.Text = "$icon"
    })
}
#===========================================================================
#endregion End Main Functions
#===========================================================================
#===========================================================================
#region Begin WPF Main Window
#===========================================================================
$MainWindowXaml = '<!--Main Window-->
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window" 
Title="Install Tweak Tool #StandWithPalestine" 
WindowStartupLocation = "CenterScreen" 
Background="{DynamicResource PrimaryBackgroundColor}"
Height="700" Width="1000" 
MinHeight="600" 
MinWidth="900" 
Topmost="False"  
ShowInTaskbar = "True" 
TextOptions.TextFormattingMode="Ideal"
TextOptions.TextRenderingMode="Auto"
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico">
<Window.Resources>
    <!--Listview Fade in-->
    <Storyboard x:Key="FadeOutStoryboard">
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0" To="1" Duration="0:0:0.1" />
    </Storyboard>
<!--Listview Fade in-->
<!--Logo Fade in-->
    <Storyboard x:Key="Logo" RepeatBehavior="Forever">
        <!-- Fade Out -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0.0" To="1.0"
            Duration="0:0:01" /> <!-- Fade out duration -->
        <!-- Fade In -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="1.0" To="0.0"
            Duration="0:0:0.9"
            BeginTime="0:0:05" /> <!-- Start fade in after 21 seconds -->
    </Storyboard>
<!--Logo Fade in-->
<!-- Define the FadeOut and FadeIn animations with looping -->
    <Storyboard x:Key="FadeOutInLoopStoryboard">
        <!-- Fade Out Animation -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="1.0"
            To="0.0"
            Duration="0:0:1" />
        <!-- Fade In Animation -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0.0"
            To="1.0"
            Duration="0:0:1"
            BeginTime="0:0:1" />
    </Storyboard>
<!-- Define the FadeOut and FadeIn animations with looping -->
<!--Image Style-->
    <Style TargetType="Image">
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource Logo}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End Image Style-->
<!--Button Style-->
    <Style TargetType="Button">
        <Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
        <Setter Property="BorderBrush" Value="Transparent"/>
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Padding" Value="10,5"/>
        <Setter Property="FontSize" Value="16"/>
        <Setter Property="Cursor" Value="Hand"/>
        <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Button">
                    <Grid>
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="0" CornerRadius="25">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </Grid>
            </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
                <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
            </Trigger>
            <Trigger Property="IsPressed" Value="True">
                <Setter Property="Background" Value="{DynamicResource PressedButtonColor}"/>
            </Trigger>
        </Style.Triggers>
    </Style>
<!--End Button Style-->
<!--ListViewItem Style-->
    <Style TargetType="ListViewItem">
        <Setter Property="Margin" Value="5 5 5 0"/>
        <Setter Property="BorderThickness" Value="0.5"/>
        <Setter Property="BorderBrush" Value="DarkGray"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ListViewItem">
                    <Border CornerRadius="0"
                            Padding="{TemplateBinding Padding}" 
                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}">
                        <Border.Background>
                            <LinearGradientBrush StartPoint="1,5" EndPoint="5,5">
                                <GradientStop Color="{DynamicResource ListViewCardLeftColor}" Offset="1"/>
                                <GradientStop Color="{DynamicResource ListViewCardRightColor}" Offset="1"/>
                            </LinearGradientBrush>
                        </Border.Background>
                        <ContentPresenter HorizontalAlignment="Left"
                                        VerticalAlignment="Center"
                                        ContentSource="Content"/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource FadeOutStoryboard}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End ListViewItem Style-->
<!--CheckBox Style-->
    <Style TargetType="CheckBox">
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="0"/>
        <Setter Property="Padding" Value="6"/>
        <Setter Property="BorderThickness" Value="1.5"/>
        <Setter Property="BorderBrush" Value="{DynamicResource PrimaryButtonForeground}"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <StackPanel Orientation="Horizontal">
                        <!-- Checkbox box -->
                        <Border Name="CheckRadius" Width="18" Height="18" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="20" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                            <!-- Checkmark arrow inside the box -->
                            <Path x:Name="CheckMark" Width="13" Height="13" Stretch="Uniform" Stroke="WhiteSmoke" StrokeThickness="3" Data="M 0 5 L 4 8 L 10 0" Visibility="Collapsed"/>
                        </Border>
                        <!-- Content beside the checkbox -->
                        <ContentPresenter Margin="4,0,0,0" VerticalAlignment="Center"/>
                    </StackPanel>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="True">
                            <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                        <Trigger Property="IsChecked" Value="False">
                            <Setter Property="Background" Value="White"/>
                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End CheckBox Style-->
<!--SearchBox Style-->
    <Style x:Key="SearchBox" TargetType="TextBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="Padding" Value="8"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TextBox">
                    <Border Margin="0" 
                            Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="{TemplateBinding BorderThickness}" 
                            CornerRadius="15">
                        <ScrollViewer x:Name="PART_ContentHost" 
                                    Background="Transparent"/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End SearchBox Style-->
<!--Label Style-->
  <Style TargetType="Label">
    <Setter Property="Background" Value="Transparent"/>
    <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
    <Setter Property="Padding" Value="7.5"/>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Label">
                <Border Padding="{TemplateBinding Padding}" Background="{TemplateBinding Background}"
                        BorderBrush="{TemplateBinding BorderBrush}"
                        BorderThickness="{TemplateBinding BorderThickness}"
                        CornerRadius="0">
                    <ContentPresenter HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}"
                                      VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
                </Border>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
  </Style>
<!--End Label Style-->
<!--TextBlock Style-->
    <Style TargetType="TextBlock">
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
        <Setter Property="TextOptions.TextFormattingMode" Value="Ideal" />
        <Setter Property="TextOptions.TextRenderingMode" Value="ClearType" />
    </Style>
<!--End TextBlock Style-->
<!-- Menu Style -->
    <Style TargetType="Menu">
        <Setter Property="Background" Value="#FFFFFF"/>
        <Setter Property="Foreground" Value="#000000"/>
        <Setter Property="Margin" Value="5"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="Menu">
                    <Border Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="0" 
                            CornerRadius="8">
                        <ItemsPresenter />
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <!-- <BeginStoryboard Storyboard="{StaticResource FadeIn}" /> -->
            </EventTrigger>
        </Style.Triggers>
    </Style>
    <Style TargetType="MenuItem">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="1"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="0.5"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="MenuItem">
                    <Border x:Name="Border"
                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}"
                            Padding="8"
                            CornerRadius="0">
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="Auto"/>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
                            <!-- Icon -->
                            <ContentPresenter Grid.Column="0" 
                                              ContentSource="Icon"
                                              HorizontalAlignment="Left"
                                              VerticalAlignment="Center"
                                              Margin="0,0,4,0"/>
                            <!-- Text (MenuItem Header) -->
                            <TextBlock x:Name="TextBlock"
                                       Grid.Column="1"
                                       Text="{TemplateBinding Header}"
                                       Foreground="{TemplateBinding BorderThickness}"
                                       VerticalAlignment="Center"
                                       Margin="0"/>
                            <!-- Shortcut Key (InputGestureText) -->
                            <TextBlock x:Name="ShortcutText"
                                       Grid.Column="2"
                                       Text="{TemplateBinding InputGestureText}"
                                       Foreground="{DynamicResource TextColorSecondaryColor}"
                                       VerticalAlignment="Center"
                                       HorizontalAlignment="Right"
                                       Margin="5,0"/>
                            <!-- Arrow Down Indicator for Submenus -->
                            <Path x:Name="Arrow"
                                  Grid.Column="2"
                                  Data="M0,0 L4,4 L8,0 Z"
                                  Fill="{DynamicResource TextColorSecondaryColor}"
                                  HorizontalAlignment="Center"
                                  VerticalAlignment="Center"
                                  Visibility="Collapsed"
                                  Margin="4,0,0,0"/>
                            <!-- Popup for Submenu -->
                            <Popup Name="PART_Popup" 
                                   Placement="Right" 
                                   IsOpen="{Binding IsSubmenuOpen, RelativeSource={RelativeSource TemplatedParent}}"                                   AllowsTransparency="True" 
                                   Focusable="False"
                                   PopupAnimation="None">
                                <Border Background="{TemplateBinding Background}" 
                                        BorderBrush="{DynamicResource BorderBrush}"     
                                        BorderThickness="2"
                                        CornerRadius="0">
                                    <StackPanel IsItemsHost="True" 
                                                KeyboardNavigation.DirectionalNavigation="Continue"/>
                                </Border>
                            </Popup>
                        </Grid>
                    </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="TextBlock" Property="Foreground" Value="White"/>
                            <Setter TargetName="ShortcutText" Property="Foreground" Value="White"/>
                            <Setter TargetName="Arrow" Property="Fill" Value="White"/>
                        </Trigger>
                        <Trigger Property="HasItems" Value="True">
                            <Setter TargetName="Arrow" Property="Visibility" Value="Visible"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!-- End Menu Style -->
<!--Scrollbar Thumbs-->
    <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type Thumb}">
                    <Grid x:Name="Grid">
                        <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                        <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="Tag" Value="Horizontal">
                            <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                            <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
    <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
        <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
        <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
        <Setter Property="Width" Value="8" />
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type ScrollBar}">
                    <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="0.00001*" />
                        </Grid.RowDefinitions>
                        <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                            <Track.Thumb>
                                <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                            </Track.Thumb>
                            <Track.IncreaseRepeatButton>
                                <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                            </Track.IncreaseRepeatButton>
                            <Track.DecreaseRepeatButton>
                                <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                            </Track.DecreaseRepeatButton>
                        </Track>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                            <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                            <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                        </Trigger>
                        <Trigger Property="Orientation" Value="Horizontal">
                            <Setter TargetName="GridRoot" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter TargetName="PART_Track" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter Property="Width" Value="Auto" />
                            <Setter Property="Height" Value="8" />
                            <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                            <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                            <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
    <Style TargetType="ScrollViewer">
        <Setter Property="CanContentScroll" Value="False"/>
        <Setter Property="IsDeferredScrollingEnabled" Value="False"/>
        <Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="HorizontalScrollBarVisibility" Value="Hidden"/>
    </Style>
<!--End Scrollbar Thumbs-->
<!--TabControl Style-->
    <Style TargetType="TabItem">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TabItem">
                    <Border Name="Border" CornerRadius="5" BorderThickness="0" Padding="8" BorderBrush="Transparent"  Margin="10,5">
                        <ContentPresenter x:Name="ContentSite"
                        VerticalAlignment="Center"
                        HorizontalAlignment="Left"
                        ContentSource="Header"
                        />
                    </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsSelected" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource PrimaryButtonForeground}" />
                            <Setter Property="Foreground" Value="white" />
                        </Trigger>
                        <Trigger Property="IsSelected" Value="False">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
                            <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End TabControl Style-->
<!--ComboBox Style-->
    <Style TargetType="ComboBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Padding" Value="6,3"/>
        <Setter Property="HorizontalContentAlignment" Value="Left"/>
        <Setter Property="VerticalContentAlignment" Value="Center"/>
        <Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Disabled"/>
        <Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ComboBox">
                    <Grid>
                        <ToggleButton 
                            Name="ToggleButton"
                            Grid.Column="2" 
                            Focusable="false"
                            IsChecked="{Binding Path=IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}"
                            ClickMode="Press"
                            Background="Transparent"
                            BorderBrush="Transparent">
                            <ToggleButton.Template>
                                <ControlTemplate TargetType="ToggleButton">
                                    <Border Name="Border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
                                        <Grid>
                                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                            <Path x:Name="Arrow" Data="M 0 0 L 4 4 L 8 0 Z" Fill="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Right" Margin="5" VerticalAlignment="Center"/>
                                        </Grid>
                                    </Border>
                                </ControlTemplate>
                            </ToggleButton.Template>
                        </ToggleButton>
                        <ContentPresenter
                            Name="ContentSite"
                            IsHitTestVisible="False"
                            Content="{TemplateBinding SelectionBoxItem}"
                            ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}"
                            ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}"
                            Margin="3,3,23,3"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left"/>
                        <TextBox 
                            x:Name="PART_EditableTextBox"
                            Style="{x:Null}" 
                            HorizontalAlignment="Left" 
                            VerticalAlignment="Center"
                            Margin="3,3,23,3"
                            Focusable="True"
                            Background="Transparent"
                            Visibility="Hidden"
                            IsReadOnly="{TemplateBinding IsReadOnly}"/>
                        <Popup 
                            Name="Popup"
                            Placement="Bottom"
                            IsOpen="{TemplateBinding IsDropDownOpen}"
                            AllowsTransparency="True" 
                            Focusable="False"
                            PopupAnimation="Slide">
                            <Grid 
                                Name="DropDown"
                                SnapsToDevicePixels="True"
                                MinWidth="{TemplateBinding ActualWidth}"
                                MaxHeight="{TemplateBinding MaxDropDownHeight}">
                                <Border 
                                    x:Name="DropDownBorder"
                                    Background="{DynamicResource SecondaryPrimaryBackgroundColor}" 
                                    BorderBrush="Gray" 
                                    BorderThickness="1"/>
                                <ScrollViewer Margin="4,6,4,6" SnapsToDevicePixels="True">
                                    <StackPanel IsItemsHost="True" KeyboardNavigation.DirectionalNavigation="Contained"/>
                                </ScrollViewer>
                            </Grid>
                        </Popup>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="HasItems" Value="false">
                            <Setter TargetName="DropDownBorder" Property="MinHeight" Value="95"/>
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter Property="Foreground" Value="Gray"/>
                        </Trigger>
                        <Trigger Property="IsGrouping" Value="true">
                            <Setter Property="ScrollViewer.CanContentScroll" Value="false"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End ComboBox Style-->
<!--ToggleSwitchStyle Style-->
    <Style x:Key="ToggleSwitchStyle" TargetType="CheckBox">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <StackPanel Orientation="Horizontal">
                        <TextBlock Text="{TemplateBinding Content}" VerticalAlignment="Center" Margin="8"/>
                        <Grid>
                            <Border Name="emad" Width="40"
                                    Height="20"
                                    Background="{DynamicResource Label}"
                                    CornerRadius="10"
                                    Margin="1"
                            />
                            <Border Name="ToggleSwitchButton"
                                    Width="12"
                                    Height="12"
                                    Background="Black"
                                    CornerRadius="50"
                                    Margin="5"
                                    HorizontalAlignment="Left"
                            />
                        </Grid>
                        <TextBlock>
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="Text" Value="Off"/>
                                    <Setter Property="Margin" Value="7"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding RelativeSource={RelativeSource TemplatedParent}, Path=IsChecked}" Value="True">
                                            <Setter Property="Text" Value="On"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </StackPanel>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="false">
                            <Trigger.ExitActions>
                                <RemoveStoryboard BeginStoryboardName="WPFToggleSwitchLeft" />
                                <BeginStoryboard x:Name="WPFToggleSwitchRight">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetProperty="Margin"
                                                Storyboard.TargetName="ToggleSwitchButton"
                                                Duration="0:0:0:0.10"
                                                From="0,0,0,0"
                                                To="22,0,0,0">
                                        </ThicknessAnimation>
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.ExitActions>
                            <Setter TargetName="ToggleSwitchButton" Property="Background" Value="{DynamicResource ToggleSwitchDisableColor}"/>
                            <Setter TargetName="emad" Property="BorderBrush" Value="{DynamicResource ToggleSwitchBorderBrush}"/>
                            <Setter TargetName="emad" Property="BorderThickness" Value="1"/>
                        </Trigger>
                        <Trigger Property="IsChecked" Value="true">
                            <Trigger.ExitActions>
                                <RemoveStoryboard BeginStoryboardName="WPFToggleSwitchRight" />
                                <BeginStoryboard x:Name="WPFToggleSwitchLeft">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetProperty="Margin"
                                                Storyboard.TargetName="ToggleSwitchButton"
                                                Duration="0:0:0:0.10"
                                                From="22,0,0,0"
                                                To="5,0,0,0">
                                        </ThicknessAnimation>
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.ExitActions>
                            <Setter TargetName="ToggleSwitchButton" Property="Background" Value="{DynamicResource ToggleSwitchEnableColor}"/>
                            <Setter TargetName="emad" Property="Background" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="ToggleSwitchButton" Property="Width" Value="13"/>
                            <Setter TargetName="ToggleSwitchButton" Property="Height" Value="13"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End ToggleSwitchStyle Style-->
    <!-- Generated from build dont play here -->
        <!-- {Dark} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Dark">
 <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#2b2d31"/>
 <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#3c3f44"/>
 <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#098fd4" />
 <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
 <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
 <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
 <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
 <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
 <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
 <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
 <SolidColorBrush x:Key="HighlightColor" Color="#066ca1"/>
 <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
 <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
 <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
 <Color x:Key="ListViewCardLeftColor">#3c3f44</Color> 
 <Color x:Key="ListViewCardRightColor">#2b2d31</Color>
 <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
</ResourceDictionary>
<!--{Dark}-->
<!-- {Dark Knight} -->
<!-- by {Emad Adel} -->
<ResourceDictionary x:Key="DarkKnight">
  <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#081015"/>
  <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#17181D"/>
  <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#004D69" />
  <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
  <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
  <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
  <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
  <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
  <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
  <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
  <SolidColorBrush x:Key="HighlightColor" Color="#066ca1"/>
  <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
  <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
  <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
  <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
  <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
  <Color x:Key="ListViewCardLeftColor">#E117181D</Color> 
  <Color x:Key="ListViewCardRightColor">#E117181D</Color>
  <ImageBrush x:Key="BackgroundImage" ImageSource="https://images.hdqwalls.com/wallpapers/the-batman-fan-made-4k-xx.jpg" Stretch="UniformToFill"/>
</ResourceDictionary>
<!-- Name {Dark Knight} -->

<!-- {Light} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Light">
 <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="White"/>
 <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="WhiteSmoke"/>
 <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#1976d2" />
 <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
 <SolidColorBrush x:Key="TextColorPrimary" Color="Black" />
 <SolidColorBrush x:Key="TextColorSecondaryColor" Color="Black"/>
 <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#4B5361"/>
 <SolidColorBrush x:Key="BorderBrush" Color="#FFB3B3B3"/>
 <SolidColorBrush x:Key="ButtonBorderColor" Color="#525FE1"/>
 <SolidColorBrush x:Key="Label" Color="LightBlue"/>
 <SolidColorBrush x:Key="HighlightColor" Color="#098fd4"/>
 <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
 <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="black"/>
 <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="black"/>
 <Color x:Key="ListViewCardLeftColor">#f0f0f0</Color>
 <Color x:Key="ListViewCardRightColor">#ffffff</Color>
 <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
</ResourceDictionary>
<!-- {Light} -->
<!-- {Palestine} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Palestine">
 <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#FF1F1F1F"/>
 <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#2C211A"/>
 <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#FFB80000" />
 <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
 <SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
 <SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
 <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
 <SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
 <SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
 <SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
 <SolidColorBrush x:Key="HighlightColor" Color="#FFD10D0D"/>
 <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
 <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
 <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
 <Color x:Key="ListViewCardLeftColor">#D82C211A</Color> 
 <Color x:Key="ListViewCardRightColor">#D82C211A</Color>
 <ImageBrush x:Key="BackgroundImage" ImageSource="https://w.wallhaven.cc/full/we/wallhaven-wegrj6.jpg" Stretch="UniformToFill"/>
</ResourceDictionary>
<!-- Name {Palestine} -->

<!-- Generated from build dont play here -->

</Window.Resources>

<Grid Background="{DynamicResource BackgroundImage}">

    <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
    </Grid.RowDefinitions>
    <!--Header Section-->
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="Auto"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>
                 <!--Menu-->
    <Menu Grid.Row="0" Grid.Column="0" Background="Transparent" BorderBrush="Transparent" HorizontalAlignment="Left" BorderThickness="0">
        <MenuItem Background="Transparent" BorderBrush="Transparent" BorderThickness="0" IsEnabled="False" ToolTip="Emad Adel">
            <MenuItem.Icon>
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png" Width="90" Height="Auto" Margin="5,5,0,0"></Image>
            </MenuItem.Icon>
        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="Management" TargetNullValue="Management"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="sysinfo">
                <MenuItem.Header>
                    <Binding Path="System_Info" TargetNullValue="System Info" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            
            <MenuItem Name="poweroption">
                <MenuItem.Header>
                    <Binding Path="Power_Options" TargetNullValue="Power Options" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="deviceManager">
                <MenuItem.Header>
                    <Binding Path="Device_Manager" TargetNullValue="Device Manager" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="services">
                <MenuItem.Header>
                    <Binding Path="Services" TargetNullValue="Services" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="network">
                <MenuItem.Header>
                    <Binding Path="Networks" TargetNullValue="Networks" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="appsfeatures">
                <MenuItem.Header>
                    <Binding Path="Apps_features" TargetNullValue="Programs and Features" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="taskmgr">
                <MenuItem.Header>
                    <Binding Path="Task_Manager" TargetNullValue="Task Manager" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="diskmgmt">
                <MenuItem.Header>
                    <Binding Path="Disk_Managment" TargetNullValue="Disk Management" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="msconfig">
                <MenuItem.Header>
                    <Binding Path="Msconfig" TargetNullValue="System Configuration" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="ev">
                <MenuItem.Header>
                    <Binding Path="Environment_Variables" TargetNullValue="Environment Variables" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text="&#xE81E;"/>
                </MenuItem.Icon>
            </MenuItem>
            

        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="Preferences" TargetNullValue="Preferences"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" HorizontalAlignment="Center" VerticalAlignment="Center" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="restorepoint" InputGestureText="Shift+Q">
                <MenuItem.Header>
                    <Binding Path="Create_restore_point" TargetNullValue="Restore Point" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Header="{Binding Portable_Downloads_Folder}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="chocoloc" Header="Choco" InputGestureText="Shift+C">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>

                <MenuItem Name="itt" Header="ITT" InputGestureText="Shift+T">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>

            </MenuItem>

            <MenuItem Name="save" InputGestureText="Shift+S" ToolTip="Save selected apps">
                <MenuItem.Header>
                    <Binding Path="Save" TargetNullValue="Save" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="load" InputGestureText="Shift+D" ToolTip="Restore selected apps">
                <MenuItem.Header>
                    <Binding Path="Restore" TargetNullValue="Restore" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Header="{Binding Theme}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="systheme">
                    <MenuItem.Header>
                        <Binding Path="Use_system_setting" TargetNullValue="System Setting" />
                    </MenuItem.Header>
                </MenuItem>
                <MenuItem Name="Dark" Header="Dark"/>
<MenuItem Name="DarkKnight" Header="Dark Knight"/>
<MenuItem Name="Light" Header="Light"/>
<MenuItem Name="Palestine" Header="Palestine"/>
            </MenuItem>
            

            <!-- Music section -->
            <MenuItem Header="{Binding Music}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="moff">
                    <MenuItem.Header>
                        <Binding Path="off" TargetNullValue="Off" />
                    </MenuItem.Header>
                    <MenuItem.InputGestureText>
                        Shift+N
                    </MenuItem.InputGestureText>
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                

                <MenuItem Name="mon">
                    <MenuItem.Header>
                        <Binding Path="on" TargetNullValue="On" />
                    </MenuItem.Header>
                    <MenuItem.InputGestureText>
                        Shift+F
                    </MenuItem.InputGestureText>
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                
            </MenuItem>
            <!-- Music section -->


            <MenuItem Header="{Binding Language}">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>

                    <MenuItem Name="systemlang">
                        <MenuItem.Header>
                            <Binding Path="Use_system_setting" TargetNullValue="System Language" />
                        </MenuItem.Header>
                    </MenuItem>
                    <MenuItem Name="ar" Header="عربي"/>
<MenuItem Name="de" Header="Deutsch"/>
<MenuItem Name="en" Header="English"/>
<MenuItem Name="es" Header="Español"/>
<MenuItem Name="fr" Header="Français"/>
<MenuItem Name="ga" Header="Gaeilge"/>
<MenuItem Name="hi" Header="अंग्रेज़ी"/>
<MenuItem Name="it" Header="Italiano"/>
<MenuItem Name="ko" Header="한국어"/>
<MenuItem Name="ru" Header="Русский"/>
<MenuItem Name="tr" Header="Türkçe"/>
<MenuItem Name="zh" Header="中文"/>
            </MenuItem>

            <MenuItem Name="ittshortcut">
                <MenuItem.Header>
                    <Binding Path="Create_desktop_shortcut" TargetNullValue="Create Shortcut" />
                </MenuItem.Header>
                <MenuItem.InputGestureText>
                    Shift+I
                </MenuItem.InputGestureText>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="reset">
                <MenuItem.Header>
                    <Binding Path="Reset_preferences" TargetNullValue="Reset Preferences" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="Third_party" TargetNullValue="Third Party"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="mas" ToolTip="Windows activation ">
                <MenuItem.Header>
                    <Binding Path="MAS" TargetNullValue="MAS" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="idm" ToolTip="Get rid of IDM Active message">
                <MenuItem.Header>
                    <Binding Path="IDM" TargetNullValue="IDM Active Message" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="winoffice" ToolTip="Windows and Office Orginal ISO">
                <MenuItem.Header>
                    <Binding Path="Win_Office" TargetNullValue="Windows/Office ISO" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="shelltube" ToolTip="Download youtube video easily" Header="ShellTube">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="spotifydown" ToolTip="SpotifyDown allows you to download tracks, playlists and albums from Spotify instantly." Header="Spotify Downloader">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Header="{Binding Browsers_extensions}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="uBlock">
                    <MenuItem.Header>
                        <Binding Path="uBlockOrigin" TargetNullValue="uBlock Origin"/>
                    </MenuItem.Header>
                </MenuItem>
                <MenuItem Name="unhook">
                    <MenuItem.Header>
                        <Binding Path="Unhook" TargetNullValue="Unhook Customize youtube"/>
                    </MenuItem.Header>
                </MenuItem>
                <MenuItem Name="neat">
                    <MenuItem.Header>
                        <Binding Path="NeatDownloadManager" TargetNullValue="Neat Download Manager"/>
                    </MenuItem.Header>
                </MenuItem>
            </MenuItem>
            

            <MenuItem Name="sordum" ToolTip="Collection of free utilities designed to enhance or control various aspects of the Windows operating system" Header="Sordum tools">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="techpowerup" Header="TechPowerUp" ToolTip="Collection of free TechPowerUp utilities.">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="majorgeeks" ToolTip="website that provides trusted, safe, and curated software downloads for Windows users. It focuses on high-quality tools." Header="Major Geeks">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="webtor" ToolTip="Web-based platform that allows users to stream torrent files directly in their browser without needing to download them." Header="Webtor">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="fmhy" ToolTip="The largest collection of free stuff on the internet!" Header="fmhy">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="rapidos" ToolTip="RapidOS is a powerful modification for Windows 10 and 11 that significantly boosts performance." Header="RapidOS">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="asustool" ToolTip="Tool that manages the setup installation for the legacy Aura Sync, LiveDash, AiSuite3" Header="ASUS Setup Tool">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

        </MenuItem>

        <MenuItem Name="dev" VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="About" TargetNullValue="About"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
        </MenuItem>

    </Menu>
<!--End Menu-->
            <Grid Grid.Column="1" HorizontalAlignment="Right" Margin="0,0,20,0">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="Auto"/>
            </Grid.ColumnDefinitions>
                <!--AppsCategory-->
  <ComboBox 
    SelectedIndex="0" 
    Name="AppsCategory" 
    Grid.Column="0" 
    VerticalAlignment="Center" 
    HorizontalAlignment="Center" 
    Width="auto">
      <ComboBoxItem Content="{Binding all, TargetNullValue=All}"/>
      <ComboBoxItem Content="GPU Drivers"/>
      <ComboBoxItem Content="Web Browsers"/>
      <ComboBoxItem Content="Media"/>
      <ComboBoxItem Content="Media Tools"/>
      <ComboBoxItem Content="Documents"/>
      <ComboBoxItem Content="Compression"/>
      <ComboBoxItem Content="Communication"/>
      <ComboBoxItem Content="File Sharing"/>
      <ComboBoxItem Content="Imaging"/>
      <ComboBoxItem Content="Gaming"/>
      <ComboBoxItem Content="Utilities"/>
      <ComboBoxItem Content="Disk Tools"/>
      <ComboBoxItem Content="Development"/>
      <ComboBoxItem Content="Security"/>
      <ComboBoxItem Content="Portable"/>
      <ComboBoxItem Content="Runtimes"/>
      <ComboBoxItem Content="Drivers"/>
    </ComboBox>
<!--End AppsCategory-->
<!--TwaeksCategory-->
  <ComboBox 
      SelectedIndex="0" 
      Name="TwaeksCategory" 
      Grid.Column="0" 
      VerticalAlignment="Center" 
      HorizontalAlignment="Center" 
      Visibility="Hidden"
      Width="auto">
      <ComboBoxItem Content="{Binding all, TargetNullValue=All}"/>
      <ComboBoxItem Content="Privacy"/>
      <ComboBoxItem Content="Fixer"/>
      <ComboBoxItem Content="Performance"/>
      <ComboBoxItem Content="Personalization"/>
      <ComboBoxItem Content="Power"/>
      <ComboBoxItem Content="Protection"/>
      <ComboBoxItem Content="Classic"/>
  </ComboBox>
<!--End TwaeksCategory-->
                <!--Search -->
<Grid HorizontalAlignment="Left" Grid.Column="1" VerticalAlignment="Center">
    <TextBox Padding="8"
        Width="120"
        VerticalAlignment="Center"
        HorizontalAlignment="Left"
        Style="{StaticResource SearchBox}"
        Name="searchInput" />
    <Grid Name="search_placeholder">
        <TextBlock 
                Name="SearchIcon"
                Text="" 
                FontSize="15" 
                Foreground="Gray" 
                VerticalAlignment="Center" 
                FontFamily="Segoe MDL2 Assets"
                HorizontalAlignment="Left" 
                IsHitTestVisible="False"
                Margin="10,0,0,0" />
        <TextBlock 
                Text="Ctrl+F" 
                Foreground="Gray" 
                VerticalAlignment="Center" 
                HorizontalAlignment="Left" 
                IsHitTestVisible="False"
                Margin="30,0,0,0" />
    </Grid>
</Grid>
<!--End Search-->

            </Grid>
        </Grid>
    <!--Header Section-->
        <!--TabControl-->
    <TabControl Name="taps" TabStripPlacement="Left" Grid.Row="1" BorderBrush="Transparent" Foreground="White" Background="Transparent">
            <TabItem Name="apps" Header="{Binding apps, TargetNullValue=Apps}" BorderBrush="{x:Null}" >
                <TabItem.HeaderTemplate>
                    <DataTemplate>
                        <StackPanel Orientation="Horizontal">
                            <TextBlock Text="" FontFamily="Segoe MDL2 Assets" FontSize="18" VerticalAlignment="Center" HorizontalAlignment="Left"  Margin="0"/>
                            <TextBlock Text="{Binding}"  FontSize="15" VerticalAlignment="Center" HorizontalAlignment="Left" TextWrapping="Wrap"  Margin="20,0,2,0"/>
                        </StackPanel>
                    </DataTemplate>
            </TabItem.HeaderTemplate>
            
         
                <ListView Name="appslist" 
                    Grid.Row="1" 
                    BorderBrush="{x:Null}" 
                    Background="{x:Null}"
                    SelectionMode="Single"
                    SnapsToDevicePixels="True"
                    VirtualizingStackPanel.IsContainerVirtualizable="True"
                    VirtualizingStackPanel.IsVirtualizing="True"
                    VirtualizingStackPanel.VirtualizationMode="Recycling"
                    ScrollViewer.CanContentScroll="True">
    
                    <ListView.ItemsPanel>
                        <ItemsPanelTemplate>
                            <VirtualizingStackPanel />
                        </ItemsPanelTemplate>
                    </ListView.ItemsPanel>

                            <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mozilla Firefox"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A widelyused opensource web browser known for its speed privacy features and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mozilla Firefox ESR"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A widelyused opensource web browser known for its speed privacy features and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thorium SSE3"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser designed for smooth and secure browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thorium AVX"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser designed for smooth and secure browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Edge"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsofts web browser built for fast and secure internet surfing integrating seamlessly with Windows ecosystem."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Chrome"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular web browser known for its speed simplicity and vast ecosystem of extensions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Chromium"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource web browser project that serves as the foundation for many browsers including Google Chrome."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Brave"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A privacyfocused web browser that blocks ads and trackers offering faster and safer browsing experiences."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Tor Browser"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A web browser that prioritizes user privacy by routing internet traffic through a global network of servers enabling anonymous browsing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Opera"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Opera web browser makes the Web fast and fun giving you a better web browser experience on any computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Internet Download Manager"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular download manager tool that accelerates downloads and allows users to organize and schedule downloads efficiently."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="JDownloader"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="JDownloader is an internet download manager."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KLite Mega Codec Full Pack"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Comprehensive collection of audio and video codecs filters and tools enabling playback of various media formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PotPlayer"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A multimedia player with a sleek interface and advanced features supporting a wide range of audio and video formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VLC"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A versatile media player capable of playing almost any multimedia file format with support for various streaming protocols."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kodi"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful opensource media center software that allows users to organize and stream their media collections."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Jellyfin Server"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource media server software that enables users to stream their media libraries across devices providing a selfhosted alternative to commercial services."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winamp"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A classic media player known for its customizable interface and extensive plugin support providing a nostalgic music playback experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aimp"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and featurerich audio player with support for various audio formats and customizable interface themes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Spotify"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Spotify is a new way to listen to music."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FastStone Image Viewer"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FastStone Image Viewer is a fast stable userfriendly image browser converter and editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OpenOffice"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource office productivity suite offering word processing spreadsheet presentation and other office tools compatible with Microsoft Office formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FoxitReader"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and featurerich PDF reader with annotation form filling and document signing capabilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreOffice"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful opensource office suite providing word processing spreadsheet presentation and other office tools compatible with Microsoft Office formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SumatraPDF"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A lightweight and fast PDF reader with minimalistic design and focus on simplicity and speed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinRAR"  IsChecked="false" Tag="Compression"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A popular file compression and archiving utility that supports various archive formats and offers advanced features such as encryption and selfextracting archives."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="7Zip"  IsChecked="false" Tag="Compression"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource file archiver with a high compression ratio supporting various archive formats and providing a powerful commandline interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PeaZip"  IsChecked="false" Tag="Compression"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" PeaZip is a free crossplatform file archiver."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Telegram Desktop"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A crossplatform messaging app with a focus on speed and security offering endtoend encryption and a wide range of features such as group chats file sharing and stickers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Signal"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fast simple secure. Privacy that fits in your pocket."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Meta Messenger"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A messaging app that allows users to connect with friends and family through text messages voice calls and video calls offering various multimedia sharing features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Zoom"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A video conferencing app that facilitates online meetings webinars and virtual events allowing participants to interact through video audio and chat."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Teams"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A collaboration platform that combines workplace chat video meetings file storage and application integration enhancing teamwork and productivity within organizations."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Discord"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A VoIP application and digital distribution platform designed for creating communities and connecting gamers providing text voice and video communication features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TeamViewer"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote access and support software that enables users to remotely control computers transfer files and collaborate online facilitating remote work and IT support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GIMP"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource raster graphics editor used for image retouching and editing drawing and painting and converting between different image formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ Runtime - all versions"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft Visual C Redistributable installs runtime components of Visual C libraries. These components are required to run C applications that are developed using Visual Studio and link dynamically to Visual C libraries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DirectX"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="DirectX is a collection of APIs for handling tasks related to games and videos.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2005 (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2005 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2005 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2005 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2008 (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2008 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2008 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2008 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2010 (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2010 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2010 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2010 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2012 (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2012 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2012 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2012 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2013 (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 2013 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2013 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 2013 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2015-2022 (x64) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run 64bit applications developed with Microsoft Visual C 20152022 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visual C++ 2015-2022  (x86) Redistributable"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A set of runtime components required to run applications developed with Microsoft Visual C 20152022 providing libraries DLLs and other resources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Framework All Versions"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A comprehensive and consistent programming model for building applications that have visually stunning user experiences seamless and secure communication and the ability to model a range of business processes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AMD Ryzen Chipset Drivers"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Supports AMD Ryzen Threadripper PRO Processor AMD Ryzen 8000/7040/7000 Series Desktop  Mobile Processors AMD Ryzen 5000/3rd Gen/2nd Gen Desktop  Threadripper Processors AMD Ryzen Desktop Processor with Radeon Graphics  Mobile Processor with Radeon Graphics 7thGen AMD ASeries Processors AMD X670E/X670/B650E/B650/B350/A320/X370/X399/B450/X470/X570/B550/A520/A620/TRX40/TRX50/WRX80/WRX90 Chipsets."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVidia Display Driver"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The software component that allows the operating system and installed software to communicate with and control the NVIDIA graphics processing unit GPU."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVIDIA GeForce Experience"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A cloudbased gaming service provided by NVIDIA that allows users to play video games on supported devices via a remote gaming PC hosted on NVIDIAs servers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Msi Afterburner"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MSI Afterburner is the ultimate graphics card utility codeveloped by MSI and RivaTuner teams."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NVIDIA PhysX"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A physics processing unit PPU software development kit SDK offered by NVIDIA for realtime physics simulations in video games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Steam"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A digital distribution platform developed by Valve Corporation for purchasing and playing video games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ubisoft Connect"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A digital distribution digital rights management multiplayer and communications service developed by Ubisoft providing access to Ubisofts games rewards and social features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Origin"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Game store launcher."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rockstar Games Launcher"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Download and play the latest Rockstar Games PC titles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GameSave Manager"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A utility tool that allows users to backup restore and transfer their game saves between different gaming platforms and directories."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StreamlabsOBS"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource streaming software built on top of OBS Studio with additional features tailored for streamers such as builtin alerts overlays and chat integration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OBS Studio"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource software for video recording and live streaming. It offers high performance realtime video/audio capturing and mixing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Logitech Gaming Software"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Logitech Gaming Software lets you customize Logitech G gaming mice keyboards headsets and select wheels."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lively Wallpaper"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A software that allows users to set animated and interactive wallpapers on their Windows desktop providing various customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Playnite"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Open source video game library manager and launcher with support for 3rd party libraries like Steam GOG Origin Battle.net and Uplay."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Easy"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A driver update tool that automatically detects downloads and installs device drivers for the users computer hardware."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Graphics Windows DCH"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Graphics Driver for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Driver Support Assistant"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Driver  Support Assistant enables you to scan computing devices for the latest drivers available from Intel."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Network Adapter"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Intel Network Adapter Drivers for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Snappy Driver Installer"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource tool for updating and installing device drivers on Windows offering offline driver updates and wide hardware support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver booster"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Scans and identifies outdated drivers automatically and downloads and installs the right update for you with just ONE click."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Genius"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Professional driver management tool and hardware diagnostics."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Display Driver Uninstaller"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Utility to completely remove system drivers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Driver Store Explorer"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Windows driver store utility."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="1Password"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A password manager that securely stores login credentials credit card information and other sensitive data in an encrypted vault accessible with a single master password."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AOMEI Partition Assistant Standard"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement partition style conversion OS migration and other disk managements without any difficulties."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AOMEI Backupper Standard"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A backup and recovery software that enables users to create system backups disk backups partition backups and file backups to protect data against system failures and data loss."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Recuva recover"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A data recovery software that helps users retrieve accidentally deleted files including photos documents videos and more from various storage devices such as hard drives USB drives and memory cards."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CCleaner"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system optimization privacy and cleaning tool that helps users remove unused files clean up temporary files and optimize their Windows PCs for better performance."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="BCUninstaller"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful uninstaller tool for Windows that allows users to remove unwanted programs plugins and Windows Store apps along with leftover files and registry entries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Easy Context Menu"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="To install Easy Context Menu run the following command from the command line or from PowerShell."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HWiNFO"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A hardware information and diagnostic tool that provides detailed information about the hardware components of a computer system including sensors temperature voltage and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Speccy"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system information tool that provides detailed information about the hardware and operating system of a computer including CPU RAM motherboard graphics card and storage devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FurMark"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A graphics card stress testing and benchmarking utility that helps users test the stability cooling and performance of their GPU by rendering a highly intensive 3D graphics scene."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hard Disk Sentinel"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A hard disk monitoring and analysis software that helps users monitor the health performance and temperature of their hard drives SSDs and other storage devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CPU-Z"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A system monitoring utility that provides detailed information about the CPU motherboard memory and other hardware components of a computer system."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mem Reduct"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Lightweight realtime memory management application to monitor and clean system memory on your computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HandBrake"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource video transcoder tool that converts video files from one format to another supporting a wide range of input and output formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rufus Portable"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A utility tool for creating bootable USB drives from ISO images helping users to install or run operating systems such as Windows Linux or other utilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ImgBurn"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Lightweight CD / DVD burning application."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Virtual CloneDrive"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free software that allows users to mount disc images as virtual drives enabling them to access the content of ISO BIN and CCD files without the need for physical discs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ultra ISO"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful ISO image management tool that enables users to create edit extract and burn ISO files providing a comprehensive solution for managing disk image files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ventoy"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource tool for creating bootable USB drives with multiple ISO files allowing users to boot various operating systems or utilities directly from a single USB drive."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iVentoy"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With iVentoy you can boot and install OS on multiple machines at the same time through the network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AutoHotkey"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A scripting language for automating repetitive tasks and creating macros on Windows allowing users to customize keyboard shortcuts remap keys and automate mouse actions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rainmeter"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A customizable desktop customization tool that displays customizable skins widgets and applets on the Windows desktop providing users with realtime system monitoring and information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FxSound"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An audio enhancer software that improves the sound quality of music videos and games on Windows PCs by providing advanced audio processing and customization options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vysor"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A screen mirroring and remote control software that enables users to view and control Android devices from Windows PCs allowing for easy screen sharing app testing and troubleshooting."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unified Remote"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote control app that turns smartphones into universal remote controls for Windows macOS and Linux computers allowing users to control media playback presentations and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AnyDesk"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A remote desktop software that allows users to access and control Windows macOS Linux Android and iOS devices from anywhere providing secure and reliable remote access."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Airdroid"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AirDroid is a free and fast Android device manager app that allows you to access Android phone/tablet from computer remotely and securely. Manage SMS files photos and videos WhatsApp Line WeChat and more on computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UltraViewer"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remote control to support your clients / partners from everywhere."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wireless Network Watcher Portable"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WifiInfoView"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WirelessNetView"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireless Network Watcher is a small utility that scans your wireless network and displays the list of all computers and devices that are currently connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="qBittorrent"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource BitTorrent client for downloading and uploading files via the BitTorrent protocol providing users with a lightweight and featurerich torrenting experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Earth Pro"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Google Earth Pro on desktop is free for users with advanced feature needs. Import and export GIS data and go back in time with historical imagery."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="XAMPP"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="XAMPP is a free and opensource crossplatform web server solution stack package developed by Apache Friends consisting mainly of the Apache HTTP Server MariaDB database and interpreters for scripts written in the PHP and Perl programming languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio Professional 2022"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Professional 2022 is an integrated development environment IDE from Microsoft. It is used to develop computer programs websites web apps web services and mobile apps."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio Community 2022"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Community 2022 is a free fullyfeatured and extensible IDE for individual developers open source projects academic research education and small professional teams."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unity Hub"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unity is a crossplatform game creation system developed by Unity Technologies and used to develop video games for PC consoles mobile."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Godot Engine"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Godot is a featurepacked crossplatform game engine for creating 2D and 3D games. It provides a comprehensive set of tools and features to develop games efficiently and quickly."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unity3D Engine"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unity is a crossplatform game creation system developed by Unity Technologies and used to develop video games for PC consoles mobile."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Blender"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Blender is a free and opensource professionalgrade 3D computer graphics and video compositing program."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VSCode"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual Studio Code is a free sourcecode editor developed by Microsoft for Windows Linux and macOS. It includes support for debugging embedded Git control syntax highlighting intelligent code completion snippets and code refactoring."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vim"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Vim is an advanced text editor that seeks to provide the power of the defacto Unix editor Vi with a more complete feature set. Its us... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sublime Text 4"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Sublime Text 4  The sophisticated text editor for code markup and prose."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Atom"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Atom is a text editor thats modern approachable yet hackable to the corea tool you can customize to do anything but also use productively without ever touching a config file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="InnoSetup"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Inno Setup is a free installer for Windows programs. First introduced in 1997 Inno Setup today rivals and even surpasses many commercial installers in feature set and stability."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PyCharm Community Edition"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PyCharm Community Edition is a free and opensource IDE for Python development. It provides smart code completion code inspections onthefly error highlighting and quickfixes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PyCharm Professional Edition"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PyCharm Professional Edition is a powerful IDE for professional Python development. It includes advanced features such as database tools web development support and scientific tools integration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Jetbrains Rider"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rider is a crossplatform .NET IDE developed by JetBrains. It supports C VB.NET F ASP.NET JavaScript TypeScript HTML CSS and SQL languages and frameworks."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NodeJs LTS"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Node.js is a JavaScript runtime built on Chromes V8 JavaScript engine. LTS Long Term Support releases are supported for an extended period and provide stability for production environments."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Electron"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Electron framework lets you write crossplatform desktop applications using JavaScript HTML and CSS. It is based on io.js and Chromium and is used in the Atom editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Electrum LTS"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Electrum is a lightweight Bitcoin wallet focused on speed and simplicity with support for hardware wallets and multisig functionality. LTS Long Term Support releases provide stability and security updates for an extended period."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hugo"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hugo is one of the most popular opensource static site generators. With its amazing speed and flexibility Hugo makes building websites f... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hugo Extended"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hugo is one of the most popular opensource static site generators. With its amazing speed and flexibility Hugo makes building websites f... Keep Reading."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Notepad++"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Notepad is a free source code editor and Notepad replacement that supports several languages. It offers syntax highlighting code folding autocompletion and other features for efficient code editing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Terminal"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Windows Terminal is a modern terminal application for users of commandline tools and shells like Command Prompt PowerShell and Windows Subsystem for Linux WSL. It provides multiple tabs custom themes and GPUaccelerated text rendering."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Powershell 7"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PowerShell Core is a crossplatform Windows Linux and macOS automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data e.g. JSON CSV XML etc. REST APIs and object models."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x64dbg Portable"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource x64/x32 debugger for windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="dnSpy"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="dnSpy is a tool to reverse engineer .NET assemblies. It includes a decompiler a debugger and an assembly editor and more and can be easily extended by writing your own extension. It uses dnlib to read and write assemblies so it can handle obfuscated assemblies eg. malware without crashing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Cheat Engine"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cheat Engine is an open source tool designed to help you modify single player games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Python 3.12.6"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Python is a popular highlevel programming language known for its simplicity and versatility. It is used in various fields such as web development data science machine learning and automation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Git"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Git is a free and opensource distributed version control system designed to handle everything from small to very large projects with speed and efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHub Desktop"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GitHub Desktop is a seamless way to contribute to projects on GitHub and GitHub Enterprise. It provides an intuitive interface for managing repositories branching committing and merging code changes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Docker Desktop"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Docker Desktop is an easytoinstall application for Windows and macOS that enables developers to build share and run containerized applications and microservices locally."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Docker Compose"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Docker Compose is a tool for defining and running multicontainer Docker applications. It allows you to use a YAML file to configure your applications services networks and volumes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PowerToys"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater productivity. It includes tools like FancyZones for window management PowerRename for batch renaming files and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Notion"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The allinone workspace for your notes tasks wikis and databases."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FL Studio"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FL Studio is a digital audio workstation DAW developed by ImageLine. It allows you to compose arrange record edit mix and master professionalquality music."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Android Debug Bridge"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Android Debug Bridge ADB is a commandline tool that allows you to communicate with an Android device. It is used for various debugging tasks such as installing and debugging apps."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Universal ADB Drivers"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Universal ADB Drivers are drivers that provide compatibility with a wide range of Android devices for debugging purposes. They allow you to connect your Android device to a computer and use ADB commands."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Scrcpy"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Scrcpy is a free and opensource tool that allows you to display and control your Android device from a computer. It provides highperformance screen mirroring and supports various input methods."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VirtualBox"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VirtualBox is a crossplatform virtualization application. It installs on existing Intel or AMDbased computers whether they are running Windows Mac Linux or Solaris operating systems. It extends the capabilities of your existing computer so that it can run multiple operating systems inside multiple virtual machines at the same time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Oh My Posh"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Oh my Posh is a custom prompt engine for any shell that has the ability to adjust the prompt string with a function or variable."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Malwarebytes"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Multiple layers of malwarecrushing tech including virus protection. Thorough malware and spyware removal. Specialized ransomware protection."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Avast Free Antivirus"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Avast Free Antivirus."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Nerd Fonts - CascadiaCode"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs icons."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Java SE Runtime Environment 8.0.411"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Java allows you to play online games chat with people around the world calculate your mortgage interest and view images in 3D just to name a few. Its also integral to the intranet applications and other ebusiness solutions that are the foundation of corporate computing. Please note you now need a Java License from Oracle to use unless installed for Personal Use and Development Use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Audacity"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Audacity is free open source crossplatform software for recording and editing sounds."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MusicBee"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MusicBee makes it easy to organize find and play music files on your computer on portable devices and on the web."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Format Factory"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="multifunctional media processing tools."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winaero Tweaker"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Customize the appearance and behavior of the Windows operating system."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Subsystem for Linux WSL2"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="To install Windows Subsystem for Linux 2 run the following command from the command line or from PowerShell."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wamp Server 3.3.5"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WampServer is a Windows web development environment. It allows you to create web applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MongoDB"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MongoDB stores data using a flexible document data model that is similar to JSON. Documents contain one or more fields including arrays binary data and subdocuments. Fields can vary from document to document. This flexibility allows development teams to evolve the data model rapidly as their application requirements change."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MPC-BE"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Media Player Classic  BE is a free and open source audio and video player for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kdenlive"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A powerful nonlinear video editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TablePlus"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Modern native and friendly GUI tool for relational databases MySQL PostgreSQL SQLite MongoDB Redis and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hosts File Editor"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hosts File Editor makes it easy to change your hosts file as well as archive multiple versions for easy retrieval."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Subtitle Edit"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With SE you can easily adjust a subtitle if it is out of sync with the video in several different ways. You can also use SE for making new subtitles from scratch do use the timeline/waveform/spectrogram or translating subtitles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Skype"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Skype  Install Skype add your friends as contacts then call video call and instant message with them for free. Call people who arent on Skype too at really low rates."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FileZilla"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FileZilla Client is a fast and reliable crossplatform FTP FTPS and SFTP client with lots of useful features and an intuitive graphical user interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Everything"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Everything Search Engine  locate files and folders by name instantly."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Yarn"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Yarn is a package manager for the npm and bower registries with a few specific focuses."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VMware Workstation Player"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VMware Workstation Player is a streamlined desktop virtualization application that runs another operating system on the same computer without rebooting. VMware Workstation Player provides a simple user interface unmatched operating system support and portability across the VMware ecosystem."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HDD Low Level Format Tool"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Will erase LowLevel Format and recertify a SATA IDE or SCSI hard disk drive with any size of up to 281 474 976 710 655 bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="BlueStacks"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Play Android Games on PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Wireless Bluetooth for Windows 10 and Windows 11"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Bluetooth for Windows 10 and Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Office 365 Business"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft 365 formerly Office 365 is a line of subscription services offered by Microsoft as part of the Microsoft Office product line. The brand encompasses plans that allow use of the Microsoft Office software suite over the life of the subscription as well as cloudbased software as a service products for business environments such as hosted Exchange Server Skype for Business Server and SharePoint among others. All Microsoft 365 plans include automatic updates to their respective software at no additional charge as opposed to conventional licenses for these programswhere new versions require purchase of a new license."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Bandicam"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Bandicam is a closedsource screen capture and screen recording software originally developed by Bandisoft and later by Bandicam Company that can take screenshots or record screen changes. Bandicam consists of three main modes. One is the Screen Recording mode which can be used for recording a certain area on the PC screen."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="QQPlayer"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="QQPlayer media player."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="4K Video Downloader"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="4K Video Downloader allows downloading videos playlists channels and subtitles from YouTube Facebook Vimeo and other video sites in high quality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Active@ Partition Recovery"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Active Partition Recovery is a freeware toolkit that helps to recover deleted and damaged logical drives and partitions within Windows WinPE recovery boot disk and Linux recovery LiveCD environments."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HiSuite"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HUAWEI HiSuite is the official Android Smart Device Manager toolHiSuite helps users to connect their HUAWEI smartphones and tablets to PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Android Studio"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Android Studio is the official integrated development environment for Googles Android operating system built on JetBrains IntelliJ IDEA software and designed specifically for Android development."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreWolf"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="LibreWolf is designed to increase protection against tracking and fingerprinting techniques while also including a few security improvements. This is achieved through our privacy and security oriented settings and patches. LibreWolf also aims to remove all the telemetry data collection and annoyances as well as disabling antifreedom features like DRM."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flow Launcher"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dedicated to making your workflow flow more seamless. Search everything from applications files bookmarks YouTube Twitter and more. Flow will continue to evolve designed to be open and built with the community at heart."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="IconsExtract"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The IconsExtract utility scans the files and folders on your computer and extract the icons and cursors stored in EXE DLL OCX CPL and in other file types."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AdGuard Home"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="AdGuard Home is a networkwide software for blocking ads and tracking. After you set it up itll cover ALL your home devices and you dont need any clientside software for that."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Burp Suite Community Edition"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Burp Suite is an integrated platform for performing security testing of web applications. Its various tools work seamlessly together to support the entire testing process from initial mapping and analysis of an applications attack surface through to finding and exploiting security vulnerabilities.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CoreTemp"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Core Temp is a compact no fuss small footprint yet powerful program to monitor processor temperature and other vital information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ShareX"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Screen capture file sharing and productivity tool."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ONLY OFFICE"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ONLYOFFICE is a project developed by experienced IT experts from Ascensio System SIA leading IT company with headquarters in Riga Latvia. Originally ONLYOFFICE was designed for internal team collaboration. An attempt to introduce it to a wider audience proved to be successful ONLYOFFICE received very positive feedback from the Internet community. As a result its functionality was considerably revised and expanded that brought about a high and stable growth of users from different countries."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ESET Internet Security"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ideal for modern users concerned about their privacy who actively use internet for shopping banking work and communication."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinDirStat"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinDirStat is a disk usage statistics viewer and cleanup tool for Microsoft Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winmerge"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinMerge is an Open Source differencing and merging tool for Windows. WinMerge can compare both  folders and files presenting differences in a visual text format that is easy to understand and handle."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Wireshark"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Wireshark is the worlds foremost and widelyused network protocol analyzer. It lets you see whats happening on your network at a microscopic level and is the de facto and often de jure standard across many commercial and nonprofit enterprises government agencies and educational institutions. Wireshark development thrives thanks to the volunteer contributions of networking experts around the globe and is the continuation of a project started by Gerald Combs in 1998."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TeraCopy"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="TeraCopy is designed to copy and move files at the maximum possible speed. It skips bad files during the copying process and then displays them at the end of the transfer so that you can see which ones need attention. TeraCopy can automatically check the copied files for errors by calculating their CRC checksum values. It also provides a lot more information about the files being copied than its Windows counterpart. TeraCopy integrates with Windows Explorers rightclick menu and can be set as the default copy handler."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="QuickLook"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Quick Look is among the few features I missed from Mac OS X It enables very quick preview of file by pressing Space key while highlighting it without opening its associated application Then I decide to add this feature to Windows by myself which results this QuickLook project."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RepoZ"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RepoZ provides a quick overview of the git repositories on your development machine including their current branch and a short status information It uses the repositories on your machine to create an efficient navigation widget and makes sure youll never loose track of your work along the way."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Intel Graphics Command Center"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dont have time to mess around with settings The Intel Graphics Command Center easily finds and tunes your games complete with recommended settings for your computer Use oneclick optimization for many popular titles and instantly get the most out of your system. Windows 10 version 1709 or higher6th Gen Intel Core Platforms or newer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Go Programming Language"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Go is expressive concise clean and efficient Its concurrency mechanisms make it easy to write programs that get the most out of multicore and networked machines while its novel type system enables flexible and modular program construction Go compiles quickly to machine code yet has the convenience of garbage collection and the power of runtime reflection Its a fast statically typed compiled language that feels like a dynamically typed interpreted language."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rust"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rust is a curlybrace blockstructured expression language It visually resembles the C language family but differs significantly in syntactic and semantic details Its design is oriented toward concerns of programming in the large that is of creating and maintaining boundaries  both abstract and operational  that preserve largesystem integrity availability and concurrency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Inkscape"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Inkscape is an opensource vector graphics editor similar to Adobe Illustrator Corel Draw Freehand or Xara X What sets Inkscape apart is its use of Scalable Vector Graphics SVG an open XMLbased W3C standard as the native format."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Youtube Dl"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="youtubedl is a small commandline program to download videos from YouTubecom and a few more sites It is written in Python and its not platform specific It should work in your Unix box in Windows or in Mac OS X It is released to the public domain which means you can modify it redistribute it or use it however you like."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Postman"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Postman helps you be more efficient while working with APIs Using Postman you can construct complex HTTP requests quickly organize them in collections and share them with your coworkers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Azure CLI"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Azure CLI is available across Azure services and is designed to get you working quickly with Azure with an emphasis on automation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GameMaker Studio"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GameMaker Studio has everything you need for games development no matter what your level or expertise."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Charles"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Charles is an HTTP proxy  HTTP monitor  Reverse Proxy that enables a developer to view all of the HTTP and SSL  HTTPS traffic between their machine and the Internet This includes requests responses and the HTTP headers which contain the cookies and caching information."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Media Player"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Media Player is designed to make listening to and watching your multimedia content more enjoyable At the heart of Media Player is a fullfeatured music library that allows you to quickly browse and play music as well as create and manage playlists All your content in the music and video folders on your PC will appear automatically in your library."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="espanso"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A crossplatform Text Expander written in Rust."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ability Office"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ability Office Standard offers 3 core applications essential for home and business Word Processor Spreadsheet and Presentation in one affordable office suite It also includes a Photoalbum and quick application Launcher Just perfect for working from home allowing files to be edited and exchanged with those back in the office and absolutely ideal for students and school children."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Winbox"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Small utility that allows administration of MikroTik RouterOS using a fast and simple GUI."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SearchMyFiles"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SearchMyFiles allows you to make a very accurate search that cannot be done with Windows search For Example You can search all files created in the last 10 minutes with size between 500 and 700 bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iTunes"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="iTunes is the best way to organize and enjoy the music movies and TV shows you already have and shop for the ones you want to get Its home to Apple Music which gives you unlimited access to millions of songs curated playlists1 and Beats 1 radio hosted by Zane Lowe and a team of acclaimed DJs Enjoy all the entertainment iTunes has to offer on your Mac and PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StartIsBack++"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="StartIsBack returns Windows 10 and Windows 8 a real fully featured start menu and start button behaving exactly like the ones in Windows 7."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Advanced SystemCare Free"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Over time your computer may accumulate with large quantities of useless temporary and duplicate files Advanced SystemCare 12 will help clean up these junk files and free up your disk space Also you can use our advanced tools to make registry clean for better use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Send Anywhere"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Send Anywhere is a multiplatform file sharing service where users can directly share digital content in real time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="YUMI Legacy"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="YUMI UEFI"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs It can be used to create a Multiboot USB Flash Drive containing multiple operating systems antivirus utilities disc cloning diagnostic tools and more Contrary to MultiBootISOs which used grub to boot ISO files directly from USB YUMI uses syslinux to boot extracted distributions stored on the USB device and reverts to using grub to Boot Multiple ISO files from USB if necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OP Auto Clicker"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A fullfledged autoclicker with two modes of autoclicking at your dynamic cursor location or at a prespecified location The maximum amounts of clicked can also be set or left as infinite Hotkeys work in the background for convenience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Spotube"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Spotube is a Flutter based lightweight spotify client It utilizes the power of Spotify  Youtubes public API  creates a hazardless performant  resource friendly User Experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Audio Switcher"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Easily switch the default audio device input or output on any Windows PC Vista and above Using this application you can switch output OR input sound devices at the click of a button or the press of a key I designed this application to be incredibly small and lightweight There is no bloat it does exactly what it should nothing more nothing less."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Teams Classic Desktop"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft Teams is a messaging app for teams where all conversations meetings files and notes can be accessed by everyone all in one place Its a place for collaboration and work to happen in the open."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Windows SDK"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Windows 10 SDK for Windows 10 version 1809 provides the latest headers libraries metadata and tools for building Windows 10 apps NoteWindows 10 development targeting Windows 10 version 1903 or later requires Visual Studio 2017 or later This SDK will not be discovered by previous versions of Visual Studio."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RunAsDate Portable"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RunAsDate is a small utility that allows you to run a program in the date and time that you specify This utility doesnt change the current system date and time of your computer but it only injects the datetime that you specify into the desired application."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio 2017 Build "  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="These Build Tools allow you to build native and managed MSBuildbased applications without requiring the Visual Studio IDE There are options to install the Visual C compilers and libraries MFC ATL and CCLI support."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MSEdgeRedirect"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This tool filters and passes the command line arguments of Microsoft Edge processes into your default browser instead of hooking into the microsoftedge handler this should provide resiliency against future changes Additionally an Image File Execution Options mode is available to operate similarly to the Old EdgeDeflector Additional modes are planned for future versions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 5"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 3"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 6"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 7"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the .NET Runtime.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NET Desktop Runtime 8"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET Core is a general purpose development platform maintained by Microsoft and the NET community on GitHub It is crossplatform supporting Windows macOS and Linux and can be used in device cloud and embeddedIoT scenarios This package is required to run Windows Desktop applications with the NET Runtime."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Viber"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Viber is a mobile application that lets you make free phone calls and send text messages to anyone who also has the application installed You can call or text any Viber user anywhere in the world for free."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="StartAllBack"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Introducing  StartAllBack Windows 11 from a better timeline Embrace enhance unsweep classic UI from under the rug."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DiskGenius Free"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="With powerful capabilities and userfriendly interface DiskGenius Free Edition provides a robust solution for individuals and organizations to seek efficient disk management."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UNFORMAT"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="UNFORMAT is a software utility created to solve almost all data loss scenarios due to logical failure It can recover deleted files on a disk or restore deleted or damaged partitions and volumes As well as recovers data after using the FORMAT command."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Active@ UNDELETE"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Active UNDELETE helps you to recover deleted files and restore deleted partitions from a variety of file systems such as FAT NTFS NTFS  EFS MacOS HFS ApFS Linux ext2 ext3 ext4 ZFS Unix UFS Advanced scan algorithms help to restore files even from severely damaged disks Sophisticated userfriendly UI makes navigation through your data a breeze."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HxD Hex Editor"  IsChecked="false" Tag="Disk Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HxD is a carefully designed and fast hex editor which additionally to raw disk editing and modifying of main memory RAM handles files of any size."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Epic Games Launcher"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Epic Games Launcher is how you obtain the Unreal Game Engine modding tools and other Epic Games like Fortnite and the new Epic Games Store."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Vivaldi"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The new Vivaldi browser protects you from trackers blocks unwanted ads and puts you in control with unique builtin features Get Vivaldi and browse fast."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft PC Manager"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft PC manager a good way to protect your personal computer and optimize performance provides PC cleanup antivirus and Windows update making your computer safe and secure."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Openshot"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="OpenShot Video Editor is an awardwinning opensource video editor available on Linux Mac and Windows OpenShot can create stunning videos films and animations with an easytouse interface and rich set of features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WhatsApp"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform centralized messaging and voiceoverIP VoIP service owned by Facebook Inc It allows users to send text messages and voice messages make voice and video calls and share images documents user locations and other content."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Paint.NET"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PaintNET is image and photo editing software for PCs that run Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Stretchly"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="stretchly is a crossplatform electron app that reminds you to take breaks when working on your computer By default it runs in your tray and displays a reminder window containing an idea for a microbreak for 20 seconds every 10 minutes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Silverlight"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Silverlight is a powerful development tool for creating engaging interactive user experiences for Web and mobile applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TreeSize"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Every hard disk is too small if you just wait long enough TreeSize Free tells you where precious disk space has gone."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dot Net 3.5"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flash Player ActiveX"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Google Drive"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Google Drive  All your files  everywhere Safely store your files and access them from any device Choose folders on your computer to sync with Google Drive or backup to Google Photos and access all of your content directly from your PC or Mac."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dot Net 4.5.2"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Microsoft NET Framework 452 is a highly compatible inplace update to the Microsoft NET Framework 4 Microsoft NET Framework 45 and Microsoft NET Framework 451."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dropbox"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Organize all your teams content tune out distractions and get everyone coordinated with the worlds first smart workspace."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="cURL"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Command line tool and library for transferring data with URLs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PDF Creator"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PDFCreator lets you convert any printable document to PDF."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Autoruns"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This utility shows you what programs are configured to run during system bootup or login."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft OneDrive"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Save your files and photos to OneDrive and access them from any device anywhere."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Process Explorer"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Process Explorer shows you information about which handles and DLLs processes have opened or loaded."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FFmpeg"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FFmpeg is a widelyused crossplatform multimedia framework which can process almost all common and many uncommon media formats It has over 1000 internal components to capture decode encode modify combine stream media and it can make use of dozens of external libraries to provide more capabilities."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="OpenVPN Connect"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The official OpenVPN Connect client software developed and maintained by OpenVPN Inc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Git Large File Storage"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Git Large File Storage LFS replaces large files such as audio samples videos datasets and graphics with text pointers inside Git while storing the file contents on a remote server like GitHubcom or GitHub Enterprise."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Nmap"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Nmap Network Mapper is a free and open source utility for network discovery and security auditing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="UltraVNC"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="UltraVNC is an open source application that uses the VNC protocol to control another computer remotely over a network connection UltraVNC allows the use of a remote computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Plex"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Plex is a global streaming media service and a clientserver media player platform made by Plex Inc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Plex Media Server"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Plex Media Server helps you organise your media and stream it to your devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft Visio Viewer"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="By using Microsoft Visio 2016 Viewer Visio users can freely distribute Visio drawings files with a vsdx vsdm vsd vdx vdw vstx vstm vst or vtx extension to team members partners customers or others even if the recipients do not have Visio installed on their computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Keyn Stroke"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KeynStroke makes it easy for your audience to follow your actions on the screen."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fing"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fing App is a free network scanner that makes you discover all connected devices run internet speed tests and help troubleshoot network and device issues Get Fingbox for more advanced security and protection for your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ryujinx"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ryujinx is an opensource Nintendo Switch emulator created by gdkchan and written in C This emulator aims at providing excellent accuracy and performance a userfriendly interface and consistent builds."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Omnify Hotspot"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The best virtual router to turn your PC into a WiFi hotspot  repeater WiFi hotspot allows you to create a wireless access point and share your internet Its easy to use and quick to start as you only need to give it a name and password and then connect your smartphone tablet media player ereader printer laptop and other wireless devices The network name can also include Unicode characters and Emojis."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MKVToolNix"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MKVToolNix is a set of tools to create alter and inspect Matroska files under Linux other Unices and Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Neat Download Manager"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Neat Download Manager is a free Internet Download Manager for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce for all games"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce x86"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="x630ce x64"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Xbox 360 Controller Emulator allows your controller gamepad joystick steering wheel pedals etc. to function on your PC as an Xbox 360 controller. It allows you to remap buttons and axes and to drive cars with steering wheel and pedals or to fly planes with joystick and throttle in games like Grand Theft Auto or Saints Row  Digitally Signed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft .NET SDK 7"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft .NET SDK 8"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Microsoft ASP.NET Core Runtime 7.0"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NET is a free crossplatform opensource developer platform for building many different types of applications."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HFS HTTP File Server"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="You can use HFS HTTP File Server to send and receive files Its different from classic file sharing because it uses web technology to be more compatible with todays Internet It also differs from classic web servers because its very easy to use and runs right outofthe box."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Cemu"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cemu is a highly experimental software to emulate Wii U applications on PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Chatterino"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Chatterino is a chat client for Twitch chat that offers a clean and customizable interface for a better streaming experience."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clementine"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clementine is a modern music player and library organizer supporting various audio formats and online radio services."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clink"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows adding features like syntax highlighting and improved history."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CMake"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="CMake is an opensource crossplatform family of tools designed to build test and package software."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="CopyQ Clipboard Manager"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="CopyQ is a clipboard manager with advanced features allowing you to store edit and retrieve clipboard history."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Crystal Disk Info"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Crystal Disk Info is a disk health monitoring tool that provides information about the status and performance of hard drives It helps users anticipate potential issues and monitor drive health."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Crystal Disk Mark"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Crystal Disk Mark is a disk benchmarking tool that measures the read and write speeds of storage devices It helps users assess the performance of their hard drives and SSDs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Darktable"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Opensource photo editing tool offering an intuitive interface advanced editing capabilities and a nondestructive workflow for seamless image enhancement."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="EA App"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="EA App is a platform for accessing and playing Electronic Arts games."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Falkon"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Falkon is a lightweight and fast web browser with a focus on user privacy and efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="File Converter"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="File Converter is a very simple tool which allows you to convert and compress one or several files using the context menu in windows explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Files"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Alternative file explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flameshot"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Flameshot is a powerful yet simple to use screenshot software offering annotation and editing features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lightshot"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Ligthshot is an Easytouse lightweight screenshot software tool where you can optionally edit your screenshots using different tools share them via Internet andor save to disk and customize the available options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="F.lux"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="flux adjusts the color temperature of your screen to reduce eye strain during nighttime use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHub CLI"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GitHub CLI is a commandline tool that simplifies working with GitHub directly from the terminal."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GOG Galaxy"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GOG Galaxy is a gaming client that offers DRMfree games additional content and more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Greenshot"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Greenshot is a lightweight screenshot software tool with builtin image editor and customizable capture options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hexchat"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HexChat is a free opensource IRC Internet Relay Chat client with a graphical interface for easy communication."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HWMonitor"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="HWMonitor is a hardware monitoring program that reads PC systems main health sensors."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ImageGlass"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ImageGlass is a versatile image viewer with support for various image formats and a focus on simplicity and speed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Itch.io"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Itchio is a digital distribution platform for indie games and creative projects."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KDE Connect"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KDE Connect allows seamless integration between your KDE desktop and mobile devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="KeePassXC"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="KeePassXC is a crossplatform opensource password manager with strong encryption features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Lazygit"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Simple terminal UI for git commands."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LocalSend"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An open source crossplatform alternative to AirDrop."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fork"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fork  a fast and friendly git client."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PulsarEdit"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A Communityled HyperHackable Text Editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Shotcut"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Shotcut is a free open source crossplatform video editor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PaleMoon"  IsChecked="false" Tag="Web Browsers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Pale Moon is an Open Source Goannabased web browser available for Microsoft Windows and Linux with other operating systems in development focusing on efficiency and ease of use."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="JoyToKey"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="enables PC game controllers to emulate the keyboard and mouse input."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Auto Dark Mode"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Automatically switches between the dark and light theme of Windows 10 and Windows 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Firewall Control"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Windows Firewall Control is a powerful tool which extends the functionality of Windows Firewall and provides new extra features which makes Windows Firewall better."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TightVNC"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="TightVNC is a free and Open Source remote desktop software that lets you access and control a computer over the network With its intuitive interface you can interact with the remote screen as if you were sitting in front of it You can open files launch applications and perform other actions on the remote desktop almost as if you were physically there."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Python Version Manager"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="pyenv for Windows is a simple python version management tool It lets you easily switch between multiple versions of Python."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Pixi"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Pixi is a fast software package manager built on top of the existing conda ecosystem Spins up development environments quickly on Windows macOS and Linux Pixi supports Python R CC Rust Ruby and many other languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VSCodium"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS Code."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Thonny Python IDE"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Python IDE for beginners."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Poedit"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Poedit translations editor The best way to translate apps and sites."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Adobe Acrobat Reader"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Adobe Acrobat Reader DC software is the free trusted global standard for viewing printing signing sharing and annotating PDFs Its the only PDF viewer that can open and interact."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Flash Player Plugin"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Adobe Flash Player is freeware software for viewing multimedia executing Rich Internet Applications and streaming video and audio content created on the Adobe Flash platform."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sysinternals"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The Sysinternals Troubleshooting Utilities have been rolled up into a single suite of tools."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SelfishNet"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Control your internet bandwidth with SelfishNet V3 ARP Spoofing application.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NTLite"  IsChecked="false" Tag="Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Integrate updates drivers automate Windows and application setup speedup Windows deployment process and have it all set for the next time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Olive Video Editor"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Olive is a free nonlinear video editor for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mark Text"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A simple and elegant opensource markdown editor that focused on speed and usability."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="pCloud Drive"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="pCloud is a file hosting service also called cloud storage or online storage founded in Switzerland in 2013."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Hurl"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hurl is a command line tool that runs HTTP requests defined in a simple plain text format."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="File Hash Generator"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632 checksums for multiple files Calculate hashes and checksums for the whole file or just specified bytes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Multimark down"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MultiMarkdown or MMD is a tool to help turn minimally markedup plain text into well formatted documents including HTML PDF."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PCSX2 Emulator"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PCSX2 is a free and opensource PlayStation 2 PS2 emulator Its purpose is to emulate the PS2s hardware."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RetroArch"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RetroArch is a frontend for emulators game engines and media players It enables you to run classic games on a wide range of computers and consoles through its slick graphical interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Free Virtual Keyboard"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Free Virtual Keyboard works on any Windows based UMPC with a passive touchscreen Ultramobile PC Tablet PC and Panel PC."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TypeScript for Visual Studio 2017 and 2019"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This is a standalone power tool release of TypeScript for Visual Studio 2017 and 2019 It includes both the TypeScript experience for Visual Studio and a standalone compiler that can be used from the command line."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Caret"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Beautiful  Clever Markdown Editor Download trial."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="iSpy"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="iSpy is the worlds most popular open source video surveillance application Its compatible with the the vast majority of consumer webcams and IP cameras With more than 2 million users worldwide iSpy works with more cameras and devices than anything else on the market."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WavPack"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WavPack is a completely open audio compression format providing lossless highquality lossy and a unique hybrid compression mode Although the technology is loosely based on previous versions of WavPack the new version 4 format has been designed from the ground up to offer unparalleled performance and functionality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ProcessThreadsView"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ProcessThreadsView is a small utility that displays extensive information about all threads of the process that you choose."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Zulu"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard Zulu is 100 open source and freely downloadable Now Java developers system administrators and end users can enjoy the full benefits of open source Java with deployment flexibility and control over upgrade timing."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitHubReleaseNotesv1"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Generate Release Notes in MarkDown format from a GitHub project."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Tome"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Developing games is all about data With game systems for modifying data and user interfaces for presenting it finding a sophisticated data model is key to creating successful games Even more being able to change this data and iterate on a daytoday basis is mandatory in todays production cycles."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Win32 OpenSSH"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="OpenSSH is a complete implementation of the SSH protocol version 2 for secure remote login command execution and file transfer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Komodo Edit"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Komodo Edit is a free and open source text editor for dynamic programming languages."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FreeCAD"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and opensource multiplatform 3D parametric modeler."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SQLite"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SQLite is an inprocess library that implements a selfcontained serverless zeroconfiguration transactional SQL database engine SQLite is an embedded SQL database engine Unlike most other SQL databases SQLite does not have a separate server process SQLite reads and writes directly to ordinary disk files A complete SQL database with multiple tables indices triggers and views is contained in a single disk file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MkDocs"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MkDocs Material Theme"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MkDocs is a fast simple and downright gorgeous static site generator thats geared towards building project documentation Documentation source files are written in Markdown and configured with a single YAML configuration file."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PuTTY"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free implementation of SSH and Telnet along with an xterm terminal emulator."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="WinSCP"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="WinSCP is an open source free SFTP client FTP client WebDAV client S3 client and SCP client for Windows Its main function is file transfer between a local and a remote computer Beyond this WinSCP offers scripting and basic file manager functionality."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="LibreOffice Still"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="LibreOffice is the free powerpacked Open Source personal productivity suite for Windows macOS and Linux that gives you six featurerich applications for all your document production and data processing needs."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aio Runtimes"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="All in One Runtimes also known as AIO Runtimes is a program that integrates essential runtime packages ensuring the seamless functionality of all programs by installing them automatically."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual-C-Runtimes All in One Oct 2024"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This archive contains the latest version Oct 2024 of all VCRedist Visual Studio C runtimes installable with a single click by running the included batch file installer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GPU-Z"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="GPUZ is a lightweight system utility designed to provide vital information about your video card and graphics processor."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MemTest86"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MemTest86 boots from a USB flash drive and tests the RAM in your computer for faults using a series of comprehensive algorithms and test patterns."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Memtest86 Plus"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Memtest86 Plus v6 is a unified free opensource memory testing tool released under GNU GPL v2.0. The new v6 code base originally called PCMemTest was provided by Martin Whitaker based on Memtest86 v5 developed by Sam Demeulemeester. Both are now working on Memtest86."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="VLC Skins"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Put the downloaded VLT files in the following folder On Windows the skins folder in the VLC installation directory e.g. CProgram FilesVideoLANVLCskins On Linux/Unix /.local/share/vlc/skins2."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GrepWin"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Regular expression search and replace for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NICE DCV Server"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NICE DCV is a remote display protocol that securely streams desktops and apps from cloud or data centers to any device enabling graphicsintensive applications on Amazon EC2. Its used for HPC workloads and by services like Appstream 2.0 and AWS RoboMaker."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NTag"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="NTag is a cross platformgraphical tag editor focused on everyday life use cases."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Radeon™ RX 570 Adrenalin Edition Windows 10"  IsChecked="false" Tag="GPU Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="GPU Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RX 570 Driver Adrenalin 24.3.1 WHQL Recommended."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Radeon™ RX 580 Adrenalin Edition Windows 10"  IsChecked="false" Tag="GPU Drivers"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="GPU Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="RX 580 Adrenalin 24.9.1 WHQL Recommended."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual C++ Redistributable Runtimes AIO Repack"  IsChecked="false" Tag="Runtimes"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Visual C Redistributable Runtimes AIO Repack is all the latest Microsoft Visual C Redistributable Runtimes without the original setup bloat payload."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Volume2"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Advanced Windows volume control."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="qBittorrent Enhanced Edition"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Unofficial qBittorrent Enhanced based on qBittorrent."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Aspia"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remote desktop and file transfer tool."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SimpleTransfer Desktop"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Simple Transfer is the easiest way of transferring your Photos and Videos to computer and other iOS devices wirelessly or USB. No need for cable iTunes or extra softwares on your computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Twitch Desktop App"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Servers  A virtual home for your community to chat watch and play with fully customizable text and voice rooms."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remote Desktop Manager"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remote Connections  Passwords. Everywhere."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Torrid"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Torrid is a multiserver multiclient multitracker Remote Torrent Client which allows any number of installed torrent engines.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mediamonkey"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Manage small to large collections of audio files videos and playlists 100000 whether on a hard drive network or CDs. Rip CDs download podcasts lookup artwork and other missing information online tag almost any audio or video format and automatically rename/reorganize files on your hard drive."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MediaInfo"  IsChecked="false" Tag="Media Tools"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Convenient unified display of the most relevent technical and tag data for video and audio files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Universal Media Server"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Universal Media Server is a DLNAcompliant UPnP Media Server. It is capable of sharing video audio and images between most modern devices."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="K-Lite Codec Pack Standard"  IsChecked="false" Tag="Media"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Media"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The KLite Codec Pack is a collection of DirectShow filters VFW/ACM codecs and tools. Codecs and DirectShow filters are needed for encoding and decoding audio and video formats. The KLite Codec Pack is designed as a userfriendly solution for playing all your audio and movie files. With the KLite Codec Pack you should be able to play all the popular audio and video formats and even several less common formats."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="PowerISO"  IsChecked="false" Tag="Compression"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Compression"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="PowerISO provides an allinone solution. You can do every thing with your ISO files and disc image files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Screen To Gif"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="This tool allows you to record a selected area of your screen live feed from your webcam or live drawings from a sketchboard. Afterwards you can edit and save the animation as a gif apng video psd or png images."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Figma"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The collaborative interface design tool Build better products as a team. Design prototype and gather feedback all in one place with Figma."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="EarTrumpet"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="EarTrumpet is a powerful volume control app for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Visual Studio Code Insiders"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Microsoft Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications. Microsoft Visual Studio Code is free and available on your favorite platform  Linux macOS and Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="AyuGramDesktop"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Desktop Telegram client with good customization and Ghost mode."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Zettlr"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Zettlr is a supercharged markdown editor that combines many writing editor features and collect them in one application. It aims at speeding up your workflow and help you write without any interruptions."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="RustDesk"  IsChecked="false" Tag="File Sharing"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An opensource remote desktop software works out of the box no configuration required written in Rust."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Ente Auth"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="An endtoend encrypted cross platform and free app for storing your 2FA codes with cloud backups."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SQLiteStudio"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SQLiteStudio is desktop application for browsing and editing SQLite database files. It is aimed for people who know what SQLite is or what relational databases are in general."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DuckStation"  IsChecked="false" Tag="Portable"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Portable"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text=" Fast PlayStation 1 emulator for x8664/AArch32/AArch64/RV64."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Authme - Simple 2FA"  IsChecked="false" Tag="Security"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Security"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Simple 2FA desktop application."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SuperCopier2"  IsChecked="false" Tag="Utilities"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SuperCopier2 SuperCopier replaces Windows explorer file copy and adds many features."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Octopus Deploy"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Octopus Deploy is a Continuous Delivery platform for complex deployments across your entire stack. Deploy with ease to Kubernetes Linux Windows virtual machines Amazon Web Services Azure or Google Cloud. If the Octopus Tentacle agent SSH command line or a web service can speak to it Octopus can deploy to it."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kindle Previewer"  IsChecked="false" Tag="Documents"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Documents"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Kindle Previewer is a graphical user interface tool that emulates how books display across Kindle devices and apps. Kindle Previewer makes it easy for publishers to preview the layout of a book and make sure its text displays properly for any orientation or font size to ensure publishers produce and submit the highest quality Kindle books."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Interior Design 3D"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Interior Design 3D is an expert program for home design and floor plan creation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MeshLab"  IsChecked="false" Tag="Imaging"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="MeshLab is an open source portable and extensible system for the processing and editing of unstructured large 3D triangular meshes. It is aimed to help the processing of the typical notsosmall unstructured models."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GitKraken"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Legendary Git GUI client for Windows Mac  Linux."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Slack"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Slack is a collaboration hub for work no matter what work you do. Its a place where conversations happen decisions are made and information is always at your fingertips. With Slack your team is better connected."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rocket Chat"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rocket.Chat is the leading open source team chat software solution. Free unlimited and completely customizable with onpremises and SaaS cloud hosting."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="TeamSpeak"  IsChecked="false" Tag="Communication"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Communication"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Use crystal clear sound to communicate with your team mates crossplatform with militarygrade security. lagfree performance  unparalleled reliability and uptime."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="FFFTP"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="FFFTP is lightweight FTP client software. FFFTP has many useful feature such as directory mirroring character encdoging conversion Firewall and SOCK onetime password support and so on."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="SmartFTP"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SmartFTP is a fast and reliable FTP FTPS SFTP HTTP Amazon S3 WebDAV Google Drive Google Cloud Storage Microsoft OneDrive Backblaze B2 Telnet Terminal client with lots of features and a modern user interface."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Rclone"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rclone rsync for cloud storage is a commandline program to sync files and directories to and from different cloud storage providers."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Cyberduck"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cyberduck is a libre server and cloud storage browser for Mac and Windows with support for FTP SFTP WebDAV Amazon S3 OpenStack Swift Backblaze B2 Microsoft Azure  OneDrive Google Drive and Dropbox."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dolphin"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dolphin is an emulator for two recent Nintendo video game consoles the GameCube and the Wii. It allows PC gamers to enjoy games for these two consoles in full HD 1080p with several enhancements compatibility with all PC controllers turbo speed networked multiplayer and even more."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="mGBA"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="mGBA is an opensource Game Boy Advance emulator."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="EmulationStation"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A graphical and themeable emulator frontend that allows you to access all your favorite games in one place even without a keyboard."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="ScummVM"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="ScummVM is a program which allows you to run certain classic graphical adventure and roleplaying games provided you already have their data files. The clever part about this ScummVM just replaces the executables shipped with the games allowing you to play them on systems for which they were never designed."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Project64"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Project64 is a free and opensource emulator for the Nintendo 64 and Nintendo 64 Disk Drive written in C currently for Windows."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DOSBox"  IsChecked="false" Tag="Gaming"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="DOSBox is an emulator program which emulates an IBM PC compatible computer running a DOS operating system."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Kodu Game Lab"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Kodu Game Lab is a 3D game development environment that is designed to teach kids basic programming principles.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="GDevelop"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A free and open source nocode game engine designed to be usable by everyone.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MongoDB Tools"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The MongoDB Database Tools are a collection of commandline utilities for working with a MongoDB deployment."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="DB Browser for SQLite"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="DB Browser for SQLite DB4S is a high quality visual open source tool to create design and edit database files compatible with SQLite."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MySQL"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The MySQL software delivers a very fast multithreaded multiuser and robust SQL Structured Query Language database server. MySQL Server is intended for missioncritical heavyload production systems as well as for embedding into massdeployed software."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MongoDB Compass"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Compass is a free interactive tool for querying optimizing and analyzing your MongoDB data."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="MongoDB Compass readonly"  IsChecked="false" Tag="Development"  ToolTip="Install it again to update. If there is an issue with the program, please report the problem on the GitHub repository."  IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Development"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Compass is a free interactive tool for analyzing your MongoDB data."/>
        </StackPanel>
                
                </ListView>

            </TabItem>
            <TabItem x:Name="tweeksTab" Header="{Binding tweaks, TargetNullValue=Tweaks}" BorderBrush="{x:Null}" Background="{x:Null}">
                <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Horizontal">
                                <TextBlock Text="" FontFamily="Segoe MDL2 Assets" VerticalAlignment="Center" HorizontalAlignment="Left"  FontSize="18" Margin="0"/>
                                <TextBlock Text="{Binding}"  FontSize="15" VerticalAlignment="Center" HorizontalAlignment="Left"  TextWrapping="Wrap" Margin="20,0,2,0"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>
                   <ListView Name="tweakslist" 
                        BorderBrush="{x:Null}" 
                        Background="{x:Null}"
                        SelectionMode="Single"
                        SnapsToDevicePixels="True"
                        VirtualizingStackPanel.IsVirtualizing="True"
                        VirtualizingStackPanel.IsContainerVirtualizable="True"
                        VirtualizingStackPanel.VirtualizationMode="Recycling"
                        ScrollViewer.CanContentScroll="True">
                        <ListView.ItemsPanel>
                            <ItemsPanelTemplate>
                                <VirtualizingStackPanel />
                            </ItemsPanelTemplate>
                        </ListView.ItemsPanel>
                                <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disk cleanup"  IsChecked="false" Tag="Storage"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Storage"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Clean temporary files that are not necessary."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="System File Checker"  IsChecked="false" Tag="Fixer"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="sfc /scannow Use the System File Checker tool to repair missing or corrupted system files."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clean Taskbar"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable the News and interests and People icon Show Search icon only for Windows 10/11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Windows 10/11 Bloatware"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="A selection of preinstalled apps including productivity tools games communication apps and entertainment software like Xbox Microsoft News TikTok and more will be removed.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fix Stutter in games"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fix Stutter in Games Disable GameBarPresenceWriter. Windows 10/11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable the Ultimate Performance Power Plan"  IsChecked="false" Tag="Power"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Power"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enable the Ultimate Performance Power Plan."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Reset the TCP/IP Stack"  IsChecked="false" Tag="Fixer"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="If you have an internet problem Reset network configuration."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Setup Auto login"  IsChecked="false" Tag="Other"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Other"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Setup auto login Windows username."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable  Xbox Services"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables all Xbox Services Game Mode and Optimizations for Windowed Games and fix stutter playing smooth."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Start Menu Ads"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable Start menu Ads and Settings."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Windows Web Search"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable web search in Windows by Modify the registry settings related to Windows Search for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Turn off background Apps"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Turn off background apps for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable suggestions on Start Menu"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables suggestions on start menu for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Folder Shortcuts From File Explorer"  IsChecked="false" Tag="Other"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Other"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Remove Documents Videos Pictures Desktop. Shortcuts from File Explorer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Optimize Windows Services"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable Print Spooler Fax Diagnostic Policy Downloaded Maps Manager Windows Error Reporting Service Remote Registry  Internet Connection Sharing Disables Telemetry and Data."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Hibernate"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Hibernate is a powersaving mode in Microsoft Windows operating systems that allows the system to save the current state of your computer to the hard disk and then power down completely."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable OneDrive"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disabling OneDrive for Windows 10 and 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Activate Windows Old Photo Viewer"  IsChecked="false" Tag="Classic"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enables the classic Windows Photo Viewer for Windows 10."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Restore Classic Context Menu Windows 11"  IsChecked="false" Tag="Classic"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Restore the old context menu for Windows 11."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Copilot in Windows 11"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Copilot in Windows provides centralized generative AI assistance to your users right from the Windows desktop Copilot in Windows appears as a side bar docked on the Windows desktop and is designed to help users get things done in Windows Copilot in Windows can perform common tasks in Windows like changing Windows settings which makes it different from the browserbased Copilot in Edge."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Recall Snapshots in Windows 11 24H"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Recall is an upcoming preview experience exclusive to Copilot PCs that will help you easily find and remember things youve seen using natural language."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Delete Thumbnail Cache"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="removing the stored image thumbnails on your computer These thumbnails are small versions of images used by the operating system to display image previews quickly Over time the cache can become large or corrupted causing slowdowns or display issues Deleting it can free up space.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Old Volume Control in Windows 10"  IsChecked="false" Tag="Classic"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="The old volume control in Windows 10 refers to the classic audio mixer interface that was used in earlier versions of Windows before the modern volume control system was introduced.."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Toggle Key Sounds"  IsChecked="false" Tag="Classic"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Toggle key sounds in Windows are audio cues that play when you press the Caps Lock Num Lock or Scroll Lock keys. These sounds help users identify when these keys are activated or deactivated."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Homegroup"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disables HomeGroup  HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs that are currently running and connected to your network."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Home and Gallery from explorer in Windows 11"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Removes the Home and Gallery from explorer and sets This PC as default."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable all Privacy Settings"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disable WifiSense  Activity History  ActivityFeed Telemetry  DataCollection."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Autoplay and Autorun"  IsChecked="false" Tag="Protection"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Disabling autoplay in Windows prevents the automatic launch of media or applications when a removable device such as a USB drive or CD is connected to the computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable SMB Server"  IsChecked="false" Tag="Protection"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="SMB Server enables file and printer sharing over a network allowing access to resources on remote computers as if they were local."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Set current network profile to public"  IsChecked="false" Tag=""    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content=""/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Deny file sharing device discovery etc."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable F8 boot menu options"  IsChecked="false" Tag="BIOS"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="BIOS"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Enable F8 boot menu options."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable display and sleep mode timeouts"  IsChecked="false" Tag="Power"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Power"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="If you frequently use your device disable this."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Set Wallpaper desktop Quality to 100%"  IsChecked="false" Tag="Personalization"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Personalization"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Its Microsoft what should I say."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Windows Transparency"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Its Microsoft what should I say."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable scheduled defragmentation task"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Defragmentation in Windows optimizes disk performance by reorganizing fragmented data improving access times and system efficiency."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Enable NET 3.5"  IsChecked="false" Tag="Classic"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Classic"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Some old games and applications require .NET Framework 3.5."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Super Performance"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="All Windows effects disabled and optimized for windowed games. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Remove Widgets from Taskbar in Windows 11"  IsChecked="false" Tag="Performance"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Widgets are one of the new user interface elements in Windows 11 They are used to display dynamic information on the desktop including weather news and other information from various sources."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Unknown"  IsChecked="false" Tag="Privacy"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Fix Arabic encoding"  IsChecked="false" Tag="Fixer"    IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Fix issues related to strange symbols appearing in Arabic text."/>
        </StackPanel>
                    </ListView>
            </TabItem>
            <TabItem x:Name="SettingsTab" Header="{Binding settings, TargetNullValue=Settings}" BorderBrush="{x:Null}" Background="{x:Null}">
                <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Horizontal">
                                <TextBlock Text="" FontFamily="Segoe MDL2 Assets" VerticalAlignment="Center" HorizontalAlignment="Left"  FontSize="18" Margin="0"/>
                                <TextBlock Text="{Binding}"  FontSize="15" VerticalAlignment="Center" HorizontalAlignment="Left" TextWrapping="Wrap" Margin="20,0,2,0"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>
                    <ListView Name="SettingsList" 
                        BorderBrush="{x:Null}" 
                        Background="{x:Null}"
                        SelectionMode="Single"
                        SnapsToDevicePixels="True"
                        VirtualizingStackPanel.IsVirtualizing="True"
                        VirtualizingStackPanel.IsContainerVirtualizable="True"
                        VirtualizingStackPanel.VirtualizationMode="Recycling"
                        ScrollViewer.CanContentScroll="True">
                        <ListView.ItemsPanel>
                            <ItemsPanelTemplate>
                                <VirtualizingStackPanel />
                            </ItemsPanelTemplate>
                        </ListView.ItemsPanel>
                                <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show file extensions" Name="Showfileextensions"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Show file extensions in Windows displays the suffix at the end of file names like .txt .jpg .exe indicating file types and helping users identify which programs can open them simplifying file management and differentiation."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show Super Hidden" Name="ShowSuperHidden"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Show Super Hidden displays files and folders in Windows that are hidden beyond standard hidden files often system files to prevent accidental changes."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dark Mode" Name="DarkMode"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Personalize"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Dark Mode is a setting that changes the screen to darker colors reducing eye strain and saving battery life on OLED screens."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NumLook" Name="NumLook"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Protection"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Toggle the Num Lock key state when your computer starts."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sticky Keys" Name="StickyKeys"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities or help users reduce repetitive strain injury."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mouse Acceleration" Name="MouseAcceleration"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Cursor movement is affected by the speed of your physical mouse movements."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="End Task On Taskbar Windows 11" Name="EndTaskOnTaskbarWindows"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Option to end task when right clicking a program in the taskbar."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clear Page File At Shutdown" Name="ClearPageFileAtShutdown"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Storage "/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Page file in Windows removes sensitive data stored in virtual memory when the system shuts down. This enhances security by ensuring that the data in the page file which may contain passwords encryption keys or other sensitive information is wiped out and cannot be accessed after rebooting. However it can increase shutdown time."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Auto End Tasks" Name="AutoEndTasks"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Automatically end tasks that are not responding."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Performance Options" Name="PerformanceOptions"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Performance"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Adjust for best performance."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Launch To This PC" Name="LaunchToThisPC"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Changing the default opening location of File Explorer in Windows allows it to open directly to This PC instead of Quick Access making it easier to quickly access main drives and system folders."/>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Automatic Driver Installation" Name="DisableAutomaticDriverInstallation"  Tag="" Style="{StaticResource ToggleSwitchStyle}"   IsEnabled="False" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                <Label HorizontalAlignment="Center" VerticalAlignment="Center" Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
            </StackPanel>
            <TextBlock Width="666" Background="Transparent" Margin="8" Foreground="{DynamicResource TextColorSecondaryColor2}" FontSize="15" FontWeight="SemiBold" VerticalAlignment="Center" TextWrapping="Wrap" Text="Stopping Windows from automatically downloading and installing drivers."/>
        </StackPanel>
                    </ListView>
            </TabItem>
    </TabControl>
<!--End TabControl-->
        <Grid Row="2">
  <Grid.ColumnDefinitions>
    <ColumnDefinition Width="*"/>
    <ColumnDefinition Width="auto"/>
  </Grid.ColumnDefinitions>
  <!-- Buttons -->
     <Grid Column="1" Background="Transparent">
      <!--Install Button-->
        <Button
          Name="installBtn"
          FontSize="14"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          HorizontalContentAlignment="Center"
          VerticalContentAlignment="Center"
          Cursor="Hand"
          Width="140" 
          Height="45" 
          Margin="20">
          <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center">
              <TextBlock Name="installText" 
              Text="{Binding Install, TargetNullValue=Install}" 
              Foreground="White" 
              Margin="0" 
              VerticalAlignment="Center"/>
              <TextBlock Name="installIcon"
              Text=" &#xE930;" 
              Foreground="White" 
              FontFamily="Segoe MDL2 Assets" 
              FontSize="14" 
              HorizontalAlignment="Center"
              VerticalAlignment="Center"/>
          </StackPanel>
        </Button>
      <!--End Install Button-->
      <!--Apply Button-->
          <Button
            Name="applyBtn"
            FontSize="14" 
            Visibility="Hidden"
            HorizontalAlignment="Center"
            VerticalAlignment="Center"
            HorizontalContentAlignment="Center"
            VerticalContentAlignment="Center"
            Cursor="Hand"
            Width="140" 
            Height="45" 
            Margin="20">
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center">
                <TextBlock Name="applyText" 
                Text="{Binding Apply, TargetNullValue=Apply}" 
                Foreground="White" 
                Margin="0" 
                VerticalAlignment="Center"/>
                <TextBlock Name="applyIcon" 
                Text=" &#xE930;" Foreground="White" 
                FontFamily="Segoe MDL2 Assets" 
                FontSize="14" 
                HorizontalAlignment="Center"
                VerticalAlignment="Center"/>
            </StackPanel>
          </Button>
      <!--End Apply Button-->
    </Grid>
  <!-- Buttons -->
  <!-- Quote Text & Icon -->
    <Grid Column="0" Background="Transparent">
      <StackPanel Orientation="Horizontal">
        <TextBlock
          Text="&#xEFA9;"
          Name="QuoteIcon"
          Margin="15,0,0,0"
          FontSize="14"
          TextAlignment="Center"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          FontFamily="Segoe MDL2 Assets"
        />
        <TextBlock Name="quotes"
          HorizontalAlignment="Left"
          VerticalAlignment="Center" 
          TextWrapping="Wrap"
          Padding="8"
          Text="#StandWithPalestine"
          FontWeight="SemiBold"
          FlowDirection="LeftToRight"
          Width="611"
        />
      </StackPanel>
    </Grid>
  <!-- Quote Text & Icon -->
</Grid>
</Grid>
</Window>
<!--End Main Window-->
'
#===========================================================================
#endregion End WPF Main Window
#===========================================================================
#===========================================================================
#region Begin WPF About Window
#===========================================================================
$AboutWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="{Binding About, TargetNullValue=About}"
    WindowStartupLocation="CenterScreen"
    Background="{DynamicResource PrimaryBackgroundColor}"
    WindowStyle="ToolWindow"
    Height="555" Width="455"
    ShowInTaskbar="True"
    MinHeight="555"
    MinWidth="455"
    ResizeMode="NoResize"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
    <Window.Resources>
      <!--Scrollbar Thumbs-->
          <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
              <Setter Property="Template">
                  <Setter.Value>
                      <ControlTemplate TargetType="{x:Type Thumb}">
                          <Grid x:Name="Grid">
                              <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                              <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                          </Grid>
                          <ControlTemplate.Triggers>
                              <Trigger Property="Tag" Value="Horizontal">
                                  <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                                  <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                              </Trigger>
                          </ControlTemplate.Triggers>
                      </ControlTemplate>
                  </Setter.Value>
              </Setter>
          </Style>
          <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
              <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
              <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
              <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
              <Setter Property="Width" Value="8" />
              <Setter Property="Template">
                  <Setter.Value>
                      <ControlTemplate TargetType="{x:Type ScrollBar}">
                          <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                              <Grid.RowDefinitions>
                                  <RowDefinition Height="0.00001*" />
                              </Grid.RowDefinitions>
                              <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                                  <Track.Thumb>
                                      <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                                  </Track.Thumb>
                                  <Track.IncreaseRepeatButton>
                                      <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                                  </Track.IncreaseRepeatButton>
                                  <Track.DecreaseRepeatButton>
                                      <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                                  </Track.DecreaseRepeatButton>
                              </Track>
                          </Grid>
                          <ControlTemplate.Triggers>
                              <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                                  <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                              </Trigger>
                              <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                                  <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                              </Trigger>
                              <Trigger Property="IsEnabled" Value="false">
                                  <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                              </Trigger>
                              <Trigger Property="Orientation" Value="Horizontal">
                                  <Setter TargetName="GridRoot" Property="LayoutTransform">
                                      <Setter.Value>
                                          <RotateTransform Angle="-90" />
                                      </Setter.Value>
                                  </Setter>
                                  <Setter TargetName="PART_Track" Property="LayoutTransform">
                                      <Setter.Value>
                                          <RotateTransform Angle="-90" />
                                      </Setter.Value>
                                  </Setter>
                                  <Setter Property="Width" Value="Auto" />
                                  <Setter Property="Height" Value="8" />
                                  <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                                  <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                                  <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                              </Trigger>
                          </ControlTemplate.Triggers>
                      </ControlTemplate>
                  </Setter.Value>
              </Setter>
          </Style>
      <!--End Scrollbar Thumbs-->
      <!--Button Style-->
        <Style TargetType="Button">
          <Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
          <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
          <Setter Property="BorderBrush" Value="Transparent"/>
          <Setter Property="BorderThickness" Value="1"/>
          <Setter Property="Template">
              <Setter.Value>
                  <ControlTemplate TargetType="Button">
                      <Border CornerRadius="20" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                          <ContentPresenter HorizontalAlignment="Center"
                                              VerticalAlignment="Center"/>
                      </Border>
                  </ControlTemplate>
              </Setter.Value>
          </Setter>
          <Style.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                  <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                  <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
              </Trigger>
          </Style.Triggers>
        </Style>
      <!--End Button Style-->
    </Window.Resources>
  <Grid Margin="8">
      <!-- Define rows and columns for layout -->
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/> <!-- Logo -->
            <RowDefinition Height="Auto"/> <!-- Contribute Names -->
            <RowDefinition Height="Auto"/> <!-- Icons -->
        </Grid.RowDefinitions>
      <!-- Define rows and columns for layout -->
      <!-- Logo Section -->
        <Grid Grid.Row="0">
            <StackPanel Orientation="Vertical">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png" 
                Height="90" Width="Auto" HorizontalAlignment="Center" Margin="0"/>
                <TextBlock  
                    Text="Made with ♥ by Emad Adel"
                    TextWrapping="Wrap" 
                    HorizontalAlignment="Center" 
                    Margin="0,5,0,5" 
                    Width="355" 
                    Padding="8" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                    FontSize="14" 
                    TextAlignment="Center"
                />
                <TextBlock 
                    Name="ver" 
                    Text="9/1/1998" 
                    FontSize="14" 
                    TextAlignment="Center" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                />
                <!-- Description Section -->
                <TextBlock  
                    Text="ITT created to simplify software installation and Windows tweaks, making it easier for others to use their computers. It is an open-source project, and you can contribute to make it better by adding your favorite apps and more."
                    TextWrapping="Wrap" 
                    HorizontalAlignment="Center" 
                    Margin="0,2,0,2" 
                    Width="355" Padding="8" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                    FontSize="14" 
                    TextAlignment="Center"
                />
            </StackPanel>
        </Grid>
      <!-- Logo Section End -->
      <!-- Contribute Names Section -->
        <Grid Grid.Row="1">
          <StackPanel Orientation="Vertical">
              <!-- Contribute Names Section -->
              <TextBlock Text="Contributors"
              TextWrapping="Wrap" HorizontalAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor2}" Margin="0,5,0,5" FontSize="12" FontStyle="Italic" TextAlignment="Center"/>
              <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto" Height="103">
                <StackPanel Margin="20,0,0,0">
                    <TextBlock Text="emadadel4" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
<TextBlock Text="yousefmhmd" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
                </StackPanel>
                </ScrollViewer>
          </StackPanel>
        </Grid>
      <!-- Contribute Names Section End -->
      <!-- Social Media Icons Section -->
        <StackPanel Grid.Row="2" Orientation="Horizontal" VerticalAlignment="Bottom" HorizontalAlignment="Center" Margin="0,20,0,0">
            <Button Width="38" Height="38" Name="github" Cursor="Hand" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/github.png"/>
            </Button>
            <Button Width="38" Height="38" Name="telegram" Cursor="Hand" Margin="5">
              <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/telegram.png"/>
          </Button>
            <Button Width="38" Height="38"  Cursor="Hand" Name="yt" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/youtube.png"/>
            </Button>
            <Button Width="38" Height="38" Name="blog" Cursor="Hand" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/blog.png"/>
            </Button>
            <Button Width="38" Height="38" Name="coffee" Cursor="Hand" Margin="5">
              <Image Source="https://cdn.buymeacoffee.com/assets/homepage/meta/apple-icon-120x120.png"/>
          </Button>
        </StackPanel>
      <!-- Social Icons Section End -->
  </Grid>
</Window>

'
#===========================================================================
#endregion End WPF About Window
#===========================================================================
#===========================================================================
#region Begin WPF Event Window
#===========================================================================
function Show-Event {
    # if ($itt.PopupWindow -eq "off") { return }
    [xml]$event = $EventWindowXaml
    $itt.event = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $event))
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))

    $itt.event.FindName('closebtn').add_MouseLeftButtonDown({ $itt.event.Close() })
    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ DisablePopup; $itt.event.Close() })

    
        $itt.event.FindName('title').text = 'Changelog'.Trim()
        $itt.event.FindName('date').text = '01/31/2025'.Trim()
        
    
            $itt.event.FindName('preview2').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            
            $itt.event.FindName('esg').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            
            $itt.event.FindName('preview').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            
            $itt.event.FindName('ytv').add_MouseLeftButtonDown({
                    Start-Process('https://www.youtube.com/watch?v=QmO82OTsU5c')
                })
            
            
            $itt.event.FindName('shell').add_MouseLeftButtonDown({
                    Start-Process('https://www.youtube.com/watch?v=nI7rUhWeOrA')
                })
            
            
            $itt.event.FindName('ps').add_MouseLeftButtonDown({
                    Start-Process('https://www.palestinercs.org/en/Donation')
                })
            
            
    
    $itt.event.Add_PreViewKeyDown({
        if ($_.Key -eq "Escape") { $itt.event.Close() }
    })

    # Calculate timestamp
    $storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate
    if (($daysElapsed.Days -lt 1) -or (($itt.PopupWindow -eq "0") -and (-not $i))) {
        $itt.event.ShowDialog() | Out-Null
    }
}

function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
}

$EventWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="ITT | Event" 
    WindowStartupLocation = "CenterScreen" 
    Background="Transparent"
    WindowStyle="None"
    AllowsTransparency="True"
    Height="600" Width="486"
    ShowInTaskbar = "False"
    Topmost="True"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
    <Window.Resources>
        <!--Scrollbar Thumbs-->
            <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
                <Setter Property="Template">
                    <Setter.Value>
                        <ControlTemplate TargetType="{x:Type Thumb}">
                            <Grid x:Name="Grid">
                                <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                                <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                            </Grid>
                            <ControlTemplate.Triggers>
                                <Trigger Property="Tag" Value="Horizontal">
                                    <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                                    <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                                </Trigger>
                            </ControlTemplate.Triggers>
                        </ControlTemplate>
                    </Setter.Value>
                </Setter>
            </Style>
            <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
                <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
                <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
                <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
                <Setter Property="Width" Value="8" />
                <Setter Property="Template">
                    <Setter.Value>
                        <ControlTemplate TargetType="{x:Type ScrollBar}">
                            <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                                <Grid.RowDefinitions>
                                    <RowDefinition Height="0.00001*" />
                                </Grid.RowDefinitions>
                                <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                                    <Track.Thumb>
                                        <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                                    </Track.Thumb>
                                    <Track.IncreaseRepeatButton>
                                        <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                                    </Track.IncreaseRepeatButton>
                                    <Track.DecreaseRepeatButton>
                                        <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                                    </Track.DecreaseRepeatButton>
                                </Track>
                            </Grid>
                            <ControlTemplate.Triggers>
                                <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                                    <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                                </Trigger>
                                <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                                    <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                                </Trigger>
                                <Trigger Property="IsEnabled" Value="false">
                                    <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                                </Trigger>
                                <Trigger Property="Orientation" Value="Horizontal">
                                    <Setter TargetName="GridRoot" Property="LayoutTransform">
                                        <Setter.Value>
                                            <RotateTransform Angle="-90" />
                                        </Setter.Value>
                                    </Setter>
                                    <Setter TargetName="PART_Track" Property="LayoutTransform">
                                        <Setter.Value>
                                            <RotateTransform Angle="-90" />
                                        </Setter.Value>
                                    </Setter>
                                    <Setter Property="Width" Value="Auto" />
                                    <Setter Property="Height" Value="8" />
                                    <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                                    <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                                    <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                                </Trigger>
                            </ControlTemplate.Triggers>
                        </ControlTemplate>
                    </Setter.Value>
                </Setter>
            </Style>
        <!--End Scrollbar Thumbs-->
    </Window.Resources>
    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard>
                <Storyboard>
                    <DoubleAnimation Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.5"/>
                </Storyboard>
            </BeginStoryboard>
        </EventTrigger>
    </Window.Triggers>
    <Border Background="{DynamicResource PrimaryBackgroundColor}" BorderBrush="{DynamicResource SecondaryPrimaryBackgroundColor}" BorderThickness="4" CornerRadius="10">
    <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="auto"/>
            </Grid.RowDefinitions>
            <StackPanel x:Name="MainStackPanel" Height="Auto" Background="Transparent" Orientation="Vertical" Margin="20">
                <!-- Title -->
                    <Grid Row="0" Background="Transparent">
                        <TextBlock Text="&#10006;" 
                        Name="closebtn"
                        HorizontalAlignment="Right" 
                        VerticalAlignment="Top"
                        Margin="0"
                        Cursor="Hand"
                        Foreground="red" />
                        <StackPanel Orientation="Vertical" Margin="0">
                            <TextBlock 
                            Name="title"
                            Height="Auto"
                            Width="Auto"
                            FontSize="20"
                            Text="What''s New"
                            Foreground="{DynamicResource TextColorSecondaryColor}"
                            FontWeight="SemiBold"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
                            <TextBlock
                            Name="date" 
                            Height="Auto"
                            Width="Auto"
                            Margin="5,0,0,0"
                            Text="8/29/2024"
                            Foreground="{DynamicResource TextColorSecondaryColor2}"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
                        </StackPanel>
                    </Grid>
                <!-- End Title -->
            </StackPanel>
        <Grid Row="1" Background="Transparent" Margin="20">
            <ScrollViewer Name="ScrollViewer" VerticalScrollBarVisibility="Auto" Height="Auto">
                <StackPanel Orientation="Vertical">
                    <TextBlock Text=''🎬 Watch demo'' FontSize=''20'' Margin=''0,18,0,30'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''ytv'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/thumbnail.jpg''/>
                    </Image.Source>
                </Image> 
<TextBlock Text='' • Keyboard Shortcuts'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+A: Clear category filter.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+F: Enter search mode.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+Q: Switch to Apps.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+W: Switch to Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+E: Switch to Settings.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+S: Install selected Apps/Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+S: Save selected.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+D: Load save file.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+M: Toggle music.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+P: Open Choco folder.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+Q: Restore point.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+I: ITT Shortcut.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+G: Close application.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
<TextBlock Text='' • ⚡ Quick Install Your Saved Apps'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''preview'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/47a321fb-6a8f-4d29-a9a4-bf69d82763a7''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''You can install your saved apps at any time using the command'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<Image x:Name=''preview2'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/2a4fedc7-1d0e-419d-940c-b784edc7d1d1''/>
                    </Image.Source>
                </Image> 
<TextBlock Text='' • 📥 Download any Youtube video'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''shell'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ShellTube/main/demo.jpg''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''Shelltube is simple way to downnload videos and playlist from youtube just Launch it and start download your video you can Launch it from Third-party section.'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text='' • 💡 A Secret Feature Awaits – Unlock It'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''esg'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/edb67270-d9d2-4e94-8873-1c822c3afe2f''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''Can You Find the Hidden Easter Egg? Open the source code and uncover the secret features waiting for you!'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text='' • ✊ Support Palestine - دعم فلسطين'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''ps'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/ps_flag.jpg''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''Do not hesitate to use your words and talk about Palestine In this age, where voices intertwine and humanitarian issues multiply, each of us has a role to play as an influential activist. Every post can reach someone who needs to hear this truth. Every message can be a source of inspiration or awareness for another person. Do not be afraid to express your opinions, for words are the tools through which we can build awareness and spread the truth. Make your platforms a space for dialogue, and be part of this movement toward positive change. Share stories, ideas, and news—everything you provide can be a step toward achieving justice. Together, we can be the voice for those who have no voice and work toward a fairer world. Let us unite and raise our voices in support of Palestine and to revive hope in the hearts of those who need it.'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text=''لا تتردد في استخدام كلمتك، وشارك في الحديث عن فلسطين، فصوتك قادر على إحداث التغيير في هذا العصر، حيث تتداخل الأصوات وتتزايد القضايا الإنسانية، يبرز دور كل واحد منا كناشط مؤثر. كل منشور يمكن أن يصل إلى شخص يحتاج إلى سماع هذه الحقيقة. كل رسالة يمكن أن تكون مصدر إلهام أو توعية لشخص آخر. لا تخف من التعبير عن آرائك، فالكلمات هي الأداة التي نستطيع من خلالها بناء الوعي ونشر الحقائق. اجعل منصاتك مساحة للحوار، وكن جزءًا من هذه الحركة نحو التغيير الإيجابي. شارك قصصًا، وأفكارًا، وأخبارًا، فكل ما تقدمه يمكن أن يكون خطوة نحو تحقيق العدالة. معًا، يمكننا أن نكون صوتًا لمن لا صوت لهم، وأن نعمل من أجل عالم أكثر عدلاً. فلنتحد ونرفع أصواتنا لنصرة فلسطين ولإحياء الأمل في قلوب من يحتاجونه.'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>

                </StackPanel>
            </ScrollViewer>
        </Grid>
        <Grid Row="2" Background="Transparent">
                <TextBlock 
                Name="DisablePopup" 
                Foreground="{DynamicResource TextColorSecondaryColor2}"
                Text="Show on update"
                Background="Transparent"
                TextAlignment="Center"
                Cursor="Hand"
                Padding="15"
                Visibility="Visible"
                HorizontalAlignment="Center"
                VerticalAlignment="Center"
                />
        </Grid>
    </Grid>
    </Border>
</Window>
'
#===========================================================================
#endregion End WPF Event Window
#===========================================================================
#===========================================================================
#region Begin loadXmal
#===========================================================================
# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS
# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt', $itt, $Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
# Add the variable to the session state
$InitialSessionState.Variables.Add($hashVars)


$desiredFunctions = @(
    'Install-App', 'Install-Winget', 'InvokeCommand', 'Add-Log', 'Disable-Service',
    'Uninstall-AppxPackage', 'Finish', 'Message', 'Notify', 'UpdateUI',
    'Native-Downloader', 'Install-Choco', 'ExecuteCommand', 'Set-Registry',
    'Set-Taskbar', 'Refresh-Explorer', 'Remove-ScheduledTasks'
)

$functionEntries = @(foreach ($func in (Get-ChildItem function:\ | Where-Object { $_.Name -in $desiredFunctions })) {
    New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $func.Name, (Get-Command $func.Name).ScriptBlock.ToString()
})

$functionEntries | ForEach-Object { $initialSessionState.Commands.Add($_) }

# debug start
    if ($Debug) { foreach ($entry in $functionEntries) { Write-Output "Added function: $($entry.Name)" } }
# debug end

# Create and open the runspace pool
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()

# Initialize Main window
try {
    [xml]$MainXaml = $MainWindowXaml
    $itt["window"] = [Windows.Markup.XamlReader]::Load([System.Xml.XmlNodeReader]$MainXaml)
}
catch {
    Write-Output "Error: $($_.Exception.Message)"
}
try {
    #===========================================================================
    #region Create default keys
    #===========================================================================
    $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]
    # Ensure registry key exists and set defaults if necessary
    if (-not (Test-Path $itt.registryPath)) {
        New-Item -Path $itt.registryPath -Force | Out-Null
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value 100 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "Runs" -Value 0 -Force
    }
    try {
        # Attempt to get existing registry values
        $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
        $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
        $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
        $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
        $itt.Runs = (Get-ItemProperty -Path $itt.registryPath -Name "Runs" -ErrorAction Stop).Runs
    }
    catch {
        # Creating missing registry keys
        # debug start
        if ($Debug) { Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug" }
        # debug end
        New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "Music" -Value 100 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "Runs" -Value 0 -PropertyType DWORD -Force *> $Null
    }
    #===========================================================================
    #endregion Create default keys
    #===========================================================================
    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
    try {
        $Locales = switch ($itt.Locales) {
            "default" {
                switch ($shortCulture) 
                {
                            
                "ar" {"ar"}        
                "de" {"de"}        
                "en" {"en"}        
                "es" {"es"}        
                "fr" {"fr"}        
                "ga" {"ga"}        
                "hi" {"hi"}        
                "it" {"it"}        
                "ko" {"ko"}        
                "ru" {"ru"}        
                "tr" {"tr"}        
                "zh" {"zh"}
                    default { "en" }
                }
            }
                    
                "ar" {"ar"}        
                "de" {"de"}        
                "en" {"en"}        
                "es" {"es"}        
                "fr" {"fr"}        
                "ga" {"ga"}        
                "hi" {"hi"}        
                "it" {"it"}        
                "ko" {"ko"}        
                "ru" {"ru"}        
                "tr" {"tr"}        
                "zh" {"zh"}
            default {"en"}
        }
        $itt["window"].DataContext = $itt.database.locales.Controls.$Locales
        $itt.Language = $Locales
    }
    catch {
        # fallbak to en lang
        $itt["window"].DataContext = $itt.database.locales.Controls.en
    }
    #===========================================================================
    #endregion Set Language based on culture
    #===========================================================================
    #===========================================================================
    #region Check theme settings
    #===========================================================================
    try {
        $Themes = switch ($itt.Theme) {
                            
            "Dark" {"Dark"}                
            "DarkKnight" {"DarkKnight"}                
            "Light" {"Light"}                
            "Palestine" {"Palestine"}
            default {
                switch ($appsTheme) {
                    "0" { 
                        "Dark"
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                    "1" { 
                        
                        "Light" 
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                }
            }
        }
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($Themes))
        $itt.Theme = $Themes
    }
    catch {
        # Fall back to default theme if there error
        $fallback = switch ($appsTheme) {
            "0" { "Dark" }
            "1" { "Light" }
        }
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
        $itt.Theme = $fallback
    }
    #===========================================================================
    #endregion Check theme settings
    #===========================================================================
    #===========================================================================
    #region Get user Settings from registry
    #===========================================================================
    # Check if Music is set to 100, then reset toggle state to false
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"
    if ($itt.Music -eq 0) {
        $global:toggleState = $false
    }
    else {
        $global:toggleState = $true
    }
    switch ($itt.Music) {
        "100" { $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔊" }
        "0" { $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔈" }
    }
    $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
    #===========================================================================
    #endregion Get user Settings from registry
    #===========================================================================
    # init taskbar icon
    $itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
    if (-not $Debug) { Set-Taskbar -progress "None" -icon "logo" }
}
catch {
    Write-Output "Error: $_"
}
# List Views
$itt.CurrentList
$itt.CurrentCategory
$itt.Search_placeholder = $itt["window"].FindName("search_placeholder")
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")
# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Quotes = $itt["window"].FindName("quotes")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")
$global:CheckedItems = @()


#===========================================================================
#endregion End loadXmal
#===========================================================================
#===========================================================================
#region Begin Main
#===========================================================================
#=========================================================================== 
#region Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 
foreach ($node in $MainXaml.SelectNodes("//*[@Name]")) {
    $name = $node.Name
    $element = $itt["window"].FindName($name)
    
    if ($element) {
        $itt[$name] = $element
        
        # Add event handlers based on element type
        switch ($element.GetType().Name) {
            "Button" {
                $element.Add_Click({ Invoke-Button $args[0].Name $args[0].Content })
            }
            "MenuItem" {
                $element.Add_Click({
                    Invoke-Button $args[0].Name -Content $args[0].Header
                })
            }
            "TextBox" {
                $element.Add_TextChanged({ Invoke-Button $args[0].Name $args[0].Text })
                $element.Add_GotFocus({ Invoke-Button $args[0].Name $args[0].Text })
            }
            "ComboBox" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Content })
            }
            "TabControl" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Name })
            }
            "CheckBox" {
                $element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
                $element.Add_Click({ Invoke-Toogle $args[0].Name })
            }
            "Listview" {
                $element.Add_PreviewMouseLeftButtonUp({ 
                    if ($itt.CurrentList -eq "appslist" -or $itt.CurrentList -eq "tweakslist") {
                        $selectedItem = $args[0].SelectedItem

                        if ($selectedItem) {
                            $checkBox = $selectedItem.Children[0].Children[0]  

                            if ($checkBox) {
                                $checkBox.IsChecked = -not $checkBox.IsChecked  

                                if (-not ($global:CheckedItems -is [System.Collections.ArrayList])) {
                                    $global:CheckedItems = New-Object System.Collections.ArrayList
                                }

                                if ($checkBox.IsChecked) {
                                    if (-not ($global:CheckedItems | Where-Object { $_.Content -eq $checkBox.Content })) {
                                        $null = $global:CheckedItems.Add(@{ Content = $checkBox.Content; IsChecked = $true })
                                        Write-Host "Added: $($checkBox.Content)"
                                    }
                                } else {
                                    $itemToRemove = $global:CheckedItems | Where-Object { $_.Content -eq $checkBox.Content }
                                    if ($itemToRemove) {
                                        [void]$global:CheckedItems.Remove($itemToRemove)
                                    }
                                }
                            }
                        }
                    }
                })
            }
        }
    }
}
#=========================================================================== 
#endregion Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 

# Define OnClosing event handler
$onClosingEvent = {
    param($s, $c)
    # Show confirmation message box
    $result = Message -title "Are you sure" -key "Exit_msg" -icon "ask" -action "YesNo"
    if ($result -eq "Yes") {
        Manage-Music -action "StopAll" 
    }
    else {
        $c.Cancel = $true
    }
}

# Attach event handlers and other operations
$itt["window"].Add_ContentRendered({
    Startup
    Show-Event
})

# Search input events
$itt.SearchInput.Add_GotFocus({
    $itt.Search_placeholder.Visibility = "Hidden"
})

$itt.SearchInput.Add_LostFocus({
    if ([string]::IsNullOrEmpty($itt.SearchInput.Text)) {
        $itt.Search_placeholder.Visibility = "Visible"
    }
})

# Quick install
if ($i) {
    Quick-Install -file $i *> $null
}

# Close event handler
$itt["window"].add_Closing($onClosingEvent)

# Keyboard shortcut
$itt["window"].Add_PreViewKeyDown($KeyEvents)

# Show Window
$itt["window"].ShowDialog() | Out-Null

# Dispose of runspaces and other objects
$itt.runspace.Dispose()
$itt.runspace.Close()

# Collect garbage
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Stop PowerShell session and release resources
$script:powershell.Dispose()
$script:powershell.Stop()

# Wait for new process to exit
$newProcess.Exit

# Stop transcript logging
Stop-Transcript *> $null
#===========================================================================
#endregion End Main
#===========================================================================
