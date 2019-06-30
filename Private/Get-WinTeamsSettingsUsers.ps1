function Get-WinTeamsSettingsUsers {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
        Identity                      : Global
        Description                   :
        AllowUrlPreviews              : True
        AllowOwnerDeleteMessage       : True
        AllowUserEditMessage          : True
        AllowUserDeleteMessage        : True
        AllowUserChat                 : True
        AllowRemoveUser               : True
        AllowGiphy                    : True
        GiphyRatingType               : Moderate
        AllowMemes                    : True
        AllowImmersiveReader          : True
        AllowStickers                 : True
        AllowUserTranslation          : False
        ReadReceiptsEnabledType       : UserPreference
        AllowPriorityMessages         : True
        ChannelsInChatListEnabledType : DisabledUserOverride
        AudioMessageEnabledType       : ChatsAndChannels
    #>
    if ($Tenant) {
        $CsTeamsMessagingPolicy = & "Get-$($prefix)CsTeamsMessagingPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsMessagingPolicy = & "Get-$($prefix)CsTeamsMessagingPolicy" -Identity Global
    }

    if ($Formatted) {
        [ordered]@{
            'Description'                        = $CsTeamsMessagingPolicy.Description
            'Allow Url Previews'                 = $CsTeamsMessagingPolicy.AllowUrlPreviews
            'Allow Owner Delete Message'         = $CsTeamsMessagingPolicy.AllowOwnerDeleteMessage
            'Allow User EditMessage'             = $CsTeamsMessagingPolicy.AllowUserEditMessage
            'Allow User DeleteMessage'           = $CsTeamsMessagingPolicy.AllowUserDeleteMessage
            'Allow User Chat'                    = $CsTeamsMessagingPolicy.AllowUserChat
            'Allow Remove User'                  = $CsTeamsMessagingPolicy.AllowRemoveUser
            'Allow Giphy'                        = $CsTeamsMessagingPolicy.AllowGiphy
            'Giphy Rating Type'                  = $CsTeamsMessagingPolicy.GiphyRatingType
            'Allow Memes'                        = $CsTeamsMessagingPolicy.AllowMemes
            'Allow Immersive Reader'             = $CsTeamsMessagingPolicy.AllowImmersiveReader
            'Allow Stickers'                     = $CsTeamsMessagingPolicy.AllowStickers
            'Allow User Translation'             = $CsTeamsMessagingPolicy.AllowUserTranslation
            'Read Receipts Enabled Type'         = Format-AddSpaceToSentence -Text $CsTeamsMessagingPolicy.ReadReceiptsEnabledType
            'Allow Priority Messages'            = $CsTeamsMessagingPolicy.AllowPriorityMessages
            'Channels In Chat List Enabled Type' = Format-AddSpaceToSentence -Text $CsTeamsMessagingPolicy.ChannelsInChatListEnabledType
            'Audio Message Enabled Type'         = Format-AddSpaceToSentence -Text $CsTeamsMessagingPolicy.AudioMessageEnabledType
        }
    } else {
        [ordered]@{
            Description                   = $CsTeamsMessagingPolicy.Description
            AllowUrlPreviews              = $CsTeamsMessagingPolicy.AllowUrlPreviews
            AllowOwnerDeleteMessage       = $CsTeamsMessagingPolicy.AllowOwnerDeleteMessage
            AllowUserEditMessage          = $CsTeamsMessagingPolicy.AllowUserEditMessage
            AllowUserDeleteMessage        = $CsTeamsMessagingPolicy.AllowUserDeleteMessage
            AllowUserChat                 = $CsTeamsMessagingPolicy.AllowUserChat
            AllowRemoveUser               = $CsTeamsMessagingPolicy.AllowRemoveUser
            AllowGiphy                    = $CsTeamsMessagingPolicy.AllowGiphy
            GiphyRatingType               = $CsTeamsMessagingPolicy.GiphyRatingType
            AllowMemes                    = $CsTeamsMessagingPolicy.AllowMemes
            AllowImmersiveReader          = $CsTeamsMessagingPolicy.AllowImmersiveReader
            AllowStickers                 = $CsTeamsMessagingPolicy.AllowStickers
            AllowUserTranslation          = $CsTeamsMessagingPolicy.AllowUserTranslation
            ReadReceiptsEnabledType       = $CsTeamsMessagingPolicy.ReadReceiptsEnabledType
            AllowPriorityMessages         = $CsTeamsMessagingPolicy.AllowPriorityMessages
            ChannelsInChatListEnabledType = $CsTeamsMessagingPolicy.ChannelsInChatListEnabledType
            AudioMessageEnabledType       = $CsTeamsMessagingPolicy.AudioMessageEnabledType
        }
    }
}