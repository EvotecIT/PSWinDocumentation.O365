function Get-WinO365UExchangeMailBoxes {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeMailBoxes = & "Get-$($prefix)Mailbox" -ResultSize unlimited
    return $O365UExchangeMailBoxes
}
