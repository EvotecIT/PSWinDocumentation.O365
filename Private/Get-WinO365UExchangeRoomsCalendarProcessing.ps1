function Get-WinUExchangeRoomsCalendarProcessing {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [Array] $UExchangeMailboxesRooms
    )
    $Output = @(
        foreach ($Mailbox in $UExchangeMailboxesRooms) {
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