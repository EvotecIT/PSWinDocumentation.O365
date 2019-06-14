function Get-WinO365UExchangeGroupsDistribution {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeGroupsDistribution = & "Get-$($prefix)DistributionGroup" -ResultSize unlimited
    return $O365UExchangeGroupsDistribution
}