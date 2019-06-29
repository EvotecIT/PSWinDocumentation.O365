function Get-WinTeamsFileSharing {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [Array] $TeamsConfiguration,
        [switch] $Formatted
    )
    if (-not $TeamsConfiguration) {
        #$TeamsConfiguration = Get-CsTeamsClientConfiguration
        if ($Tenant) {
            $TeamsConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Tenant $Tenant -Identity Global
        } else {
            $TeamsConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Identity Global
        }
    }
    foreach ($_ in $TeamsConfiguration) {
        if ($Formatted) {
            [PSCustomObject]@{
                'Allow DropBox'     = $_.AllowDropBox
                'Allow Box'         = $_.AllowBox
                'Allow GoogleDrive' = $_.AllowGoogleDrive
                'Allow Share File'  = $_.AllowShareFile
            }
        } else {
            [PSCustomObject]@{
                AllowDropBox     = $_.AllowDropBox
                AllowBox         = $_.AllowBox
                AllowGoogleDrive = $_.AllowGoogleDrive
                AllowShareFile   = $_.AllowShareFile
            }
        }
    }
}