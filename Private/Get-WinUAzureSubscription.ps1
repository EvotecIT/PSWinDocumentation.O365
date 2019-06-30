function Get-WinUAzureSubscription {
    [CmdletBinding()]
    param(

    )
    $UAzureSubscription = Get-MsolSubscription
    return $UAzureSubscription
}