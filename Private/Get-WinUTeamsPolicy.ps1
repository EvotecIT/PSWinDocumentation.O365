function Get-WinUTeamsPolicy {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
        Identity       : Global
        Description    : Use Teams Only
        Mode           : TeamsOnly
        NotifySfbUsers : False

        Identity       : Tag:UpgradeToTeams
        Description    : Use Teams Only
        Mode           : TeamsOnly
        NotifySfbUsers : False

        Identity       : Tag:Islands
        Description    : Use either Skype for Business client or Teams client
        Mode           : Islands
        NotifySfbUsers : False

        Identity       : Tag:IslandsWithNotify
        Description    : Use either Skype for Business client or Teams client
        Mode           : Islands
        NotifySfbUsers : True

        Identity       : Tag:SfBOnly
        Description    : Use only Skype for Business
        Mode           : SfBOnly
        NotifySfbUsers : False

        Identity       : Tag:SfBOnlyWithNotify
        Description    : Use only Skype for Business
        Mode           : SfBOnly
        NotifySfbUsers : True

        Identity       : Tag:SfBWithTeamsCollab
        Description    : Use Skype for Business and use Teams only for group collaboration
        Mode           : SfBWithTeamsCollab
        NotifySfbUsers : False

        Identity       : Tag:SfBWithTeamsCollabWithNotify
        Description    : Use Skype for Business and use Teams only for group collaboration
        Mode           : SfBWithTeamsCollab
        NotifySfbUsers : True

        Identity       : Tag:SfBWithTeamsCollabAndMeetings
        Description    : Use Skype for Business for messaging and calling. Use Teams for group collaboration and meeting scheduling
        Mode           : SfBWithTeamsCollabAndMeetings
        NotifySfbUsers : False

        Identity       : Tag:SfBWithTeamsCollabAndMeetingsWithNotify
        Description    : Use Skype for Business for messaging and calling. Use Teams for group collaboration and meeting scheduling
        Mode           : SfBWithTeamsCollabAndMeetings
        NotifySfbUsers : True
    #>
    if ($Tenant) {
        $TeamsConfiguration = & "Get-$($prefix)TeamsUpgradePolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)TeamsUpgradePolicy" -Identity Global
    }
    return $TeamsConfiguration
}