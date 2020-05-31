function Get-WinAzureSettings {
    [CmdletBinding()]
    param(
        [Array] $UAzureCompany,
        [switch] $Formatted,
        [string] $Splitter
    )
    if ($null -eq $UAzureCompany) {
        $UAzureCompany = Get-WinUAzureCompany
    }


    if ($Formatted) {
        [PSCustomObject] @{
            'SelfServePasswordResetEnabled'            = $UAzureCompany.SelfServePasswordResetEnabled             # : True
            'UsersPermissionToCreateGroupsEnabled'     = $UAzureCompany.UsersPermissionToCreateGroupsEnabled      # : True
            'UsersPermissionToCreateLOBAppsEnabled'    = $UAzureCompany.UsersPermissionToCreateLOBAppsEnabled     # : True
            'UsersPermissionToReadOtherUsersEnabled'   = $UAzureCompany.UsersPermissionToReadOtherUsersEnabled    # : True
            'UsersPermissionToUserConsentToAppEnabled' = $UAzureCompany.UsersPermissionToUserConsentToAppEnabled  # : False
        }
    } else {
        [PSCustomObjects] @{
            SelfServePasswordResetEnabled            = $UAzureCompany.SelfServePasswordResetEnabled             # : True
            UsersPermissionToCreateGroupsEnabled     = $UAzureCompany.UsersPermissionToCreateGroupsEnabled      # : True
            UsersPermissionToCreateLOBAppsEnabled    = $UAzureCompany.UsersPermissionToCreateLOBAppsEnabled     # : True
            UsersPermissionToReadOtherUsersEnabled   = $UAzureCompany.UsersPermissionToReadOtherUsersEnabled    # : True
            UsersPermissionToUserConsentToAppEnabled = $UAzureCompany.UsersPermissionToUserConsentToAppEnabled  # : False
        }
    }
}
