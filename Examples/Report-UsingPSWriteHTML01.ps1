Import-Module .\PSWinDocumentation.O365.psd1 -Force

# Gather data first before running Dashboard
Dashboard -Name 'O365 Dashboard' -FilePath $PSScriptRoot\Output\Dashboard.html {
    SectionOption -BorderRadius 0px -RemoveShadow -HeaderBackGroundColor DarkGray
    TabOption -BorderRadius 0px -BackgroundColorActive DarkGray
    TableOption -DataStore JavaScript -ArrayJoin -ArrayJoinString ', '
    Tab -Name 'Azure AD' -IconBrands black-tie {
        Section -Invisible {
            Section -Name 'Azure Company' {
                Table -DataTable $O365.AzureCompany -Filtering {
                    #TableHeader -Title 'Teams Settings' -Color Black -BackGroundColor Gray
                }
            }
            Section -Name 'Azure Synchronization Settings' {
                Table -DataTable $O365.AzureSynchronizationSetings -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Empty' {
                #Table -DataTable $O365.AzureCompany -Filtering {

                #}
            }
            Section -Name 'Azure Password Policy' {
                Table -DataTable $O365.AzurePasswordPolicy -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Azure Licensing' {
                Table -DataTable $O365.AzureLicensing -Filtering {
                    #TableHeader -Title 'Teams Settings' -Color Black -BackGroundColor Gray
                }
            }
            Section -Name 'Azure Domains' {
                Table -DataTable $O365.AzureTenantDomains -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Active Management Roles' {
                Table -DataTable $O365.AzureRolesActiveOnly
            }
            Section -Name 'Active Management Roles Members' {
                Table -DataTable $O365.AzureRolesMembers -ResponsivePriorityOrder UserType -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Azure Users' {
                Table -DataTable $O365.AzureADUsers -Filtering
            }
        }
        Section -Invisible {
            Section -Name 'Azure Guests' {
                Table -DataTable $O365.AzureADGuests -Filtering
            }
        }
    }
    Tab -Name 'Microsoft Exchange' -IconBrands microsoft {
        Section -Invisible {
            Section -Name 'Accepted Domain' {
                Table -DataTable $O365.ExchangeAcceptedDomains -Filtering {
                    #TableHeader -Title 'Teams Settings' -Color Black -BackGroundColor Gray
                }
            }
            Section -Name 'Mx Records' {
                Table -DataTable $O365.ExchangeMxRecords -Filtering {
                    #TableHeader -Title 'Teams Settings' -Color Black -BackGroundColor Gray
                }
            }
            Section -Name 'Transport Config' {
                Table -DataTable $O365.ExchangeTransportConfig -Filtering {
                    TableHeader -Title 'Exchange Transport Config' -Color Black
                }
            }
        }
        Section -Invisible {
            Section -Name 'Inbound Connectors' {
                Table -DataTable $O365.ExchangeConnectorsInbound -Filtering {

                }
            }
            Section -Name 'Outbound Connectors' {
                Table -DataTable $O365.ExchangeConnectorsOutbound -Filtering {

                }
            }
        }
    }
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