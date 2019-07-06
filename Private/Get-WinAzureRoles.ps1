function Get-WinAzureRoles {
    [CmdletBinding()]
    param(
        [Array] $MsolRoles,
        [Array] $AzureRolesMembers,
        [string] $Prefix,
        [switch] $Formatted
    )
    if (-not $MsolRoles) {
        $MsolRoles = & "Get-$($prefix)MsolRole" | Sort-Object -Property Name
    }

    $Roles = foreach ($_ in $MsolRoles) {

        #$MsolRolesMembers = & "Get-$($prefix)MsolRoleMember" -RoleObjectId $_.ObjectID

        [Array] $Members = foreach ($Member in $AzureRolesMembers) {
            if ($Member.Role -eq $_.Name -and $Member.UserType -eq 'Member') {
                $Member
                Continue
            }
        }
        [Array] $MembersGuests = foreach ($Member in $AzureRolesMembers) {
            if ($Member.Role -eq $_.Name -and $Member.UserType -eq 'Guest') {
                $Member
                Continue
            }
        }

        #$MsolRolesMembers = Get-MsolRoleMember -RoleObjectId $_.ObjectID

        if ($Formatted) {
            [PSCustomObject] @{
                'Name'         = $_.Name
                'Member Count' = $Members.Count
                'Guests Count' = $MembersGuests.Count
                'Description'  = $_.Description
                #'Is Enabled'   = $_.IsEnabled
                #'Is System'    = $_.IsSystem
                #'ObjectID'     = $_.ObjectID.Guid
            }
        } else {
            [PSCustomObject] @{
                Name        = $_.Name
                MemberCount = $Members.Count
                GuestsCount = $MembersGuests.Count
                Description = $_.Description
                #Enabled     = $_.IsEnabled
                #IsSystem    = $_.IsSystem
                #ObjectID    = $_.ObjectID.Guid
            }
        }
    }
    $Roles
}