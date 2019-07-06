function Get-WinAzureGuests {
    [CmdletBinding()]
    param(
        [Array] $MsolUsers,
        [string] $Prefix,
        [string] $Splitter = ', ',
        [switch] $Formatted,
        [System.Collections.IDictionary] $Users
    )

    if (-not $MsolUsers) {
        $MsolUsers = & "Get-$($prefix)MsolUser"
    }
    <#
    ExtensionData                          : System.Runtime.Serialization.ExtensionDataObject
    AlternateEmailAddresses                : {}
    AlternateMobilePhones                  : {}
    AlternativeSecurityIds                 : {}
    BlockCredential                        : False
    City                                   : Katowice
    CloudExchangeRecipientDisplayType      : 1073741824
    Country                                : Polska
    Department                             : Biuro Zarządu
    DirSyncProvisioningErrors              : {}
    DisplayName                            : Dominika Matyszkowicz
    Errors                                 :
    Fax                                    :
    FirstName                              : Dominika
    ImmutableId                            :
    IndirectLicenseErrors                  : {}
    IsBlackberryUser                       : False
    IsLicensed                             : True
    LastDirSyncTime                        :
    LastName                               : Matyszkowicz
    LastPasswordChangeTimestamp            : 28.02.2019 07:57:31
    LicenseAssignmentDetails               : {Microsoft.Online.Administration.LicenseAssignmentDetail}
    LicenseReconciliationNeeded            : False
    Licenses                               : {evotecpoland:O365_BUSINESS_ESSENTIALS}
    LiveId                                 : 10033FFF9BF73570
    MSExchRecipientTypeDetails             :
    MSRtcSipDeploymentLocator              :
    MSRtcSipPrimaryUserAddress             :
    MobilePhone                            : +48790243098
    ObjectId                               : f4a63077-934d-43fd-af7a-ff5a70bdf8c7
    Office                                 :
    OverallProvisioningStatus              : Success
    PasswordNeverExpires                   : False
    PasswordResetNotRequiredDuringActivate :
    PhoneNumber                            :
    PortalSettings                         :
    PostalCode                             :
    PreferredDataLocation                  :
    PreferredLanguage                      : pl-PL
    ProxyAddresses                         : {SMTP:dominika.matyszkowicz@evotec.pl, smtp:dominika.matyszkowicz@evotecpoland.onmicrosoft.com}
    ReleaseTrack                           :
    ServiceInformation                     : {}
    SignInName                             : dominika.matyszkowicz@evotec.pl
    SoftDeletionTimestamp                  :
    State                                  :
    StreetAddress                          :
    StrongAuthenticationMethods            : {}
    StrongAuthenticationPhoneAppDetails    : {}
    StrongAuthenticationProofupTime        :
    StrongAuthenticationRequirements       : {}
    StrongAuthenticationUserDetails        :
    StrongPasswordRequired                 : True
    StsRefreshTokensValidFrom              : 28.02.2019 07:57:31
    Title                                  : Asystentka
    UsageLocation                          : PL
    UserLandingPageIdentifierForO365Shell  :
    UserPrincipalName                      : dominika.matyszkowicz@evotec.pl
    UserThemeIdentifierForO365Shell        :
    UserType                               : Member
    ValidationStatus                       : Healthy
    WhenCreated                            : 07.11.2016 15:24:20
    #>

    $AzureUsers = foreach ($User in $MsolUsers) {
        # Skip users, leave guets only
        if ($User.UserType -eq 'Member') {
            continue
        }
        $MFAOptions = @{ }
        $MFAOptions.AuthAvailable = @(
            foreach ($Auth in $User.StrongAuthenticationMethods) {
                if ($Auth.IsDefault) {
                    $MFAOptions.AuthDefault = $Auth.MethodType
                } else {
                    $Auth.MethodType
                }
            }
        )

        if ($Formatted) {
            [pscustomobject] @{
                'UserPrincipalName'                  = $User.UserPrincipalName
                'Display Name'                       = $User.DisplayName
                'First Name'                         = $User.FirstName
                'Last Name'                          = $User.LastName

                'Licenses'                           = Convert-Office365License -License $User.Licenses.AccountSkuID -Separator $Splitter
                'Title'                              = $User.Title
                'Emails'                             = Convert-ExchangeEmail -Emails $User.ProxyAddresses -Separator $Splitter -RemoveDuplicates -RemovePrefix -AddSeparator

                'Last Dir Sync Time'                 = $User.LastDirSyncTime
                'Last Password Change'               = $User.LastPasswordChangeTimestamp
                'Password Never Expires'             = $User.PasswordNeverExpires
                'Mobile Phone'                       = $User.MobilePhone
                'Phone Number'                       = $User.PhoneNumber
                'Office'                             = $User.Office
                'Department'                         = $User.Department
                'Portal Settings'                    = $User.PortalSettings
                'Preferred Data Location'            = $User.PreferredDataLocation
                'Preferred Language'                 = $User.PreferredLanguage

                'Release Track'                      = $User.ReleaseTrack
                'Service Information'                = $User.ServiceInformation # array - needs verification
                'Street Address'                     = $User.StreetAddress
                'Postal Code'                        = $User.PostalCode
                'State'                              = $User.State
                'City'                               = $User.City
                'Country'                            = $User.Country

                'BlockCredential'                    = $User.BlockCredential
                'CloudExchangeRecipientDisplayType'  = $User.CloudExchangeRecipientDisplayType


                'Usage Location'                     = $User.UsageLocation
                'Method Default'                     = $MFAOptions.AuthDefault
                'Method Alternative'                 = ($MFAOptions.AuthAvailable | Sort-Object) -join $Splitter
                'App Authentication Type'            = $User.StrongAuthenticationPhoneAppDetails.AuthenticationType
                'App Device Name'                    = $User.StrongAuthenticationPhoneAppDetails.DeviceName
                'App Device Tag'                     = $User.StrongAuthenticationPhoneAppDetails.DeviceTag
                'App Device Token'                   = $User.StrongAuthenticationPhoneAppDetails.DeviceToken
                'App Notification Type'              = $User.StrongAuthenticationPhoneAppDetails.NotificationType
                'App Oath Secret Key'                = $User.StrongAuthenticationPhoneAppDetails.OathSecretKey
                'App Oath Token Time Drift'          = $User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift
                'App Version'                        = $User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion

                'User Details Email'                 = $User.StrongAuthenticationUserDetails.Email
                'User Details Phone'                 = $User.StrongAuthenticationUserDetails.PhoneNumber
                'User Details Phone Alt'             = $User.StrongAuthenticationUserDetails.AlternativePhoneNumber
                'User Details Pin'                   = $User.StrongAuthenticationUserDetails.Pin
                'User Details OldPin'                = $User.StrongAuthenticationUserDetails.OldPin
                'Strong Password Required'           = $User.StrongPasswordRequired

                'Requirement Relying Party'          = $User.StrongAuthenticationRequirements.RelyingParty
                'Requirement Not Issued Before'      = $User.StrongAuthenticationRequirements.RememberDevicesNotIssuedBefore
                'Requirement State'                  = $User.StrongAuthenticationRequirements.State

                # Below needs checking...
                'Strong Authentication Proofup Time' = $User.StrongAuthenticationProofupTime
                'ObjectId'                           = $User.ObjectId.Guid
                'UserType'                           = $User.UserType
                #AlternateEmailAddresses                : { }
                #AlternateMobilePhones                  : { }
                #IsLicensed                             : False
                #MSExchRecipientTypeDetails             :
                #MSRtcSipDeploymentLocator              :
                #MSRtcSipPrimaryUserAddress             :
                #OverallProvisioningStatus              : None
                #PasswordResetNotRequiredDuringActivate :
                #StsRefreshTokensValidFrom              : 01.02.2017 18:15:12
            }
        } else {
            [pscustomobject] @{
                'UserPrincipalName'                 = $User.UserPrincipalName
                'Display Name'                      = $User.DisplayName
                FirstName                           = $User.FirstName
                LastName                            = $User.LastName
                Licenses                            = $User.Licenses
                Title                               = $User.Title
                LastDirSyncTime                     = $User.LastDirSyncTime
                LastPasswordChange                  = $User.LastPasswordChangeTimestamp
                PasswordNeverExpires                = $User.PasswordNeverExpires
                MobilePhone                         = $User.MobilePhone

                PhoneNumber                         = $User.PhoneNumber
                'Office'                            = $User.Office
                'Department'                        = $User.Department
                PortalSettings                      = $User.PortalSettings
                PreferredDataLocation               = $User.PreferredDataLocation
                PreferredLanguage                   = $User.PreferredLanguage
                'Emails'                            = $User.ProxyAddresses
                ReleaseTrack                        = $User.ReleaseTrack
                ServiceInformation                  = $User.ServiceInformation
                'StreetAddress'                     = $User.StreetAddress
                'PostalCode'                        = $User.PostalCode
                'State'                             = $User.State
                'City'                              = $User.City
                'Country'                           = $User.Country

                'BlockCredential'                   = $User.BlockCredential
                'CloudExchangeRecipientDisplayType' = $User.CloudExchangeRecipientDisplayType

                'UsageLocation'                     = $User.UsageLocation
                'MethodDefault'                     = $MFAOptions.AuthDefault
                'MethodAlternative'                 = ($MFAOptions.AuthAvailable | Sort-Object) #-join $Splitter
                'AppAuthentication Type'            = $User.StrongAuthenticationPhoneAppDetails.AuthenticationType
                'AppDeviceName'                     = $User.StrongAuthenticationPhoneAppDetails.DeviceName
                'AppDeviceTag'                      = $User.StrongAuthenticationPhoneAppDetails.DeviceTag
                'AppDeviceToken'                    = $User.StrongAuthenticationPhoneAppDetails.DeviceToken
                'AppNotificationType'               = $User.StrongAuthenticationPhoneAppDetails.NotificationType
                'AppOathSecretKey'                  = $User.StrongAuthenticationPhoneAppDetails.OathSecretKey
                'AppOathTokenTimeDrift'             = $User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift
                'AppVersion'                        = $User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion

                'UserDetailsEmail'                  = $User.StrongAuthenticationUserDetails.Email
                'UserDetailsPhone'                  = $User.StrongAuthenticationUserDetails.PhoneNumber
                'UserDetailsPhoneAlt'               = $User.StrongAuthenticationUserDetails.AlternativePhoneNumber
                'UserDetailsPin'                    = $User.StrongAuthenticationUserDetails.Pin
                'UserDetailsOldPin'                 = $User.StrongAuthenticationUserDetails.OldPin
                'StrongPasswordRequired'            = $User.StrongPasswordRequired

                'RequirementRelyingParty'           = $User.StrongAuthenticationRequirements.RelyingParty
                'RequirementNotIssuedBefore'        = $User.StrongAuthenticationRequirements.RememberDevicesNotIssuedBefore
                'RequirementState'                  = $User.StrongAuthenticationRequirements.State

                # Below needs checking...
                'StrongAuthenticationProofupTime'   = $User.StrongAuthenticationProofupTime
                'ObjectId'                          = $User.ObjectId.Guid
                'UserType'                          = $User.UserType
                #AlternateEmailAddresses                : { }
                #AlternateMobilePhones                  : { }
                #IsLicensed                             : False
                #MSExchRecipientTypeDetails             :
                #MSRtcSipDeploymentLocator              :
                #MSRtcSipPrimaryUserAddress             :
                #OverallProvisioningStatus              : None
                #PasswordResetNotRequiredDuringActivate :
                #StsRefreshTokensValidFrom              : 01.02.2017 18:15:12
            }
        }

    }
    # We're creating hashtable to provide speedy gonzales speed
    foreach ($_ in $AzureUsers) {
        $Users[$_.ObjectId] = $_
    }
    return $AzureUsers | Sort-Object 'UserPrincipalName'

}