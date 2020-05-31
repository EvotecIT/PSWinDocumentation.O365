function Get-WinExchangeMailboxesInboxRulesForwarding {
    [CmdletBinding()]
    param(
        [Array] $InboxRules,
        [Array] $Mailboxes
    )
    $InboxRulesForwarding = @(
        foreach ($Mailbox in $Mailboxes) {
            $UserRules = $InboxRules | Where-Object { ($Mailbox.Identity -eq $_.MailboxOwnerID) -and (($null -ne $_.ForwardTo) -or ($null -ne $_.ForwardAsAttachmentTo) -or ($null -ne $_.RedirectsTo)) }
            foreach ($Rule in $UserRules) {
                [PSCustomobject] @{
                    UserPrincipalName     = $Mailbox.UserPrincipalName
                    DisplayName           = $Mailbox.DisplayName
                    RuleName              = $Rule.Name
                    Description           = $Rule.Description
                    Enabled               = $Rule.Enabled
                    Priority              = $Rule.Priority
                    ForwardTo             = $Rule.ForwardTo
                    ForwardAsAttachmentTo = $Rule.ForwardAsAttachmentTo
                    RedirectTo            = $Rule.RedirectTo
                    DeleteMessage         = $Rule.DeleteMessage
                }
            }
        }
    )
    $InboxRulesForwarding
}