function Get-WinO365UExchangeMailboxesRooms {
    [CmdletBinding()]
    param(
        [Array] $O365UExchangeMailBoxes
    )
    $O365UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'RoomMailbox' }
}