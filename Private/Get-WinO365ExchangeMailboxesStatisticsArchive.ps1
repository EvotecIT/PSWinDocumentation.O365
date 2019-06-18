function Get-WinExchangeMailboxesStatisticsArchive {
    [CmdletBinding()]
    param(
        #   [Array] $AzureUsers,
        [Array] $ExchangeMailboxes
    )
    $PropertiesMailboxStatsArchive = 'DisplayName', 'TotalItemSize', 'ItemCount', 'TotalDeletedItemSize', 'DeletedItemCount', 'OwnerADGuid', 'MailboxGuid'

    $MailboxStatisticsArchive = foreach ($_ in $ExchangeMailboxes) {
        if ($Mailbox.ArchiveStatus -eq "Active") {
            & "Get-$($Prefix)MailboxStatistics" -Identity $_.Guid.Guid -Archive | Select-Object -Property $PropertiesMailboxStatsArchive
        }
    }
    $MailboxStatisticsArchive
}