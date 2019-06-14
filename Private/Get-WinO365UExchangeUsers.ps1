function Get-WinO365UExchangeUsers {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeUsers = & "Get-$($prefix)User" -ResultSize unlimited
    return $O365UExchangeUsers
}