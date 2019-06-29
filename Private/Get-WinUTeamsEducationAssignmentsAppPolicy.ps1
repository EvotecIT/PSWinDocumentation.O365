function Get-WinUTeamsMeetingConfiguration {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
    Identity                : Global
    ParentDigestEnabledType : Disabled
    MakeCodeEnabledType     : Disabled
    TurnItInEnabledType     : Disabled
    TurnItInApiUrl          :
    TurnItInApiKey          :

    #>
    if ($Tenant) {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsEducationAssignmentsAppPolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsEducationAssignmentsAppPolicy" -Identity Global
    }
    return $TeamsConfiguration
}