function Get-WinUTeamsVideoInteropService {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
        Identity     : Global
        Description  :
        ProviderName : DefaultProvider
        Enabled      : False

        Identity     : Tag:PolycomServiceProviderEnabled
        Description  :
        ProviderName : Polycom
        Enabled      : True

        Identity     : Tag:BlueJeansServiceProviderEnabled
        Description  :
        ProviderName : BlueJeans
        Enabled      : True

        Identity     : Tag:PexipServiceProviderEnabled
        Description  :
        ProviderName : Pexip
        Enabled      : True

        Identity     : Tag:ServiceProviderDisabled
        Description  :
        ProviderName : DefaultProvider
        Enabled      : False
    #>
    if ($Tenant) {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsVideoInteropServicePolicy" -Tenant $Tenant -Identity Global
    } else {
        $TeamsConfiguration = & "Get-$($prefix)CsTeamsVideoInteropServicePolicy" -Identity Global
    }
    return $TeamsConfiguration
}