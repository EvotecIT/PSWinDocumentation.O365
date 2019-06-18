function Get-WinUAzureTenantDomains {
    [CmdletBinding()]
    param(

    )
    $UAzureTenantDomains = Get-MsolDomain
    return $UAzureTenantDomains
}