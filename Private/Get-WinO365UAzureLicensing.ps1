function Get-WinO365UAzureLicensing {
    [CmdletBinding()]
    param(

    )
    $O365UAzureLicensing = Get-MsolAccountSku
    return $O365UAzureLicensing
}