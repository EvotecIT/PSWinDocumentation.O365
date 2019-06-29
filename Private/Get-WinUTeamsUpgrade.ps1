function Get-WinUTeamsUpgrade {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
        Identity         : Global
        DownloadTeams    : True
        SfBMeetingJoinUx : SkypeMeetingsApp
    #>
    if ($Tenant) {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsUpgradeConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsUpgradeConfiguration" -Identity Global
    }
    return $TeamsConfiguration
}