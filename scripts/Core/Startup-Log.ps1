function Startup  {
    Invoke-ScriptBlock -ArgumentList $Debug -ScriptBlock {
        param($Debug)
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
                $SendMessageUrl = "https://api.telegram.org/bot$BotToken/sendMessage"
                $PostBody = @{
                    chat_id    = $ChatID
                    text       = $Message
                }
                $Response = Invoke-RestMethod -Uri $SendMessageUrl -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
            }
            catch {
                #Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
        function PlayMusic {
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
                # Play Favorite Music in Special Date
                if ($itt.Date.Month -eq 9 -and $itt.Date.Day -eq 1) {
                    return $itt.database.OST.Favorite | Get-Random -Count $itt.database.OST.Favorite.Count
                }elseif($itt.Date.Month -eq 10 -and $itt.Date.Day -eq 6 -or $itt.Date.Day -eq 7)
                {
                    return $itt.database.OST.Otobers | Get-Random -Count $itt.database.OST.Otobers.Count
                }
                else
                {
                    return $itt.database.OST.Tracks | Get-Random -Count $itt.database.OST.Tracks.Count
                }
            }
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                # Preload the shuffled playlist
                $shuffledTracks = GetShuffledTracks
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track.url
                    # Wait for the track to finish playing
                    while ($itt.mediaPlayer.playState -in 3, 6) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
            # Play the preloaded playlist
            PlayPreloadedPlaylist
        }
        function Quotes {
            # Define the JSON file path
            $jsonFilePath = $itt.database.Quotes
            # Function to shuffle an array
            function ShuffleArray {
                param (
                    [array]$Array
                )
                $count = $Array.Count
                for ($i = $count - 1; $i -ge 0; $i--) {
                    $randomIndex = Get-Random -Minimum 0 -Maximum $count
                    $temp = $Array[$i]
                    $Array[$i] = $Array[$randomIndex]
                    $Array[$randomIndex] = $temp
                }
                return $Array
            }
            # Function to get quotes from the JSON file
            function Get-QuotesFromJson {
                $jsonContent = $jsonFilePath
                return $jsonContent.Quotes
            }
            # Get shuffled quotes
            $shuffledQuotes = ShuffleArray -Array (Get-QuotesFromJson)
            # Function to display welcome text
            function Show-WelcomeText {
                $itt.Quotes.Dispatcher.Invoke([Action]{
                    $itt.QuoteIcon.Text = ""
                    $itt.Quotes.Text = $itt.database.locales.Controls.$($itt.Language).welcome
                })
            }
            # Display welcome text
            Show-WelcomeText
            Start-Sleep -Seconds 28
            # Loop through shuffled quotes and display them
            do {
                foreach ($quote in $shuffledQuotes) {
                    $itt.Quotes.Dispatcher.Invoke([Action]{
                        # Display icon based on the 'type' of the quote
                        switch ($quote.type) {
                            "quote" { 
                                $itt.QuoteIcon.Text = ""  
                            }
                            "info" { 
                                $itt.QuoteIcon.Text = ""
                            }
                            "music" {
                                $itt.QuoteIcon.Text = ""
                            }
                            "Cautton"
                            {
                                $itt.QuoteIcon.Text = ""
                            }
                            Default {
                                $itt.QuoteIcon.Text = ""
                            }
                        }
                        # Check if the quote has a 'name' field, else use just the 'text'
                        $quoteText = if ($quote.name) {
                            "`“$($quote.text)`” ― $($quote.name)"
                        } else {
                            "`“$($quote.text)`”"
                        }
                        # Display the quote text
                        $itt.Quotes.Text = $quoteText
                    })
                    # sleep time 
                    Start-Sleep -Seconds 18 
                }
            } while ($true)
        }
        function Get-UsersCount {

            Write-Host "`n ITT is being used on devices worldwide.`n" -ForegroundColor White

            # Get the current value of the key
            $currentValue = (Get-ItemProperty -Path $itt.registryPath -Name "Runs" -ErrorAction SilentlyContinue).Runs

            # Increment the value by 1
            $newValue = [int]$currentValue + 1

            # Set the new value in the registry
            Set-ItemProperty -Path $itt.registryPath -Name "Runs" -Value $newValue

            # Check if the value is greater than 1
            if ($newValue -gt 1) {
                Telegram -Message "👤 User <<$env:USERNAME>> has opened ITT again.`n`⚙️ Runs: $newValue times`n`🎶 Music is $($itt.Music)%`n`🎨 Theme: $($itt.CurretTheme)`n`🌐 Language: $($itt.Language)`n`📃 Popup window: $($itt.PopupWindow)"
            } else {
                Telegram -Message "🎉 👤 A new user <<$env:USERNAME>> is now running ITT`n`🌐 Language $($itt.Language)"
            }
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
            Write-Host " Telegram: https://t.me/ittemadadel_bot" 
            Write-Host " Discord: https://discord.gg/63m34EE6mX `n` "
            Get-UsersCount
        }
        # debug start
            if($Debug){return}
        # debug end
        LOG
        PlayMusic
        Quotes
    }
}