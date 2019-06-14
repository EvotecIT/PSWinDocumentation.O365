function Get-WinO365UAzureTenantDomains {
    [CmdletBinding()]
    param(

    )
    $O365UAzureTenantDomains = Get-MsolDomain
    return $O365UAzureTenantDomains
}