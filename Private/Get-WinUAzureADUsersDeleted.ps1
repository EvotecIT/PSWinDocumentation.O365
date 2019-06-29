function Get-WinUAzureADUsersDeleted {
    param(

    )
    Get-MsolUser -All
}