function Get-WInTeamsSettingsBroadcasting {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
        Identity                        : Global
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

    if ($Formatted) {
        [ordered]@{
            'Allow Broadcast Scheduling'              = $CsTeamsMeetingBroadcastPolicy.AllowBroadcastScheduling
            'Allow Broadcast Transcription'           = $CsTeamsMeetingBroadcastPolicy.AllowBroadcastTranscription
            'Allow Sdn Provider For BroadcastMeeting' = $CsTeamsMeetingBroadcastConfiguration.AllowSdnProviderForBroadcastMeeting
            'Broadcast Attendee Visibility Mode'      = Format-AddSpaceToSentence -Text $CsTeamsMeetingBroadcastPolicy.BroadcastAttendeeVisibilityMode
            'Broadcast Recording Mode'                = Format-AddSpaceToSentence -Text $CsTeamsMeetingBroadcastPolicy.BroadcastRecordingMode
            #SupportURL                          = $CsTeamsMeetingBroadcastConfiguration.SupportURL
            'Description'                             = $CsTeamsMeetingBroadcastPolicy.Description
        }
    } else {
        [ordered]@{
            AllowBroadcastScheduling            = $CsTeamsMeetingBroadcastPolicy.AllowBroadcastScheduling
            AllowBroadcastTranscription         = $CsTeamsMeetingBroadcastPolicy.AllowBroadcastTranscription
            AllowSdnProviderForBroadcastMeeting = $CsTeamsMeetingBroadcastConfiguration.AllowSdnProviderForBroadcastMeeting
            BroadcastAttendeeVisibilityMode     = $CsTeamsMeetingBroadcastPolicy.BroadcastAttendeeVisibilityMode
            BroadcastRecordingMode              = $CsTeamsMeetingBroadcastPolicy.BroadcastRecordingMode
            #SupportURL                          = $CsTeamsMeetingBroadcastConfiguration.SupportURL
            Description                         = $CsTeamsMeetingBroadcastPolicy.Description
        }
    }
}


