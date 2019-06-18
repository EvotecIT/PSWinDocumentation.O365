function Get-WinUExchangeGroupsDistributionDynamic {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeGroupsDistributionDynamic = & "Get-$($prefix)DynamicDistributionGroup" -ResultSize unlimited
    $UExchangeGroupsDistributionDynamic
}