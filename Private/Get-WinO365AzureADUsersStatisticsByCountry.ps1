function Get-WinAzureADUsersStatisticsByCountry {
    [CmdletBinding()]
    param(
        [Array] $UAzureADUsers
    )
    $UAzureADUsers | Group-Object Country | Select-Object @{ L = 'Country'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } } } , @{ L = 'Users Count'; Expression = { $_.Count } } | Sort-Object 'Country'
}