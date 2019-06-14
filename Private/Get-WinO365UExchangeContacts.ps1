function Get-WinO365UExchangeContacts {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeContacts = & "Get-$($prefix)Contact" -ResultSize unlimited
    $O365UExchangeContacts
}