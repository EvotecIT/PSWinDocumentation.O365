Import-Module .\PSWinDocumentation.O365.psd1 -Force

#Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service AzureAD, MSOnline, ExchangeOnline, Teams, SkypeOnline
#Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service SkypeOnline

#if (-not $O365) {
#$O365 = Get-WinO365 -Formatted -Verbose
#}


$TypesRequired = @(
    'AzureADUsers'
    'AzureADGuests'
    'AzureLicensing'
    'AzureRolesActiveOnly'
    'AzureRolesMembers'
    'AzureSubscription'
    'AzureTenantDomains'

    'ExchangeAcceptedDomains'
    'ExchangeConnectorsInbound'
    'ExchangeConnectorsOutbound'
    'ExchangeTransportConfig'

    'TeamsSettings'
    'TeamsSettingsBroadcasting'
    'TeamsSettingsCalling'
    'TeamsSettingsChannels'
    'TeamsSettingsEducationAppPolicy'
    'TeamsSettingsFileSharing'
    'TeamsSettingsGuests'
    'TeamsSettingsMeetings'
    'TeamsSettingsMeetingsTechnical'
    'TeamsSettingsUpgrade'
    'TeamsSettingsUsers'
)
$TypesRequired = @(
    'AzureADGroupMembers'
    'UAzureADGroups'
)

#$O365 = Get-WinO365 -Formatted -Verbose
$O365 = Get-WinO365 -Formatted -Verbose -TypesRequired $TypesRequired
$O365.UAzureADGroups | ft -a