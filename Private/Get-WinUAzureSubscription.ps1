function Get-WinUAzureSubscription {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix
    )
    #$UAzureSubscription = Get-MsolSubscription
    if ($Tenant) {
        $UAzureSubscription = & "Get-$($prefix)MsolSubscription" -TenantId $Tenant
    } else {
        $UAzureSubscription = & "Get-$($prefix)MsolSubscription"
    }
    $UAzureSubscription
}