function Get-WinO365ExchangeMailboxesStatistics {
    [CmdletBinding()]
    param(
        #    [Array] $AzureUsers,
        [Array] $ExchangeMailboxes
    )
    $PropertiesMailboxStats = 'DisplayName', 'LastLogonTime', 'LastLogoffTime', 'TotalItemSize', 'ItemCount', 'TotalDeletedItemSize', 'DeletedItemCount', 'OwnerADGuid', 'MailboxGuid'
    $MailboxStatistics = foreach ($_ in $ExchangeMailboxes) {
        & "Get-$($Prefix)MailboxStatistics" -Identity $_.Guid.Guid | Select-Object -Property $PropertiesMailboxStats
    }
    $MailboxStatistics
}