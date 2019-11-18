function Get-WinUAzureADGroups {
    [CmdletBinding()]
    param(
        [switch] $Formatted
    )
    $Groups = Get-MsolGroup -All
    foreach ($_ in $Groups) {
        if ($Formatted) {
            [PSCustomObject]@{
                #Name                         = $_.Name
                DisplayName                  = $_.DisplayName
                Description                  = $_.Description
                DirSyncProvisioningErrors    = $_.DirSyncProvisioningErrors
                EmailAddress                 = $_.EmailAddress
                Errors                       = $_.Errors
                GroupLicenseProcessingDetail = $_.GroupLicenseProcessingDetail
                GroupType                    = $_.GroupType
                IsSystem                     = $_.IsSystem
                LastDirSyncTime              = $_.LastDirSyncTime
                Licenses                     = $_.Licenses
                ManagedBy                    = $_.ManagedBy
                ObjectId                     = $_.ObjectId
                ProxyAddresses               = $_.ProxyAddresses
                ValidationStatus             = $_.ValidationStatus
                AssignedLicenses             = $_.AssignedLicenses
            }
        } else {
            [PSCustomObject]@{
                #Name                         = $_.Name
                DisplayName                  = $_.DisplayName
                Description                  = $_.Description
                DirSyncProvisioningErrors    = $_.DirSyncProvisioningErrors
                EmailAddress                 = $_.EmailAddress
                Errors                       = $_.Errors
                GroupLicenseProcessingDetail = $_.GroupLicenseProcessingDetail
                GroupType                    = $_.GroupType
                IsSystem                     = $_.IsSystem
                LastDirSyncTime              = $_.LastDirSyncTime
                Licenses                     = $_.Licenses
                ManagedBy                    = $_.ManagedBy
                ObjectId                     = $_.ObjectId
                ProxyAddresses               = $_.ProxyAddresses
                ValidationStatus             = $_.ValidationStatus
                AssignedLicenses             = $_.AssignedLicenses
            }
        }
    }

    <#
    ExtensionData                : System.Runtime.Serialization.ExtensionDataObject
    AssignedLicenses             : {Microsoft.Online.Administration.AccountSkuIdentifier}
    CommonName                   : GLA-O365-Project.Professional
    Description                  :
    DirSyncProvisioningErrors    :
    DisplayName                  : GLA-O365-Project.Professional
    EmailAddress                 :
    Errors                       :
    GroupLicenseProcessingDetail :
    GroupType                    : Security
    IsSystem                     : False
    LastDirSyncTime              : 08.07.2019 17:30:26
    Licenses                     : {reseller-account}
    ManagedBy                    :
    ObjectId                     : a0dd0755-5c1f-4dc7-a219-d2381f7458a9
    ProxyAddresses               : {}
    ValidationStatus             : Healthy

    $O365.UAzureADGroups[0].Licenses | fl *

    ExtensionData : System.Runtime.Serialization.ExtensionDataObject
    AccountName   : reseller-account
    SkuPartNumber : PROJECTPROFESSIONAL

    $O365.UAzureADGroups[0].AssignedLicenses | fl *

    ExtensionData        : System.Runtime.Serialization.ExtensionDataObject
    AccountSkuId         : Microsoft.Online.Administration.AccountSkuIdentifier
    DisabledServicePlans : {}

   $O365.UAzureADGroups[0].AssignedLicenses.AccountSkuID | fl *

    ExtensionData : System.Runtime.Serialization.ExtensionDataObject
    AccountName   : reseller-account
    SkuPartNumber : PROJECTPROFESSIONAL
    #>
}