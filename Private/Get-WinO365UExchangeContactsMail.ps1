function Get-WinUExchangeContactsMail {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeContactsMail = & "Get-$($prefix)MailContact" -ResultSize unlimited
    return $UExchangeContactsMail
}

