function Startup {

 
    ITT-ScriptBlock -ArgumentList $Debug -ScriptBlock {
 
        param($Debug)
        function Telegram {
            param (
                [string]$Message
            )
            try {
                # Counts
                $EncodedMessage = [uri]::EscapeDataString($Message)
                $Url = "https://itt.emadadel4.workers.dev/log?text=$EncodedMessage"
                Invoke-RestMethod -Uri $Url -Method GET
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
        function UsageCount {

            try {
                # Output success
                Telegram -Message "👨‍💻 Build Ver: $($itt.lastupdate)`n🚀 URL: $($itt.command)`n🌐 Language: $($itt.Language)"
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "INFO"
            }
        }
        function PlayMusic {

            # Download and parse the M3U playlist
            $playlistUrl = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/update/static/Database/ittplaylist.m3u"
            $m3uContent = Invoke-RestMethod -Uri $playlistUrl -Method Get
        
            # Extract valid track URLs (ignoring lines starting with #)
            $tracks = $m3uContent -split "`n" | Where-Object { $_ -and ($_ -notmatch "^#") }
        
            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()
        
                # debug start
                    # $currentFileName = $itt.mediaPlayer.currentMedia.name
                    # Write-Host "Currently playing: $currentFileName"
                # debug end
            }
        
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
                return $tracks | Get-Random -Count $tracks.Count
            }
        
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                $shuffledTracks = GetShuffledTracks
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track
                    while ($itt.mediaPlayer.playState -in @(3, 6)) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
        
            PlayPreloadedPlaylist
        }
        function Quotes {
            function Get-Quotes {(Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }}
            
            function Show-Quote($text, $icon) {}
        
            Set-Statusbar -Text "☕ $($itt.database.locales.Controls.$($itt.Language).welcome)"
            Start-Sleep 18
            Set-Statusbar -Text "👁‍🗨 $($itt.database.locales.Controls.$($itt.Language).easter_egg)"
            Start-Sleep 18
            $iconMap = @{quote = "💬"; info = "📢"; music = "🎵"; Cautton = "⚠"; default = "☕" }
            do {
                foreach ($q in Get-Quotes) {
                    $icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
                    $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
                    Set-Statusbar -Text "$icon $text"
                    Start-Sleep 25
                }
            } while ($true)
        }
        function LOG {
            Write-Host "  `n` "
            Write-Host "  ███████████████████╗ Be the first to uncover the secret! Dive into"
            Write-Host "  ██╚══██╔══╚═══██╔══╝ the source code, find the feature and integrate it"
            Write-Host "  ██║  ██║ Emad ██║    https://github.com/emadadel4/itt"
            Write-Host "  ██║  ██║ Adel ██║    "
            Write-Host "  ██║  ██║      ██║    "
            Write-Host "  ╚═╝  ╚═╝      ╚═╝    "
            UsageCount
        }
        # debug start
        if ($Debug) { return }
        # debug end
        LOG
        PlayMusic
        Quotes
    }
}