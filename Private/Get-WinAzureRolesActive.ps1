function Get-WinAzureRolesActiveOnly {
    [CmdletBinding()]
    param(
        [Array] $AzureRoles,
        [switch] $Formatted
    )
    $Roles = foreach ($_ in $AzureRoles) {
        if ($Formatted) {
            if ($_.'Member Count' -eq 0 -and $_.'Guests Count' -eq 0) {
                continue
            }
        } else {
            if ($_.'MemberCount' -eq 0 -and $_.'GuestsCount' -eq 0) {
                continue
            }
        }
        $_
    }
    $Roles
}