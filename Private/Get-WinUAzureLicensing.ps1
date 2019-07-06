function Get-WinUAzureLicensing {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix
    )
    # $UAzureLicensing = Get-MsolAccountSku -TenantId $Tenant
    if ($Tenant) {
        $UAzureLicensing = & "Get-$($Prefix)MsolAccountSku" -TenantId $Tenant
    } else {
        $UAzureLicensing = & "Get-$($Prefix)MsolAccountSku"
    }
    $UAzureLicensing
}