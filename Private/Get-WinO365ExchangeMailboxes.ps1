function Get-WinExchangeMailboxes {
    [CmdletBinding()]
    param(
        [Array] $AzureUsers,
        [Array] $ExchangeMailboxes,
        [Array] $MailboxStatistics,
        [Array] $MailboxStatisticsArchive
    )
    #$PropertiesMailbox = 'DisplayName', 'UserPrincipalName', 'PrimarySmtpAddress', 'EmailAddresses', 'HiddenFromAddressListsEnabled', 'Identity', 'ExchangeGuid', 'ArchiveGuid', 'ArchiveQuota', 'ArchiveStatus', 'WhenCreated', 'WhenChanged', 'Guid', 'MailboxGUID', 'RecipientTypeDetails'
    #$ExchangeMailboxes = & "Get-$($Prefix)Mailbox" -ResultSize Unlimited | Select-Object $PropertiesMailbox

    $Mailboxes = foreach ($Mailbox in $ExchangeMailboxes) {
        $Azure = $AzureUsers | Where-Object { $_.UserPrincipalName -eq $Mailbox.UserPrincipalName }
        $MailboxStats = $MailboxStatistics | Where-Object { $_.MailboxGuid.Guid -eq $Mailbox.ExchangeGuid.Guid }
        $MailboxStatsArchive = $MailboxStatisticsArchive | Where-Object { $_.MailboxGuid.Guid -eq $Mailbox.ArchiveGuid.Guid }

        [PSCustomObject][ordered] @{
            DisplayName               = $Mailbox.DisplayName
            UserPrincipalName         = $Mailbox.UserPrincipalName
            FirstName                 = $Azure.FirstName
            LastName                  = $Azure.LastName
            Country                   = $Azure.Country
            City                      = $Azure.City
            Department                = $Azure.Department
            Office                    = $Azure.Office
            UsageLocation             = $Azure.UsageLocation
            License                   = Convert-Office365License -License $Azure.Licenses.AccountSkuID
            UserCreated               = $Azure.WhenCreated

            Blocked                   = $Azure.BlockCredential
            LastSynchronized          = $azure.LastDirSyncTime
            LastPasswordChange        = $Azure.LastPasswordChangeTimestamp
            PasswordNeverExpires      = $Azure.PasswordNeverExpires

            RecipientType             = $Mailbox.RecipientTypeDetails

            PrimaryEmailAddress       = $Mailbox.PrimarySmtpAddress
            AllEmailAddresses         = Convert-ExchangeEmail -Emails $Mailbox.EmailAddresses -Separator ', ' -RemoveDuplicates -RemovePrefix -AddSeparator

            MailboxLogOn              = $MailboxStats.LastLogonTime
            MailboxLogOff             = $MailboxStats.LastLogoffTime

            MailboxSize               = Convert-ExchangeSize -Size $MailboxStats.TotalItemSize -To $SizeIn -Default '' -Precision $SizePrecision

            MailboxItemCount          = $MailboxStats.ItemCount

            MailboxDeletedSize        = Convert-ExchangeSize -Size $MailboxStats.TotalDeletedItemSize -To $SizeIn -Default '' -Precision $SizePrecision
            MailboxDeletedItemsCount  = $MailboxStats.DeletedItemCount

            MailboxHidden             = $Mailbox.HiddenFromAddressListsEnabled
            MailboxCreated            = $Mailbox.WhenCreated # WhenCreatedUTC
            MailboxChanged            = $Mailbox.WhenChanged # WhenChangedUTC

            ArchiveStatus             = $Mailbox.ArchiveStatus
            ArchiveQuota              = Convert-ExchangeSize -Size $Mailbox.ArchiveQuota -To $SizeIn -Default '' -Display
            ArchiveSize               = Convert-ExchangeSize -Size $MailboxStatsArchive.TotalItemSize -To $SizeIn -Default '' -Precision $SizePrecision
            ArchiveItemCount          = Convert-ExchangeItems -Count $MailboxStatsArchive.ItemCount -Default ''

            ArchiveDeletedSize        = Convert-ExchangeSize -Size $MailboxStatsArchive.TotalDeletedItemSize -To $SizeIn -Default '' -Precision $SizePrecision
            ArchiveDeletedItemsCount  = Convert-ExchangeItems -Count $MailboxStatsArchive.DeletedItemCount -Default ''
            # Adding GUID so it's possible to match other data
            OverallProvisioningStatus = $Azure.OverallProvisioningStatus
            ImmutableID               = $Azure.ImmutableID
            Guid                      = $Mailbox.Guid.Guid
            ObjectID                  = $Mailbox.ExternalDirectoryObjectId
        }
    }
    $Mailboxes
}