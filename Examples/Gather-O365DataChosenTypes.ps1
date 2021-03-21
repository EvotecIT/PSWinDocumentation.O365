Import-Module .\PSWinDocumentation.O365.psd1 -Force

$TypesRequired = @(
    'AzureADUsers'
    'AzureADGuests'
    'AzureLicensing'
    'AzureRolesActiveOnly'
    'AzureRolesMembers'
    'AzureSubscription'
    'AzureTenantDomains'
    'AzureCompany'
    'AzureSynchronizationSetings'
    'AzurePasswordPolicy'

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

$O365 = Get-WinO365 -Formatted -Verbose -TypesRequired $TypesRequired
$O365