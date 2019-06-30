#Import-Module .\PSWinDocumentation.O365.psd1 -Force

#Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service AzureAD, MSOnline, ExchangeOnline, Teams, SkypeOnline

#if (-not $O365) {
#$O365 = Get-WinO365 -Formatted -Verbose
#}

Dashboard -Name 'O365 Dashboard' -FilePath $PSScriptRoot\Output\Dashboard.html {
    Tab -Name 'Teams' -IconBrands the-red-yeti {
        Section -Invisible {
            Section -Name 'Teams Settings' {
                Table -DataTable $O365.TeamsSettings -Filtering {
                    #TableHeader -Title 'Teams Settings' -Color Black -BackGroundColor Gray
                }
            }
            Section -Name 'Teams File Sharing' {
                Table -DataTable $O365.TeamsSettingsFileSharing -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Teams Settings for Channel' {
                Table -DataTable $O365.TeamsSettingsChannels -Filtering
            }
            Section -Name 'Teams Settings for Guests' {
                Table -DataTable $O365.TeamsSettingsGuests -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Teams Upgrade Options' {
                Table -DataTable $O365.TeamsSettingsUpgrade -Filtering
            }
            Section -Name 'Teams Settings for Users' {
                Table -DataTable $O365.TeamsSettingsUsers -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Teams Broadcasting' {
                Table -DataTable $O365.TeamsSettingsBroadcasting -Filtering
            }
            Section -Name 'Teams Calling' {
                Table -DataTable $O365.TeamsSettingsCalling -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Teams Meetings' {
                Table -DataTable $O365.TeamsSettingsMeetings -Filtering
            }
            Section -Name 'Teams Meetings Technical' {
                Table -DataTable $O365.TeamsSettingsMeetingsTechnical -Filtering
            }
        }
    }
} -Show