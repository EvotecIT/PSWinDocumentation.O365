function Get-WinO365UExchangeUnifiedGroups {
    [CmdletBinding()]
    param(

    )
    $ExchangeUnifiedGroups = Get-UnifiedGroup -ResultSize Unlimited -IncludeAllProperties
    $ExchangeUnifiedGroups
}