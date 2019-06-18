function Get-WinUAzureLicensing {
    [CmdletBinding()]
    param(

    )
    $UAzureLicensing = Get-MsolAccountSku
    return $UAzureLicensing
}