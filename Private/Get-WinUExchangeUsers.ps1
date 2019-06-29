function Get-WinUExchangeUsers {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeUsers = & "Get-$($prefix)User" -ResultSize unlimited
    return $UExchangeUsers
}