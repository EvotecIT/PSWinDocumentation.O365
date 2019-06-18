function Get-WinUAzureADGroups {
    [CmdletBinding()]
    param(

    )
    Get-MsolGroup -All
}