function Get-WinO365UExchangeGroupsDistributionDynamic {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeGroupsDistributionDynamic = & "Get-$($prefix)DynamicDistributionGroup" -ResultSize unlimited
    $O365UExchangeGroupsDistributionDynamic
}