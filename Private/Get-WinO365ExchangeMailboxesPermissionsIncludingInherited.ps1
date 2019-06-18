function Get-WinO365ExchangeMailboxesPermissionsIncludingInherited {
    [CmdletBinding()]
    param(
        [Array] $AzureUsers,
        [Array] $ExchangeMailboxes
    )
    $Permissions = foreach ($Mailbox in $ExchangeMailboxes) {
        $Azure = $AzureUsers | Where-Object { $_.UserPrincipalName -eq $Mailbox.UserPrincipalName }

        $MailboxPermissions = Get-MailboxPermission -Identity $Mailbox.PrimarySmtpAddress.ToString()

        $PermissionsAll = foreach ($Permission in $MailboxPermissions) {
            [PSCustomObject] @{
                DiplayName           = $Mailbox.DisplayName
                UserPrincipalName    = $Mailbox.UserPrincipalName
                FirstName            = $Azure.FirstName
                LastName             = $Azure.LastName
                RecipientType        = $Mailbox.RecipientTypeDetails
                PrimaryEmailAddress  = $Mailbox.PrimarySmtpAddress

                "User With Access"   = $Permission.User
                "User Access Rights" = ($Permission.AccessRights -join ",")
                "Inherited"          = $Permission.IsInherited
                "Deny"               = $Permission.Deny
                "InheritanceType"    = $Permission.InheritanceType
            }
        }
        if ($null -ne $PermissionsAll) {
            $PermissionsAll
        }
    }
    $Permissions
}