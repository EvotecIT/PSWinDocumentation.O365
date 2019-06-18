function Get-WinUExchangeGroupsDistribution {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeGroupsDistribution = & "Get-$($prefix)DistributionGroup" -ResultSize unlimited
    return $UExchangeGroupsDistribution
}