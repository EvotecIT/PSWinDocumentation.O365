function Get-WinAzureRolesMembers {
    [CmdletBinding()]
    param(
        [Array] $MsolRoles,
        [string] $Prefix,
        [switch] $Formatted,
        [System.Collections.IDictionary] $Users
    )
    if (-not $MsolRoles) {
        $MsolRoles = & "Get-$($prefix)MsolRole" | Sort-Object -Property Name
    }
    $Roles = foreach ($_ in $MsolRoles) {
        $MsolRolesMembers = & "Get-$($prefix)MsolRoleMember" -RoleObjectId $_.ObjectID.Guid

        <# Get-MsolRoleMember -RoleObjectId 62e90394-69f5-4237-9190-012177145e10
        DisplayName                        : Przemysław Kłys
        EmailAddress                       : przemyslaw.klys@evotec.pl
        IsLicensed                         : True
        LastDirSyncTime                    :
        ObjectId                           : e6a8f1cf - 0874 - 4323-a12f-2bf51bb6dfdd
        OverallProvisioningStatus          : Success
        RoleMemberType                     : User
        StrongAuthenticationRequirements   : { }
        ValidationStatus                   : Healthy
        #>


        foreach ($Member in $MsolRolesMembers) {
            $U = $Users[$Member.ObjectID.Guid]
            if ($null -eq $U) {
                <#
                ObjectId                               Name                             Description
                --------                               ----                             -----------
                88d8e3e3-8f55-4a1e-953a-9b9898b8876b   Directory Readers                Can read basic directory information. For granting access to applications, not intended for users.

                Sometimes accounts like this

                RoleMemberType   EmailAddress DisplayName       isLicensed
                --------------   ------------ -----------       ----------
                ServicePrincipal              Office 365 Yammer

                #>
                #$Member
            } else {
                Add-Member -InputObject $U -MemberType NoteProperty -Name 'Role' -Value $_.Name
                $U
            }
        }
    }
    $Roles
}
