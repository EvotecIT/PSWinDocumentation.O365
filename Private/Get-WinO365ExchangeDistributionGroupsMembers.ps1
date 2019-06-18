function Get-WinExchangeDistributionGroupsMembers {
    [CmdletBinding()]
    param(
        [Array] $UExchangeGroupsDistribution
    )
    $Output = foreach ($O365Group in $UExchangeGroupsDistribution) {
        # This returns members of groups
        $O365GroupPeople = Get-DistributionGroupMember -Identity $O365Group.GUID.GUID
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