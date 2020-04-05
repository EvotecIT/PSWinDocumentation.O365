function Get-WinUAzureCompany {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix
    )
    if ($Tenant) {
        $Msol = & "Get-$($prefix)MsolCompanyInformation" -TenantId $Tenant
    } else {
        $Msol = & "Get-$($prefix)MsolCompanyInformation"
    }
    $Msol
}

<#
DisplayName                              :
PreferredLanguage                        : en
Street                                   :
City                                     :
State                                    :
PostalCode                               :
Country                                  :
CountryLetterCode                        : PL
TelephoneNumber                          :
MarketingNotificationEmails              : {}
TechnicalNotificationEmails              : {}
SelfServePasswordResetEnabled            : True
UsersPermissionToCreateGroupsEnabled     : True
UsersPermissionToCreateLOBAppsEnabled    : True
UsersPermissionToReadOtherUsersEnabled   : True
UsersPermissionToUserConsentToAppEnabled : False
DirectorySynchronizationEnabled          : False
DirSyncServiceAccount                    :
LastDirSyncTime                          :
LastPasswordSyncTime                     :
PasswordSynchronizationEnabled           : False

#>