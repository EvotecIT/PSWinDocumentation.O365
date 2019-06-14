function Get-WinO365AzureADUsersStatisticsByCountry {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADUsers
    )
    $O365UAzureADUsers | Group-Object Country | Select-Object @{ L = 'Country'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } } } , @{ L = 'Users Count'; Expression = { $_.Count } } | Sort-Object 'Country'
}