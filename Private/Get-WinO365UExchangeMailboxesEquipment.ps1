function Get-WinO365UExchangeMailboxesEquipment {
    [CmdletBinding()]
    param(
        [Array] $O365UExchangeMailBoxes
    )
    $O365UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'EquipmentMailbox' }
}