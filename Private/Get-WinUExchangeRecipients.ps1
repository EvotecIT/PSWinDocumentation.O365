function Get-WinUExchangeRecipients {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeRecipients = & "Get-$($prefix)Recipient" -ResultSize unlimited
    return $UExchangeRecipients
}