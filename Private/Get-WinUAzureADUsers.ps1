function Get-WinUAzureADUsers {
    param(

    )
    Get-MsolUser -ReturnDeletedUsers
}