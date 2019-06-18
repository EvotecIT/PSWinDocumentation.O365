function Get-WinUExchangeMailboxesEquipment {
    [CmdletBinding()]
    param(
        [Array] $UExchangeMailBoxes
    )
    $UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'EquipmentMailbox' }
}