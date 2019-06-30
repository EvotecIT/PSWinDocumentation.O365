function Get-WinAzureTenantDomains {
    [CmdletBinding()]
    param(
        [Array] $UAzureTenantDomains,
        [switch] $Formatted
    )
    if ($null -eq $UAzureTenantDomains) {
        $UAzureTenantDomains = Get-MsolDomain #| Select-Object Authentication, Capabilities, IsDefault, IsInitial, Name, RootDomain, Status, VerificationMethod
    }
    foreach ($Domain in $UAzureTenantDomains) {
        if ($Formatted) {
            [PsCustomObject] @{
                'Domain Name'         = $Domain.Name
                'Default'             = $Domain.IsDefault
                'Initial'             = $Domain.IsInitial
                'Status'              = $Domain.Status
                'Verification Method' = Format-AddSpaceToSentence -Text $Domain.VerificationMethod
                'Capabilities'        = $Domain.Capabilities
                'Authentication'      = $Domain.Authentication
            }
        } else {
            [PsCustomObject] @{
                'DomainName'         = $Domain.Name
                'Default'            = $Domain.IsDefault
                'Initial'            = $Domain.IsInitial
                'Status'             = $Domain.Status
                'VerificationMethod' = $Domain.VerificationMethod
                'Capabilities'       = $Domain.Capabilities
                'Authentication'     = $Domain.Authentication
            }
        }
    }
}