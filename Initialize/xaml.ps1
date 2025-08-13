#===========================================================================
#region initialize Runspace & Window
#===========================================================================

    # ================================
    # Configuration
    # ================================

    # Max threads = number of logical processors
    $MaxThreads = [int]$env:NUMBER_OF_PROCESSORS

    # Create a session state variable entry for sharing $itt across runspaces
    $HashVars = New-Object System.Management.Automation.Runspaces.SessionStateVariableEntry `
        -ArgumentList 'itt', $itt, $null

    # Create the initial session state
    $InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    $InitialSessionState.Variables.Add($HashVars)


    # ================================
    # Function Injection
    # ================================

    # List of functions to include in the runspace environment
    $Functions = @(
        'Install-App', 'Install-Dependencies', 'Add-Log',
        'Finish', 'Message', 'Notify', 'UpdateUI', 'ExecuteCommand', 'Set-Registry', 'Set-Taskbar',
        'Refresh-Explorer', 'CreateRestorePoint', 'Set-Statusbar'
    )

    foreach ($Func in $Functions) {
        $Command = Get-Command $Func -ErrorAction SilentlyContinue
        if ($Command) {
            $InitialSessionState.Commands.Add(
                (New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry `
                    $Command.Name, $Command.ScriptBlock.ToString())
            )
            
            # Debug output
            Write-Output "Added function: $Func"
        }
    }


    # ================================
    # UI Initialization
    # ================================

    try {
        [xml]$MainXaml = $MainWindowXaml
        $itt["window"] = [Windows.Markup.XamlReader]::Load(
            [System.Xml.XmlNodeReader]$MainXaml
        )
    }
    catch {
        Write-Output "Error initializing UI: $($_.Exception.Message)"
    }


    # ================================
    # Runspace Pool Creation
    # ================================

    $itt.Runspace = [RunspaceFactory]::CreateRunspacePool(
        1, $MaxThreads, $InitialSessionState, $Host
    )

    $itt.Runspace.Open()
#===========================================================================
#endregion initialize Runspace & Window
#===========================================================================
#===========================================================================
#region Create default keys
#===========================================================================
try {

    $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]
    # Ensure registry key exists and set defaults if necessary
    if (-not (Test-Path $itt.registryPath)) {
        New-Item -Path $itt.registryPath -Force | Out-Null
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -Force
    }
    try {
        # Attempt to get existing registry values
        $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
        $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
        $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
        $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
        $itt.backup = (Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup
        $itt.PackgeManager = (Get-ItemProperty -Path $itt.registryPath -Name "source" -ErrorAction Stop).source
    }
    catch {
        # Creating missing registry keys
        # debug start
        if ($Debug) { Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug" }
        # debug end
        New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -PropertyType String -Force *> $Null

    }
    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
    try {
        $Locales = switch ($itt.Locales) {
            "default" {
                switch ($shortCulture) {
                    #{LangagesSwitch}
                    default { "en" }
                }
            }
            #{LangagesSwitch}
            default { "en" }
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
            #{ThemesSwitch}
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
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"
    $itt["window"].title = "Install Tweaks Tool " + @("🔈", "🔊")[$itt.Music -eq 100]
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
#===========================================================================
#endregion Create default keys
#===========================================================================
#===========================================================================
#region Initialize WPF Controls
#===========================================================================

# List Views
$popup = $itt["window"].FindName("EventPopup")
$itt.CurrentList
$itt.CurrentCategory
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Statusbar = $itt["window"].FindName("statusbar")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")
#===========================================================================
#endregion Initialize WPF Controls
#===========================================================================
#===========================================================================
#region Fetch Data
#===========================================================================
$h = [System.Net.Http.HttpClientHandler]::new()
$h.AutomaticDecompression = [System.Net.DecompressionMethods] 'GZip,Deflate'
$c = [System.Net.Http.HttpClient]::new($h)

$appsUrl   = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Applications.json"
$tweaksUrl = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Tweaks.json"

while ($true) {
    try {
        Write-Host "Relax, good things are loading… almost there!" -ForegroundColor Yellow
        $aTask, $tTask = $c.GetStringAsync($appsUrl), $c.GetStringAsync($tweaksUrl)
        [Threading.Tasks.Task]::WaitAll($aTask, $tTask)

        $appsData   = $aTask.Result | ConvertFrom-Json
        $tweaksData = $tTask.Result | ConvertFrom-Json

        if ($appsData -and $tweaksData) {
            $itt.AppsListView.ItemsSource   = $appsData
            $itt.TweaksListView.ItemsSource = $tweaksData
            break
        }
        else {
            Write-Host "Still loading data..." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "Unstable internet connection detected. Retrying in 8 seconds..." -ForegroundColor Yellow
    }

    Start-Sleep 8
}
#===========================================================================
#endregion Fetch Data
#===========================================================================