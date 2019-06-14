function Get-WinO365UExchangeMailUsers {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeMailUsers = & "Get-$($Prefix)MailUser" -ResultSize unlimited
    return $O365UExchangeMailUsers
}