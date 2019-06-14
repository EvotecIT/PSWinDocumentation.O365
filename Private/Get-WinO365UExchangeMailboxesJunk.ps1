function Get-WinO365UExchangeMailboxesJunk {
    [CmdletBinding()]
    param(
        [Array] $O365UExchangeMailBoxes,
        [string] $Prefix
    )
    $Output = @(
        foreach ($Mailbox in $O365UExchangeMailBoxes) {
            if ($null -eq $Mailbox.PrimarySmtpAddress) {
                #Write-Verbose "O365UExchangeMailboxesJunk - $($Mailbox.PrimarySmtpAddress)"
                $Object = & "Get-$($prefix)MailboxJunkEmailConfiguration" -Identity $Mailbox.PrimarySmtpAddress -ResultSize unlimited
                if ($Object) {
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxPrimarySmtpAddress" -Value $Mailbox.PrimarySmtpAddress
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxAlias" -Value $Mailbox.Alias
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxGUID" -Value $Mailbox.GUID
                    $Object
                }
            }
        }
    )
    return $Output
}