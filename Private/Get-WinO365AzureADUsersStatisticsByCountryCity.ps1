function Get-WinO365AzureADUsersStatisticsByCountryCity {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADUsers
    )
    $O365UAzureADUsers | Group-Object Country, City | Select-Object @{ L = 'Country, City'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } } } , @{ L = 'Users Count'; Expression = { $_.Count } } | Sort-Object 'Country, City'
}