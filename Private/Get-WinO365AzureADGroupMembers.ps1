function Get-WinAzureADGroupMembers {
    [CmdletBinding()]
    param(
        [Array] $UAzureADGroups,
        [System.Collections.IDictionary] $Users,
        [switch] $Formatted
    )
    $GroupMembers = foreach ($Group in $UAzureADGroups) {
        $Object = Get-MsolGroupMember -GroupObjectId $Group.ObjectId -All
        foreach ($_ in $Object) {
            if ($Formatted) {
                $GroupMember = [ordered] @{
                    "Group Display Name"    = $Group.DisplayName
                    "Group Email"           = $Group.EmailAddress
                    "Group Email Secondary" = $Group.ProxyAddresses -replace 'smtp:', '' -join ','
                    "Group Type"            = $Group.GroupType
                }
                $CurrentUser = $Users[$_.ObjectId.Guid]
                if ($CurrentUser) {
                    foreach ( $Property in $CurrentUser.psobject.Properties) {
                        $GroupMember[$Property.Name] = $Property.value
                    }
                } else {
                    Write-Warning 'Problem'
                }
                $GroupMember["Group Last Dir Sync Time"] = $Group.LastDirSyncTime
                $GroupMember["Group Managed By"] = $Group.ManagedBy
                $GroupMember["Group EmailA ddresses"] = $Group.ProxyAddresses
            } else {
                $GroupMember = [ordered] @{
                    "GroupDisplayName"    = $Group.DisplayName
                    "GroupEmail"          = $Group.EmailAddress
                    "GroupEmailSecondary" = $Group.ProxyAddresses -replace 'smtp:', '' -join ','
                    "GroupType"           = $Group.GroupType
                }
                $CurrentUser = $Users[$_.ObjectId.Guid]
                if ($CurrentUser) {
                    foreach ( $Property in $CurrentUser.psobject.Properties) {
                        $GroupMember[$Property.Name] = $Property.value
                    }
                } else {
                    Write-Warning 'Problem'
                }
                $GroupMember["GroupLastDirSyncTime"] = $Group.LastDirSyncTime
                $GroupMember["GroupManagedBy"] = $Group.ManagedBy
                $GroupMember["GroupEmailAddresses"] = $Group.ProxyAddresses
            }
            [PSCustomObject] $GroupMember
        }
    }
    $GroupMembers
}


