function Get-WinO365UAzureCompanyInformation {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $CompanyInformation = Get-MSOLCompanyInformation
    return $CompanyInformation
}

<#
ExtensionData                            : System.Runtime.Serialization.ExtensionDataObject
AllowAdHocSubscriptions                  : True
AllowEmailVerifiedUsers                  : False
AuthorizedServiceInstances               : {Bing/NA001, WhiteboardServices/NA001, SharePoint/SPOS1198, MicrosoftKaizala/NA001...}
AuthorizedServices                       : {}
City                                     : KATOWICE
CompanyDeletionStartTime                 :
CompanyTags                              : {o365.microsoft.com/version=15, o365.microsoft.com/signupexperience=GeminiSignUpUI, o365.microsoft.com/startdate=635804423434871072, azure.microsoft.com/azure=active...}
CompanyType                              : ValueAddedResellerPartnerTenant
CompassEnabled                           :
Country                                  :
CountryLetterCode                        : PL
DapEnabled                               : True
DefaultUsageLocation                     :
DirSyncApplicationType                   : 1651564e-7ce4-4d99-88be-0a65050d8dc3
DirSyncClientMachineName                 : ADCONNECT
DirSyncClientVersion                     : 1.2.65.0
DirSyncServiceAccount                    : Sync_ADCONNECT_6f0d1d4965ec@evotecpoland.onmicrosoft.com
DirectorySynchronizationEnabled          : True
DirectorySynchronizationStatus           : Enabled
DisplayName                              : Evotec
InitialDomain                            : evotecpoland.onmicrosoft.com
LastDirSyncTime                          : 30.05.2019 19:04:57
LastPasswordSyncTime                     : 30.05.2019 19:05:09
MarketingNotificationEmails              : {}
MultipleDataLocationsForServicesEnabled  :
ObjectId                                 : ceb371f6-8745-4876-a040-69f2d10a9d1a
PasswordSynchronizationEnabled           : True
PortalSettings                           : ApplicationDataRoot
PostalCode                               : 40-507
PreferredLanguage                        : en
ReleaseTrack                             : FirstRelease
ReplicationScope                         : EU
RmsViralSignUpEnabled                    : True
SecurityComplianceNotificationEmails     : {}
SecurityComplianceNotificationPhones     : {}
SelfServePasswordResetEnabled            : True
ServiceInformation                       : {Microsoft.Online.Administration.ServiceInformation, Microsoft.Online.Administration.ServiceInformation, Microsoft.Online.Administration.ServiceInformation, Microsoft.Online.Administration.ServiceInformation...}
ServiceInstanceInformation               : {Microsoft.Online.Administration.ServiceInstanceInformation, Microsoft.Online.Administration.ServiceInstanceInformation, Microsoft.Online.Administration.ServiceInstanceInformation, Microsoft.Online.Administration.ServiceInstanceInformation...}
State                                    : Śląskie
Street                                   : ul. Francuska 96b/23
SubscriptionProvisioningLimited          : False
TechnicalNotificationEmails              : {przemyslaw.klys@evotec.pl}
TelephoneNumber                          : +48502469760
UIExtensibilityUris                      :
UsersPermissionToCreateGroupsEnabled     : True
UsersPermissionToCreateLOBAppsEnabled    : True
UsersPermissionToReadOtherUsersEnabled   : True
UsersPermissionToUserConsentToAppEnabled : True
#>
