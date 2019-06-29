function Get-WinUExchangeUnifiedGroups {
    [CmdletBinding()]
    param(

    )
    $ExchangeUnifiedGroups = Get-UnifiedGroup -ResultSize Unlimited -IncludeAllProperties
    $ExchangeUnifiedGroups
}