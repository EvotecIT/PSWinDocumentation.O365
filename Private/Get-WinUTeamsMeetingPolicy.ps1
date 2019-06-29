function Get-WinUTeamsMeetingPolicy {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
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

        Identity                                   : Tag:AllOn
        Description                                : Do not assign. This policy is same as global defaults and would be deprecated
        AllowChannelMeetingScheduling              : True
        AllowMeetNow                               : True
        AllowPrivateMeetNow                        : True
        MeetingChatEnabledType                     : Enabled
        LiveCaptionsEnabledType                    : EnabledUserOverride
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

        Identity                                   : Tag:RestrictedAnonymousAccess
        Description                                : Do not assign. This policy is same as global defaults and would be deprecated
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

        Identity                                   : Tag:AllOff
        Description                                :
        AllowChannelMeetingScheduling              : False
        AllowMeetNow                               : False
        AllowPrivateMeetNow                        : False
        MeetingChatEnabledType                     : Disabled
        LiveCaptionsEnabledType                    : Disabled
        AllowIPVideo                               : False
        AllowAnonymousUsersToDialOut               : False
        AllowAnonymousUsersToStartMeeting          : False
        AllowPrivateMeetingScheduling              : False
        AutoAdmittedUsers                          : EveryoneInCompany
        AllowCloudRecording                        : False
        AllowOutlookAddIn                          : False
        AllowPowerPointSharing                     : False
        AllowParticipantGiveRequestControl         : False
        AllowExternalParticipantGiveRequestControl : False
        AllowSharedNotes                           : False
        AllowWhiteboard                            : False
        AllowTranscription                         : False
        MediaBitRateKb                             : 50000
        ScreenSharingMode                          : Disabled
        AllowPSTNUsersToBypassLobby                : False
        AllowOrganizersToOverrideLobbySettings     : False

        Identity                                   : Tag:RestrictedAnonymousNoRecording
        Description                                : Do not assign. This policy is similar to global defaults and would be deprecated
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
        AllowCloudRecording                        : False
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

        Identity                                   : Tag:Default
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

        Identity                                   : Tag:Kiosk
        Description                                :
        AllowChannelMeetingScheduling              : False
        AllowMeetNow                               : True
        AllowPrivateMeetNow                        : True
        MeetingChatEnabledType                     : Enabled
        LiveCaptionsEnabledType                    : Disabled
        AllowIPVideo                               : True
        AllowAnonymousUsersToDialOut               : False
        AllowAnonymousUsersToStartMeeting          : False
        AllowPrivateMeetingScheduling              : False
        AutoAdmittedUsers                          : EveryoneInCompany
        AllowCloudRecording                        : False
        AllowOutlookAddIn                          : False
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
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMeetingPolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMeetingPolicy" -Identity Global
    }
    return $TeamsConfiguration
}