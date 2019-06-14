function Get-WinO365UAzureSubscription {
    [CmdletBinding()]
    param(

    )
    $O365UAzureSubscription = Get-MsolSubscription
    return $O365UAzureSubscription
}