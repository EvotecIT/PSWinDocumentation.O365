function Get-WinUTeamsMessagingPolicy {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
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

        Identity                      : Tag:Default
        Description                   :
        AllowUrlPreviews              : True
        AllowOwnerDeleteMessage       : False
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

        Identity                      : Tag:EduFaculty
        Description                   :
        AllowUrlPreviews              : True
        AllowOwnerDeleteMessage       : True
        AllowUserEditMessage          : True
        AllowUserDeleteMessage        : True
        AllowUserChat                 : True
        AllowRemoveUser               : True
        AllowGiphy                    : False
        GiphyRatingType               : Strict
        AllowMemes                    : True
        AllowImmersiveReader          : True
        AllowStickers                 : True
        AllowUserTranslation          : False
        ReadReceiptsEnabledType       : UserPreference
        AllowPriorityMessages         : True
        ChannelsInChatListEnabledType : DisabledUserOverride
        AudioMessageEnabledType       : ChatsAndChannels

        Identity                      : Tag:EduStudent
        Description                   :
        AllowUrlPreviews              : True
        AllowOwnerDeleteMessage       : False
        AllowUserEditMessage          : True
        AllowUserDeleteMessage        : True
        AllowUserChat                 : True
        AllowRemoveUser               : True
        AllowGiphy                    : False
        GiphyRatingType               : Strict
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
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMessagingPolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsMessagingPolicy" -Identity Global
    }
    return $TeamsConfiguration
}