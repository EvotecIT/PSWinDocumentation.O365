function Get-WinTeamsSettingsUpgrade {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
        Identity       : Global
        Description    : Use Teams Only
        Mode           : TeamsOnly
        NotifySfbUsers : False
    #>
    if ($Tenant) {
        $TeamsUpgradePolicy = & "Get-$($prefix)CsTeamsUpgradePolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsUpgradePolicy = & "Get-$($prefix)CsTeamsUpgradePolicy" -Identity Global
    }
    <#
        Identity         : Global
        DownloadTeams    : True
        SfBMeetingJoinUx : SkypeMeetingsApp
    #>
    if ($Tenant) {
        $CsTeamsUpgradeConfiguration = & "Get-$($prefix)CsTeamsUpgradeConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsUpgradeConfiguration = & "Get-$($prefix)CsTeamsUpgradeConfiguration" -Identity Global
    }

    if ($Formatted) {
        [ordered]@{
            'Description'           = $TeamsUpgradePolicy.Description
            'Mode'                  = Format-AddSpaceToSentence -Text $TeamsUpgradePolicy.Mode
            'Notify Skype Users'    = $TeamsUpgradePolicy.NotifySfbUsers
            'Download Teams'        = $CsTeamsUpgradeConfiguration.DownloadTeams
            'Skype Meeting Join Ux' = Format-AddSpaceToSentence -Text $CsTeamsUpgradeConfiguration.SfBMeetingJoinUx
        }
    } else {
        [ordered]@{
            Description      = $TeamsUpgradePolicy.Description
            Mode             = $TeamsUpgradePolicy.Mode
            NotifySfbUsers   = $TeamsUpgradePolicy.NotifySfbUsers
            DownloadTeams    = $CsTeamsUpgradeConfiguration.DownloadTeams
            SfBMeetingJoinUx = $CsTeamsUpgradeConfiguration.SfBMeetingJoinUx
        }
    }
}