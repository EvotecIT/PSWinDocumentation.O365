function Get-WinUExchangeMailboxesInboxRules {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [Array] $UExchangeMailBoxes
    )
    $InboxRules = @(
        foreach ($Mailbox in $UExchangeMailBoxes) {
            & "Get-$($prefix)InboxRule" -Mailbox $Mailbox.UserPrincipalName
        }
    )
    return $InboxRules
}