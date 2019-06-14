function Get-WinO365UAzureADUsers {
    param(

    )
    Get-MsolUser -ReturnDeletedUsers
}