function Get-WinO365ExchangeDistributionGroups {
    [CmdletBinding()]
    param(
        [Array] $O365UExchangeGroupsDistribution
    )
    $Output = foreach ($O365Group in $O365UExchangeGroupsDistribution) {
        # This creates new, cleaner groups list
        [PSCustomObject] @{
            "Group Name"                       = $O365Group.DisplayName
            "Group Owners"                     = $O365Group.ManagedBy -join ', '
            "Group Primary Email"              = $O365Group.PrimarySmtpAddress
            "Group Emails"                     = Convert-ExchangeEmail -Emails $O365Group.EmailAddresses -AddSeparator -RemoveDuplicates -RemovePrefix

            IsDirSynced                        = $O365Group.IsDirSynced
            MemberJoinRestriction              = $O365Group.MemberJoinRestriction
            MemberDepartRestriction            = $O365Group.MemberDepartRestriction

            GrantSendOnBehalfTo                = $O365Group.GrantSendOnBehalfTo
            MailTip                            = $O365Group.MailTip

            Identity                           = $O365Group.Identity
            SamAccountName                     = $O365Group.SamAccountName
            GroupType                          = $O365Group.GroupType
            WhenCreated                        = $O365Group.WhenCreated
            WhenChanged                        = $O365Group.WhenChanged

            Alias                              = $O365Group.Alias
            ModeratedBy                        = $O365Group.ModeratedBy
            ModerationEnabled                  = $O365Group.ModerationEnabled
            HiddenGroupMembershipEnabled       = $O365Group.HiddenGroupMembershipEnabled


            HiddenFromAddressListsEnabled      = $O365Group.HiddenFromAddressListsEnabled
            RequireSenderAuthenticationEnabled = $O365Group.RequireSenderAuthenticationEnabled
            RecipientTypeDetails               = $O365Group.RecipientTypeDetails
        }
    }
    $Output
}