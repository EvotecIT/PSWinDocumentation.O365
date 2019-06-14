function Get-WinO365UAzureADContacts {
    param(

    )
    Get-MsolContact -All
}