function Get-WinAzureADUsersStatisticsByCountryCity {
    [CmdletBinding()]
    param(
        [Array] $UAzureADUsers
    )
    $UAzureADUsers | Group-Object Country, City | Select-Object @{ L = 'Country, City'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } } } , @{ L = 'Users Count'; Expression = { $_.Count } } | Sort-Object 'Country, City'
}