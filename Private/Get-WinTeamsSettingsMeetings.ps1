function Get-WinTeamsSettingsMeetings {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
        Identity                                   : Global
        Description                                :
        AllowChannelMeetingScheduling              : True
        AllowMeetNow                               : True
        AllowPrivateMeetNow                        : True
        MeetingChatEnabledType                     : Enabled
        LiveCaptionsEnabledType                    : Disabled
        AllowIPVideo                               : True
        AllowAnonymousUsersToDialOut               : False
        AllowAnonymousUsersToStartMeeting          : False
        AllowPrivateMeetingScheduling              : True
        AutoAdmittedUsers                          : EveryoneInCompany
        AllowCloudRecording                        : True
        AllowOutlookAddIn                          : True
        AllowPowerPointSharing                     : True
        AllowParticipantGiveRequestControl         : True
        AllowExternalParticipantGiveRequestControl : False
        AllowSharedNotes                           : True
        AllowWhiteboard                            : True
        AllowTranscription                         : False
        MediaBitRateKb                             : 50000
        ScreenSharingMode                          : EntireScreen
        AllowPSTNUsersToBypassLobby                : False
        AllowOrganizersToOverrideLobbySettings     : False
    #>
    if ($Tenant) {
        $CsTeamsMeetingPolicy = & "Get-$($prefix)CsTeamsMeetingPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsMeetingPolicy = & "Get-$($prefix)CsTeamsMeetingPolicy" -Identity Global
    }

    if ($Formatted) {
        [ordered]@{
            'Allow Channel Meeting Scheduling'                = $CsTeamsMeetingPolicy.AllowChannelMeetingScheduling
            'Allow MeetNow'                                   = $CsTeamsMeetingPolicy.AllowMeetNow
            'Allow Private MeetNow'                           = $CsTeamsMeetingPolicy.AllowPrivateMeetNow
            'Meeting Chat Enabled Type'                       = $CsTeamsMeetingPolicy.MeetingChatEnabledType
            'Live Captions Enabled Type'                      = $CsTeamsMeetingPolicy.LiveCaptionsEnabledType
            'Allow IPVideo'                                   = $CsTeamsMeetingPolicy.AllowIPVideo
            'Allow Anonymous Users To DialOut'                = $CsTeamsMeetingPolicy.AllowAnonymousUsersToDialOut
            'Allow Anonymous Users To StartMeeting'           = $CsTeamsMeetingPolicy.AllowAnonymousUsersToStartMeeting
            'Allow Private Meeting Scheduling'                = $CsTeamsMeetingPolicy.AllowPrivateMeetingScheduling
            'Auto Admitted Users'                             = Format-AddSpaceToSentence -Text $CsTeamsMeetingPolicy.AutoAdmittedUsers
            'Allow Cloud Recording'                           = $CsTeamsMeetingPolicy.AllowCloudRecording
            'Allow Outlook AddIn'                             = $CsTeamsMeetingPolicy.AllowOutlookAddIn
            'Allow PowerPoint Sharing'                        = $CsTeamsMeetingPolicy.AllowPowerPointSharing
            'Allow Participant Give Request Control'          = $CsTeamsMeetingPolicy.AllowParticipantGiveRequestControl
            'Allow External Participant Give Request Control' = $CsTeamsMeetingPolicy.AllowExternalParticipantGiveRequestControl
            'Allow Shared Notes'                              = $CsTeamsMeetingPolicy.AllowSharedNotes
            'Allow Whiteboard'                                = $CsTeamsMeetingPolicy.AllowWhiteboard
            'Allow Transcription'                             = $CsTeamsMeetingPolicy.AllowTranscription
            'Media Bit RateKb'                                = $CsTeamsMeetingPolicy.MediaBitRateKb
            'Screen Sharing Mode'                             = Format-AddSpaceToSentence -Text $CsTeamsMeetingPolicy.ScreenSharingMode
            'Allow PSTN Users To Bypass Lobby'                = $CsTeamsMeetingPolicy.AllowPSTNUsersToBypassLobby
            'Allow Organizers To Override Lobby Settings'     = $CsTeamsMeetingPolicy.AllowOrganizersToOverrideLobbySettings
            'Description'                                     = $CsTeamsMeetingPolicy.Description
        }
    } else {
        [ordered]@{
            AllowChannelMeetingScheduling              = $CsTeamsMeetingPolicy.AllowChannelMeetingScheduling
            AllowMeetNow                               = $CsTeamsMeetingPolicy.AllowMeetNow
            AllowPrivateMeetNow                        = $CsTeamsMeetingPolicy.AllowPrivateMeetNow
            MeetingChatEnabledType                     = $CsTeamsMeetingPolicy.MeetingChatEnabledType
            LiveCaptionsEnabledType                    = $CsTeamsMeetingPolicy.LiveCaptionsEnabledType
            AllowIPVideo                               = $CsTeamsMeetingPolicy.AllowIPVideo
            AllowAnonymousUsersToDialOut               = $CsTeamsMeetingPolicy.AllowAnonymousUsersToDialOut
            AllowAnonymousUsersToStartMeeting          = $CsTeamsMeetingPolicy.AllowAnonymousUsersToStartMeeting
            AllowPrivateMeetingScheduling              = $CsTeamsMeetingPolicy.AllowPrivateMeetingScheduling
            AutoAdmittedUsers                          = $CsTeamsMeetingPolicy.AutoAdmittedUsers
            AllowCloudRecording                        = $CsTeamsMeetingPolicy.AllowCloudRecording
            AllowOutlookAddIn                          = $CsTeamsMeetingPolicy.AllowOutlookAddIn
            AllowPowerPointSharing                     = $CsTeamsMeetingPolicy.AllowPowerPointSharing
            AllowParticipantGiveRequestControl         = $CsTeamsMeetingPolicy.AllowParticipantGiveRequestControl
            AllowExternalParticipantGiveRequestControl = $CsTeamsMeetingPolicy.AllowExternalParticipantGiveRequestControl
            AllowSharedNotes                           = $CsTeamsMeetingPolicy.AllowSharedNotes
            AllowWhiteboard                            = $CsTeamsMeetingPolicy.AllowWhiteboard
            AllowTranscription                         = $CsTeamsMeetingPolicy.AllowTranscription
            MediaBitRateKb                             = $CsTeamsMeetingPolicy.MediaBitRateKb
            ScreenSharingMode                          = $CsTeamsMeetingPolicy.ScreenSharingMode
            AllowPSTNUsersToBypassLobby                = $CsTeamsMeetingPolicy.AllowPSTNUsersToBypassLobby
            AllowOrganizersToOverrideLobbySettings     = $CsTeamsMeetingPolicy.AllowOrganizersToOverrideLobbySettings
            Description                                = $CsTeamsMeetingPolicy.Description
        }
    }
}