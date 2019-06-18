function Get-WinUExchangeEquipmentCalendarProcessing {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [Array] $UExchangeMailboxesEquipment
    )
    $Output = @(
        foreach ($Mailbox in $UExchangeMailboxesEquipment) {
            $Object = & "Get-$($prefix)CalendarProcessing" -Identity $Mailbox.PrimarySmtpAddress -ResultSize unlimited
            if ($Object) {
                $Object | Add-Member -MemberType NoteProperty -Name "MailboxPrimarySmtpAddress" -Value $Mailbox.PrimarySmtpAddress
                $Object | Add-Member -MemberType NoteProperty -Name "MailboxAlias" -Value $Mailbox.Alias
                $Object | Add-Member -MemberType NoteProperty -Name "MailboxGUID" -Value $Mailbox.GUID
                $Object
            }
        }
    )
    $Output
}