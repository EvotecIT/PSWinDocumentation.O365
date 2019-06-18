function Get-WinUExchangeMailboxesRooms {
    [CmdletBinding()]
    param(
        [Array] $UExchangeMailBoxes
    )
    $UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'RoomMailbox' }
}