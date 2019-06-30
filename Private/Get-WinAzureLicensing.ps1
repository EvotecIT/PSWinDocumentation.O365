function Get-WinAzureLicensing {
    [CmdletBinding()]
    param(
        [Array] $UAzureLicensing,
        [switch] $Formatted
    )
    if ($null -eq $UAzureLicensing) {
        $UAzureLicensing = Get-MsolAccountSku
    }

    $Licenses = foreach ($License in $UAzureLicensing ) {
        $LicensesTotal = $License.ActiveUnits + $License.WarningUnits
        $LicensesUsed = $License.ConsumedUnits
        $LicensesLeft = $LicensesTotal - $LicensesUsed
        $LicenseName = Convert-Office365License -License $License.SkuPartNumber   #$($Global:O365SKU).Item("$($License.SkuPartNumber)")
        if ($null -eq $LicenseName) { $LicenseName = $License.SkuPartNumber }

        if ($Formatted) {
            [PSCustomObject] @{
                Name                 = $LicenseName
                'Licenses Total'     = $LicensesTotal
                'Licenses Used'      = $LicensesUsed
                'Licenses Left'      = $LicensesLeft
                'Licenses Active'    = $License.ActiveUnits
                'Licenses Trial'     = $License.WarningUnits
                'Licenses LockedOut' = $License.LockedOutUnits
                'Licenses Suspended' = $License.SuspendedUnits
                'Percent Used'       = if ($LicensesTotal -eq 0) { '100%' } else { ($LicensesUsed / $LicensesTotal).ToString("P") }
                'Percent Left'       = if ($LicensesTotal -eq 0) { '0%' } else { ($LicensesLeft / $LicensesTotal).ToString("P") }
                SKU                  = $License.SkuPartNumber
                SKUAccount           = $License.AccountSkuId
                SKUID                = $License.SkuId
            }
        } else {
            [PSCustomObject] @{
                Name                = $LicenseName
                'LicensesTotal'     = $LicensesTotal
                'LicensesUsed'      = $LicensesUsed
                'LicensesLeft'      = $LicensesLeft
                'LicensesActive'    = $License.ActiveUnits
                'LicensesTrial'     = $License.WarningUnits
                'LicensesLockedOut' = $License.LockedOutUnits
                'LicensesSuspended' = $License.SuspendedUnits
                'PercentUsed'       = if ($LicensesTotal -eq 0) { '100%' } else { ($LicensesUsed / $LicensesTotal).ToString("P") }
                'PercentLeft'       = if ($LicensesTotal -eq 0) { '0%' } else { ($LicensesLeft / $LicensesTotal).ToString("P") }
                SKU                 = $License.SkuPartNumber
                SKUAccount          = $License.AccountSkuId
                SKUID               = $License.SkuId
            }
        }
    }
    return $Licenses | Sort-Object Name
}