function Get-WinAzureSubscription {
    [CmdletBinding()]
    param(
        [Array] $UAzureSubscription,
        [switch] $Formatted
    )
    if ($null -eq $UAzureSubscription) {
        $UAzureSubscription = Get-MsolSubscription
    }
    $Licenses = foreach ($Subscription in $UAzureSubscription) {
        foreach ($Plan in $Subscription.ServiceStatus) {
            if ($Formatted) {
                [PSCustomObject] @{
                    'Licenses Name'       = Convert-Office365License -License $Subscription.SkuPartNumber
                    'Licenses SKU'        = $Subscription.SkuPartNumber
                    'Service Plan Name'   = Convert-Office365License -License $Plan.ServicePlan.ServiceName
                    'Service Plan SKU'    = $Plan.ServicePlan.ServiceName
                    'Service Plan ID'     = $Plan.ServicePlan.ServicePlanId
                    'Service Plan Type'   = $Plan.ServicePlan.ServiceType
                    'Service Plan Class'  = $Plan.ServicePlan.TargetClass
                    'Service Plan Status' = $Plan.ProvisioningStatus
                    'Licenses Total'      = $Subscription.TotalLicenses
                    'Licenses Status'     = $Subscription.Status
                    'Licenses SKUID'      = $Subscription.SkuId
                    'Licenses Are Trial'  = $Subscription.IsTrial
                    'Licenses Created'    = $Subscription.DateCreated
                    'Next Lifecycle Date' = $Subscription.NextLifecycleDate
                    'ObjectID'            = $Subscription.ObjectId
                    'Ocp SubscriptionID'  = $Subscription.OcpSubscriptionId
                }
            } else {
                [PSCustomObject] @{
                    'LicensesName'      = Convert-Office365License -License $Subscription.SkuPartNumber
                    'LicensesSKU'       = $Subscription.SkuPartNumber
                    'ServicePlanName'   = Convert-Office365License -License $Plan.ServicePlan.ServiceName
                    'ServicePlanSKU'    = $Plan.ServicePlan.ServiceName
                    'ServicePlanID'     = $Plan.ServicePlan.ServicePlanId
                    'ServicePlanType'   = $Plan.ServicePlan.ServiceType
                    'ServicePlanClass'  = $Plan.ServicePlan.TargetClass
                    'ServicePlanStatus' = $Plan.ProvisioningStatus
                    'LicensesTotal'     = $Subscription.TotalLicenses
                    'LicensesStatus'    = $Subscription.Status
                    'LicensesSKUID'     = $Subscription.SkuId
                    'LicensesAreTrial'  = $Subscription.IsTrial
                    'LicensesCreated'   = $Subscription.DateCreated
                    'NextLifecycleDate' = $Subscription.NextLifecycleDate
                    'ObjectID'          = $Subscription.ObjectId
                    'OcpSubscriptionID' = $Subscription.OcpSubscriptionId
                }
            }
        }
    }
    return $Licenses | Sort-Object 'Licenses Name'
}