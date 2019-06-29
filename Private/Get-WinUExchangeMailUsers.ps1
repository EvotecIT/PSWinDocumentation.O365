function Get-WinUExchangeMailUsers {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeMailUsers = & "Get-$($Prefix)MailUser" -ResultSize unlimited
    return $UExchangeMailUsers
}