function Get-WinO365ExchangeMailboxesPermissions {
    [CmdletBinding()]
    param(
        #[Array] $AzureUsers,
        [Array] $ExchangeMailboxes,
        [Array] $MailboxPermissions
    )
    $Permissions = foreach ($Mailbox in $ExchangeMailboxes) {
        #$Azure = $AzureUsers | Where-Object { $_.UserPrincipalName -eq $Mailbox.UserPrincipalName }
        $MailboxPermission = $MailboxPermissions | Where-Object { $_.UserPrincipalName -eq $Mailbox.UserPrincipalName }
        if (-not $MailboxPermissions) { continue }

        foreach ($Permission in ($MailboxPermission | Where-Object { ($_."User With Access" -ne "NT AUTHORITY\SELF") -and ($_.Inherited -ne $true) }) ) {
            $Permission
            <#
            [PSCustomObject] @{
                DiplayName           = $Mailbox.DisplayName
                UserPrincipalName    = $Mailbox.UserPrincipalName
                FirstName            = $Azure.FirstName
                LastName             = $Azure.LastName
                RecipientType        = $Mailbox.RecipientTypeDetails
                PrimaryEmailAddress  = $Mailbox.PrimarySmtpAddress

                "User With Access"   = $Permission.User
                "User Access Rights" = ($Permission.AccessRights -join ",")
            }
            #>
        }
    }
    $Permissions
}