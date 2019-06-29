function Get-WinUTeamsMeetingConfiguration {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
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
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMeetingConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMeetingConfiguration" -Identity Global
    }
    return $TeamsConfiguration
}