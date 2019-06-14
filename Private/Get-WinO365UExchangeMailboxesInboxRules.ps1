function Get-WinO365UExchangeMailboxesInboxRules {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [Array] $O365UExchangeMailBoxes
    )
    $InboxRules = @(
        foreach ($Mailbox in $O365UExchangeMailBoxes) {
            & "Get-$($prefix)InboxRule" -Mailbox $Mailbox.UserPrincipalName
        }
    )
    return $InboxRules
}