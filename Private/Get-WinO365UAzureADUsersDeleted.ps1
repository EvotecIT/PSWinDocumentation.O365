function Get-WinO365UAzureADUsersDeleted {
    param(

    )
    Get-MsolUser -All
}