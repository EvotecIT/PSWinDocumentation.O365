function Get-WinO365UExchangeRecipients {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeRecipients = & "Get-$($prefix)Recipient" -ResultSize unlimited
    return $O365UExchangeRecipients
}