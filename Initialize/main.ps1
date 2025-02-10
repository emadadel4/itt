﻿#=========================================================================== 
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

                                    if (-not $global:CheckedItems) {
                                        $global:CheckedItems = [System.Collections.ArrayList]::new()
                                    }

                                    if ($checkBox.IsChecked) 
                                    {
                                        if (-not ($global:CheckedItems | Where-Object { $_.Content -eq $checkBox.Content })) {
                                            $null = $global:CheckedItems.Add(@{ Content = $checkBox.Content; IsChecked = $true })
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