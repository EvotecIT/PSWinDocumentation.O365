function Get-WinUAzureADUsersDeleted {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix
    )

    if ($Tenant) {
        #Get-MsolUser -ReturnDeletedUsers -TenantId $Tenant
        $MsolUsers = & "Get-$($prefix)MsolUser" -ReturnDeletedUsers -TenantId $Tenant
    } else {
        #Get-MsolUser -ReturnDeletedUsers
        $MsolUsers = & "Get-$($prefix)MsolUser" -ReturnDeletedUsers
    }
    $MsolUsers
}