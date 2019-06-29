function Get-WinUTeamsMeetingBroadcast {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
        Identity                        : Global
        Description                     :
        AllowBroadcastScheduling        : True
        AllowBroadcastTranscription     : False
        BroadcastAttendeeVisibilityMode : EveryoneInCompany
        BroadcastRecordingMode          : AlwaysEnabled

        Identity                        : Tag:Default
        Description                     :
        AllowBroadcastScheduling        : True
        AllowBroadcastTranscription     : False
        BroadcastAttendeeVisibilityMode : EveryoneInCompany
        BroadcastRecordingMode          : AlwaysEnabled
    #>
    if ($Tenant) {
        $CsTeamsMeetingBroadcastPolicy = & "Get-$($prefix)CsTeamsMeetingBroadcastPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsMeetingBroadcastPolicy = & "Get-$($prefix)CsTeamsMeetingBroadcastPolicy" -Identity Global
    }

    <#
        Identity                            : Global
        SupportURL                          : https://support.office.com/home/contact
        AllowSdnProviderForBroadcastMeeting : False
    #>

    if ($Tenant) {
        $CsTeamsMeetingBroadcastConfiguration = & "Get-$($prefix)CsTeamsMeetingBroadcastConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsMeetingBroadcastConfiguration = & "Get-$($prefix)CsTeamsMeetingBroadcastConfiguration" -Identity Global
    }


    return $TeamsConfiguration
}


