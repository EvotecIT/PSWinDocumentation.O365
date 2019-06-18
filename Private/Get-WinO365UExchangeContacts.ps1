function Get-WinUExchangeContacts {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeContacts = & "Get-$($prefix)Contact" -ResultSize unlimited
    $UExchangeContacts
}