function Get-WinO365AzureADUsersStatisticsByCity {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADUsers
    )
    $O365UAzureADUsers | Group-Object City | Select-Object @{ L = 'City'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } } } , @{ L = 'Users Count'; Expression = { $_.Count } } | Sort-Object 'City'
}