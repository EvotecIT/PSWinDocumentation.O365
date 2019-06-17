function Get-WinO365UExchangeContactsMail {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeContactsMail = & "Get-$($prefix)MailContact" -ResultSize unlimited
    return $O365UExchangeContactsMail
}

