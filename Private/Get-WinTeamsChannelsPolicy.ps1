function Get-WinTeamsChannelsPolicy {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
    XsAnyElements               :
    XsAnyAttributes             :
    PSComputerName              : admin1e.online.lync.com
    RunspaceId                  : ab26fd46-85ab-4838-bd35-6ffa005f46db
    PSShowComputerName          : False
    Description                 :
    AllowOrgWideTeamCreation    : True
    AllowPrivateTeamDiscovery   : True
    AllowPrivateChannelCreation : True
    DataSource                  : CMS
    Key                         : [{urn:schema:Microsoft.Rtc.Management.Policy.Teams.2017}TeamsChannelsPolicy,Tenant{ceb371f6-8745-4876-a040-69f2d10a9d1a},Global]
    ScopeClass                  : Global
    Anchor                      : Microsoft.Rtc.Management.ScopeFramework.GlobalScopeAnchor
    Identity                    : Global
    TypedIdentity               : Global
    Element                     : <TeamsChannelsPolicy xmlns="urn:schema:Microsoft.Rtc.Management.Policy.Teams.2017" AllowOrgWideTeamCreation="true" AllowPrivateTeamDiscovery="true" AllowPrivateChannelCreation="true" />

    XsAnyElements               :
    XsAnyAttributes             :
    PSComputerName              : admin1e.online.lync.com
    RunspaceId                  : ab26fd46-85ab-4838-bd35-6ffa005f46db
    PSShowComputerName          : False
    Description                 :
    AllowOrgWideTeamCreation    : True
    AllowPrivateTeamDiscovery   : True
    AllowPrivateChannelCreation : True
    DataSource                  : CMS
    Key                         : [{urn:schema:Microsoft.Rtc.Management.Policy.Teams.2017}TeamsChannelsPolicy,Host{00000000-0000-0000-0000-000000000000},Tag]
    ScopeClass                  : Tag
    Anchor                      : (1) Default
    Identity                    : Tag:Default
    TypedIdentity               : Tag:Default
    Element                     : <TeamsChannelsPolicy xmlns="urn:schema:Microsoft.Rtc.Management.Policy.Teams.2017" AllowOrgWideTeamCreation="true" AllowPrivateTeamDiscovery="true" AllowPrivateChannelCreation="true" />

    #>

    if ($Tenant) {
        #$ChannelsPolicy = Get-CsTeamsChannelsPolicy -Tenant $Tenant
        $ChannelsPolicy = & "Get-$($prefix)CsTeamsChannelsPolicy" -Tenant $Tenant -Identity Global
    } else {
        $ChannelsPolicy = & "Get-$($prefix)CsTeamsChannelsPolicy" -Identity Global
    }
    foreach ($_ in $ChannelsPolicy) {
        if ($Formatted) {
            [PSCustomObject]@{
                'Allow Teams Creation'           = $_.AllowOrgWideTeamCreation
                'Allow Private Team Discovery'   = $_.AllowPrivateTeamDiscovery
                'Allow Private Channel Creation' = $_.AllowPrivateChannelCreation
                'Scope Class'                    = $_.ScopeClass
                'Identity'                       = $_.Identity
                'Description'                    = $_.Description
            }
        } else {
            [PSCustomObject]@{
                AllowOrgWideTeamCreation    = $_.AllowOrgWideTeamCreation
                AllowPrivateTeamDiscovery   = $_.AllowPrivateTeamDiscovery
                AllowPrivateChannelCreation = $_.AllowPrivateChannelCreation
                ScopeClass                  = $_.ScopeClass
                Identity                    = $_.Identity
                Description                 = $_.Description
            }
        }
    }
}
