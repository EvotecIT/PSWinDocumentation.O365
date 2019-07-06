function Get-WinUAzureRoles {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    if ($Tenant) {
        $MsolRoles = & "Get-$($prefix)MsolRole" -TenantId $Tenant | Sort-Object -Property Name
    } else {
        $MsolRoles = & "Get-$($prefix)MsolRole" | Sort-Object -Property Name
    }
    $MsolRoles
}