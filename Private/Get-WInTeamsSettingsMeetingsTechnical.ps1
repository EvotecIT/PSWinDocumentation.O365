function Get-WinTeamsSettingsMeetingsTechnical{
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
        Identity                    : Global
        LogoURL                     :
        LegalURL                    :
        HelpURL                     :
        CustomFooterText            :
        DisableAnonymousJoin        : False
        EnableQoS                   : False
        ClientAudioPort             : 50000
        ClientAudioPortRange        : 20
        ClientVideoPort             : 50020
        ClientVideoPortRange        : 20
        ClientAppSharingPort        : 50040
        ClientAppSharingPortRange   : 20
        ClientMediaPortRangeEnabled : True
    #>
    if ($Tenant) {
        $CsTeamsMeetingConfiguration = & "Get-$($prefix)CsTeamsMeetingConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsMeetingConfiguration = & "Get-$($prefix)CsTeamsMeetingConfiguration" -Identity Global
    }

    if ($Formatted) {
        [ordered]@{
            'Disable Anonymous Join'          = $CsTeamsMeetingConfiguration.DisableAnonymousJoin
            'Enable QoS'                      = $CsTeamsMeetingConfiguration.EnableQoS
            'Client Audio Port'               = $CsTeamsMeetingConfiguration.ClientAudioPort
            'Client Audio Port Range'         = $CsTeamsMeetingConfiguration.ClientAudioPortRange
            'Client Video Port'               = $CsTeamsMeetingConfiguration.ClientVideoPort
            'Client Video Port Range'         = $CsTeamsMeetingConfiguration.ClientVideoPortRange
            'Client AppSharing Port'          = $CsTeamsMeetingConfiguration.ClientAppSharingPort
            'Client AppSharing Port Range'    = $CsTeamsMeetingConfiguration.ClientAppSharingPortRange
            'Client Media Port Range Enabled' = $CsTeamsMeetingConfiguration.ClientMediaPortRangeEnabled
            'Logo URL'                        = $CsTeamsMeetingConfiguration.LogoURL
            'Legal URL'                       = $CsTeamsMeetingConfiguration.LegalURL
            'Help URL'                        = $CsTeamsMeetingConfiguration.HelpURL
            'Custom Footer Text'              = $CsTeamsMeetingConfiguration.CustomFooterText
        }
    } else {
        [ordered]@{
            DisableAnonymousJoin        = $CsTeamsMeetingConfiguration.DisableAnonymousJoin
            EnableQoS                   = $CsTeamsMeetingConfiguration.EnableQoS
            ClientAudioPort             = $CsTeamsMeetingConfiguration.ClientAudioPort
            ClientAudioPortRange        = $CsTeamsMeetingConfiguration.ClientAudioPortRange
            ClientVideoPort             = $CsTeamsMeetingConfiguration.ClientVideoPort
            ClientVideoPortRange        = $CsTeamsMeetingConfiguration.ClientVideoPortRange
            ClientAppSharingPort        = $CsTeamsMeetingConfiguration.ClientAppSharingPort
            ClientAppSharingPortRange   = $CsTeamsMeetingConfiguration.ClientAppSharingPortRange
            ClientMediaPortRangeEnabled = $CsTeamsMeetingConfiguration.ClientMediaPortRangeEnabled
            LogoURL                     = $CsTeamsMeetingConfiguration.LogoURL
            LegalURL                    = $CsTeamsMeetingConfiguration.LegalURL
            HelpURL                     = $CsTeamsMeetingConfiguration.HelpURL
            CustomFooterText            = $CsTeamsMeetingConfiguration.CustomFooterText
        }
    }
}