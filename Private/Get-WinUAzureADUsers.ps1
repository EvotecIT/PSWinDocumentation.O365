function Get-WinUAzureADUsers {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix
    )
    if ($Tenant) {
        $MsolUsers = & "Get-$($prefix)MsolUser" -All -TenantId $Tenant
        # Get-MsolUser -All -TenantId $Tenant
    } else {
        #Get-MsolUser -All
        $MsolUsers = & "Get-$($prefix)MsolUser" -All
    }
    $MsolUsers
}