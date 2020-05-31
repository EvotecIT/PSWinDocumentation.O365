function Get-WinExchangeMailboxesStatisticsArchive {
    [CmdletBinding()]
    param(
        #   [Array] $AzureUsers,
        [Array] $ExchangeMailboxes
    )
    $PropertiesMailboxStatsArchive = 'DisplayName', 'TotalItemSize', 'ItemCount', 'TotalDeletedItemSize', 'DeletedItemCount', 'OwnerADGuid', 'MailboxGuid'

    $MailboxStatisticsArchive = foreach ($Mailbox in $ExchangeMailboxes) {
        if ($Mailbox.ArchiveStatus -eq "Active") {
            & "Get-$($Prefix)MailboxStatistics" -Identity $Mailbox.Guid.Guid -Archive | Select-Object -Property $PropertiesMailboxStatsArchive
        }
    }
    $MailboxStatisticsArchive
}