function Get-WinO365UAzureADGroups {
    [CmdletBinding()]
    param(

    )
    Get-MsolGroup -All
}