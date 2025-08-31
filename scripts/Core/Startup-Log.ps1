function Startup {

    <#
    .SYNOPSIS
        Runs startup tasks including usage logging, music playback, and quote display.
    #>

    ITT-ScriptBlock -ArgumentList $Debug -ScriptBlock {
 
        param($Debug)
        
        function UsageCount {
            try {
                $Message = "👨‍💻 Build Ver: $($itt.lastupdate)`n🚀 URL: $($itt.command)`n👤 Username: $env:USERNAME`n🌐 Language: $($itt.Language)`n🔉 Music: $($itt.Music)"
                $EncodedMessage = [uri]::EscapeDataString($Message)
                $Url = "https://itt.emadadel4.workers.dev/log?text=$EncodedMessage"
                $result = Invoke-RestMethod -Uri $Url -Method GET
                Add-Log -Message "`n  $result times worldwide`n"
            }
            catch {
                Add-Log -Message "Unstable internet connection detected." -Level "info"
                Start-Sleep 8
                UsageCount
            }
        }
        function PlayMusic {
            $tracks = (Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/birthdayplaylist.m3u") -split "`n" | Where-Object { $_ -and ($_ -notmatch "^#") }
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