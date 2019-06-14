function Get-WinO365AzureTenantDomains {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureTenantDomains
    )
    if ($null -eq $O365UAzureTenantDomains) {
        $O365UAzureTenantDomains = Get-MsolDomain #| Select-Object Authentication, Capabilities, IsDefault, IsInitial, Name, RootDomain, Status, VerificationMethod
    }
    foreach ($Domain in $O365UAzureTenantDomains) {
        [PsCustomObject] @{
            'Domain Name'         = $Domain.Name
            'Default'             = $Domain.IsDefault
            'Initial'             = $Domain.IsInitial
            'Status'              = $Domain.Status
            'Verification Method' = $Domain.VerificationMethod
            'Capabilities'        = $Domain.Capabilities
            'Authentication'      = $Domain.Authentication
        }
    }
}