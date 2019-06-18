function Get-WinUExchangeMailBoxes {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeMailBoxes = & "Get-$($prefix)Mailbox" -ResultSize unlimited
    return $UExchangeMailBoxes
}
