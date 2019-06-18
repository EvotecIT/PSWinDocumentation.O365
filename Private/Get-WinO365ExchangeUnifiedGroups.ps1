function Get-WinO365ExchangeUnifiedGroups {
    [CmdletBinding()]
    param(
       [Array] $ExchangeUnifiedGroups
    )

    $Output = foreach ($O365Group in $ExchangeUnifiedGroups) {
        [PSCustomObject] @{
            "Group Name"                           = $O365Group.DisplayName
            "Group Owners"                         = $O365Group.ManagedBy -join ', '
            "Group Primary Email"                  = $O365Group.PrimarySmtpAddress
            "Group Emails"                         = Convert-ExchangeEmail -Emails $O365Group.EmailAddresses -AddSeparator -RemoveDuplicates -RemovePrefix
            Identity                               = $O365Group.Identity
            WhenCreated                            = $O365Group.WhenCreated
            WhenChanged                            = $O365Group.WhenChanged

            Alias                                  = $O365Group.Alias
            ModerationEnabled                      = $O365Group.ModerationEnabled
            AccessType                             = $O365Group.AccessType
            AutoSubscribeNewMembers                = $O365Group.AutoSubscribeNewMembers
            AlwaysSubscribeMembersToCalendarEvents = $O365Group.AlwaysSubscribeMembersToCalendarEvents
            CalendarMemberReadOnly                 = $O365Group.CalendarMemberReadOnly
            HiddenGroupMembershipEnabled           = $O365Group.HiddenGroupMembershipEnabled
            SubscriptionEnabled                    = $O365Group.SubscriptionEnabled

            HiddenFromExchangeClientsEnabled       = $O365Group.HiddenFromExchangeClientsEnabled
            InboxUrl                               = $O365Group.InboxUrl
            SharePointSiteUrl                      = $O365Group.SharePointSiteUrl
            SharePointDocumentsUrl                 = $O365Group.SharePointDocumentsUrl
            SharePointNotebookUrl                  = $O365Group.SharePointNotebookUrl
        }
    }
    $Output
}