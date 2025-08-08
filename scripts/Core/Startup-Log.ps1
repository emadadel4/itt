function Startup {

    <#
    .SYNOPSIS
        Runs startup tasks including usage logging, music playback, and quote display.
    #>

    ITT-ScriptBlock -ArgumentList $Debug -ScriptBlock {
 
        param($Debug)
        
        function UsageCount {
             try {
                $Message = "👨‍💻 Build Ver: $($itt.lastupdate)`n🚀 URL: $($itt.command)`n👤 Username: $env:USERNAME`n🌐 Language: $($itt.Language)"
                $body = @{ text = $Message } | ConvertTo-Json
                $result = Invoke-RestMethod -Uri "https://itt.emadadel4.workers.dev/log" -Method POST -Body $body -ContentType "application/json"
                Add-Log -Message "`n  $result times worldwide"
            }
            catch {
                Add-Log -Message "Your internet connection is not stable" -Level "info"
            }
        }
        function PlayMusic {
            $playlistUrl = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/ittplaylist.m3u"
            $m3uContent = Invoke-RestMethod -Uri $playlistUrl -Method Get
            $tracks = $m3uContent -split "`n" | Where-Object { $_ -and ($_ -notmatch "^#") }
            $shuffledTracks = $tracks | Get-Random -Count $tracks.Count
        
            foreach ($track in $shuffledTracks) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()
                while ($itt.mediaPlayer.playState -in 3,6) {
                    Start-Sleep -Milliseconds 100
                }
            }
        }
        function Quotes {
            $q=(Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes|Sort-Object {Get-Random}
            Set-Statusbar -Text "☕ $($itt.database.locales.Controls.$($itt.Language).welcome)"; Start-Sleep 18
            Set-Statusbar -Text "👁‍🗨 $($itt.database.locales.Controls.$($itt.Language).easter_egg)"; Start-Sleep 18
            $i=@{quote="💬";info="📢";music="🎵";Cautton="⚠";default="☕"}
            while(1){foreach($x in $q){$c=$i[$x.type];if(-not $c){$c=$i.default};$t="`“$($x.text)`”";if($x.name){$t+=" ― $($x.name)"};Set-Statusbar -Text "$c $t";Start-Sleep 25}}
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