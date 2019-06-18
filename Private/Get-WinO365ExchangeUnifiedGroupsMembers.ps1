function Get-WinO365ExchangeUnifiedGroupsMembers {
    [CmdletBinding()]
    param(
        [Array] $ExchangeUnifiedGroups
    )
    $Output = foreach ($O365Group in $ExchangeUnifiedGroups) {
        $O365GroupPeople = Get-UnifiedGroupLinks -Identity $O365Group.Guid.Guid -LinkType Members
        foreach ($O365Member in $O365GroupPeople) {
            [PSCustomObject] @{
                "Group Name"          = $O365Group.DisplayName
                "Group Primary Email" = $O365Group.PrimarySmtpAddress
                "Group Emails"        = Convert-ExchangeEmail -Emails $O365Group.EmailAddresses -AddSeparator -RemoveDuplicates -RemovePrefix
                "Group Owners"        = $O365Group.ManagedBy -join ', '
                "Member Name"         = $O365Member.Name
                "Member E-Mail"       = $O365Member.PrimarySMTPAddress
                "Recipient Type"      = $O365Member.RecipientType
            }
        }
    }
    $Output
}