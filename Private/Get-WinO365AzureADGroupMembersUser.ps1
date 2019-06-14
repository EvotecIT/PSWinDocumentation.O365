function Get-WinO365AzureADGroupMembersUser {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADGroups,
        [Array] $O365UAzureADGroupMembers
    )
    $Members = foreach ($Group in $O365UAzureADGroups) {
        $GroupMembers = $Data.O365UAzureADGroupMembers | Where-Object { $_.GroupObjectId -eq $Group.ObjectId }
        foreach ($GroupMember in $GroupMembers) {
            [PsCustomObject] @{
                "GroupDisplayName"    = $Group.DisplayName
                "GroupEmail"          = $Group.EmailAddress
                "GroupEmailSecondary" = $Group.ProxyAddresses -replace 'smtp:', '' -join ','
                "GroupType"           = $Group.GroupType
                "MemberDisplayName"   = $GroupMember.DisplayName
                "MemberEmail"         = $GroupMember.EmailAddress
                "MemberType"          = $GroupMember.GroupMemberType
                "LastDirSyncTime"     = $Group.LastDirSyncTime
                "ManagedBy"           = $Group.ManagedBy
                "ProxyAddresses"      = $Group.ProxyAddresses
            }
        }
    }
    return $Members
}