function Get-WinTeamsSettingsGuests {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )

    <#
    Identity               : Global
    AllowUserEditMessage   : True
    AllowUserDeleteMessage : True
    AllowUserChat          : True
    AllowGiphy             : True
    GiphyRatingType        : Moderate
    AllowMemes             : True
    AllowImmersiveReader   : True
    AllowStickers          : True
    #>

    if ($Tenant) {
        $CsTeamsGuestMessagingConfiguration = & "Get-$($prefix)CsTeamsGuestMessagingConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsGuestMessagingConfiguration = & "Get-$($prefix)CsTeamsGuestMessagingConfiguration" -Identity Global
    }

    <#
    Identity          : Global
    AllowIPVideo      : True
    ScreenSharingMode : EntireScreen
    AllowMeetNow      : True
    #>

    if ($Tenant) {
        $CsTeamsGuestMeetingConfiguration = & "Get-$($prefix)CsTeamsGuestMeetingConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsGuestMeetingConfiguration = & "Get-$($prefix)CsTeamsGuestMeetingConfiguration" -Identity Global
    }
    <#
    Identity            : Global
    AllowPrivateCalling : True
    #>
    if ($Tenant) {
        $CsTeamsGuestCallingConfiguration = & "Get-$($prefix)CsTeamsGuestCallingConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsGuestCallingConfiguration = & "Get-$($prefix)CsTeamsGuestCallingConfiguration" -Identity Global
    }




    if ($Formatted) {
        [ordered]@{
            'Allow User Edit Message'   = $CsTeamsGuestMessagingConfiguration.AllowUserEditMessage
            'Allow User Delete Message' = $CsTeamsGuestMessagingConfiguration.AllowUserDeleteMessage
            'Allow User Chat'          = $CsTeamsGuestMessagingConfiguration.AllowUserChat
            'Allow Giphy'              = $CsTeamsGuestMessagingConfiguration.AllowGiphy
            'Giphy Rating Type'        = Format-AddSpaceToSentence -Text $CsTeamsGuestMessagingConfiguration.GiphyRatingType
            'Allow Memes'              = $CsTeamsGuestMessagingConfiguration.AllowMemes
            'Allow Immersive Reader'   = $CsTeamsGuestMessagingConfiguration.AllowImmersiveReader
            'Allow Stickers'           = $CsTeamsGuestMessagingConfiguration.AllowStickers
            'Allow IPVideo'            = $CsTeamsGuestMeetingConfiguration.AllowIPVideo
            'Screen Sharing Mode'      = Format-AddSpaceToSentence -Text $CsTeamsGuestMeetingConfiguration.ScreenSharingMode
            'Allow MeetNow'            = $CsTeamsGuestMeetingConfiguration.AllowMeetNow
            'Allow Private Calling'    = $CsTeamsGuestCallingConfiguration.AllowPrivateCalling
        }
    } else {
        [ordered]@{
            AllowUserEditMessage   = $CsTeamsGuestMessagingConfiguration.AllowUserEditMessage
            AllowUserDeleteMessage = $CsTeamsGuestMessagingConfiguration.AllowUserDeleteMessage
            AllowUserChat          = $CsTeamsGuestMessagingConfiguration.AllowUserChat
            AllowGiphy             = $CsTeamsGuestMessagingConfiguration.AllowGiphy
            GiphyRatingType        = $CsTeamsGuestMessagingConfiguration.GiphyRatingType
            AllowMemes             = $CsTeamsGuestMessagingConfiguration.AllowMemes
            AllowImmersiveReader   = $CsTeamsGuestMessagingConfiguration.AllowImmersiveReader
            AllowStickers          = $CsTeamsGuestMessagingConfiguration.AllowStickers
            AllowIPVideo           = $CsTeamsGuestMeetingConfiguration.AllowIPVideo
            ScreenSharingMode      = $CsTeamsGuestMeetingConfiguration.ScreenSharingMode
            AllowMeetNow           = $CsTeamsGuestMeetingConfiguration.AllowMeetNow
            AllowPrivateCalling    = $CsTeamsGuestCallingConfiguration.AllowPrivateCalling
        }
    }
}