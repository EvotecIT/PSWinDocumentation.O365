function Get-WinUAzureADContacts {
    param(

    )
    Get-MsolContact -All
}