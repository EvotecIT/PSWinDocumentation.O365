function Get-WinAzureADUsersMFA {
    [CmdletBinding()]
    param(
        [string] $Tenant,
        [string] $Prefix,
        [Array] $UAzureADUsers,
        [switch] $Formatted,
        [string] $Splitter = ', '
    )
    if (-not $UAzureADUsers) {
        if ($Tenant) {
            $UAzureADUsers = & "Get-$($Prefix)MsolUser" -All -TenantId $Tenant
        } else {
            $UAzureADUsers = & "Get-$($Prefix)MsolUser" -All
        }
    }

    $AzureUsers = foreach ($User in $UAzureADUsers) {
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

        if ($Splitter) {
            # Where-Object { $_ } gets rid of null
            $MethodAlternative = (($MFAOptions.AuthAvailable | Sort-Object) | Where-Object { $_ }) -join $Splitter
            $AppAuthenticationType = ($User.StrongAuthenticationPhoneAppDetails.AuthenticationType | Where-Object { $_ }) -join $Splitter
            $AppDeviceName = ($User.StrongAuthenticationPhoneAppDetails.DeviceName | Where-Object { $_ }) -join $Splitter
            $AppDeviceTag = ($User.StrongAuthenticationPhoneAppDetails.DeviceTag | Where-Object { $_ }) -join $Splitter
            $AppDeviceToken = ($User.StrongAuthenticationPhoneAppDetails.DeviceToken | Where-Object { $_ }) -join $Splitter
            $AppNotificationType = ($User.StrongAuthenticationPhoneAppDetails.NotificationType | Where-Object { $_ }) -join $Splitter
            $AppOathSecretKey = ($User.StrongAuthenticationPhoneAppDetails.OathSecretKey | Where-Object { $_ }) -join $Splitter
            $AppOathTokenTimeDrift = ($User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift | Where-Object { $_ }) -join $Splitter
            $AppVersion = ($User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion | Where-Object { $_ }) -join $Splitter
        } else {
            $MethodAlternative = ($MFAOptions.AuthAvailable | Sort-Object)
            $AppAuthenticationType = $User.StrongAuthenticationPhoneAppDetails.AuthenticationType
            $AppDeviceName = $User.StrongAuthenticationPhoneAppDetails.DeviceName
            $AppDeviceTag = $User.StrongAuthenticationPhoneAppDetails.DeviceTag
            $AppDeviceToken = $User.StrongAuthenticationPhoneAppDetails.DeviceToken
            $AppNotificationType = $User.StrongAuthenticationPhoneAppDetails.NotificationType
            $AppOathSecretKey = $User.StrongAuthenticationPhoneAppDetails.OathSecretKey
            $AppOathTokenTimeDrift = $User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift
            $AppVersion = $User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion
        }

        if ($Formatted) {
            [PSCustomObject] @{
                'UserPrincipalName'               = $User.UserPrincipalName
                'Display Name'                    = $User.DisplayName

                'Method Default'                  = $MFAOptions.AuthDefault
                'Method Alternative'              = $MethodAlternative

                'App Authentication Type'         = $AppAuthenticationType
                'App Device Name'                 = $AppDeviceName
                'App Device Tag'                  = $AppDeviceTag
                'App Device Token'                = $AppDeviceToken
                'App Notification Type'           = $AppNotificationType
                'App Oath Secret Key'             = $AppOathSecretKey
                'App Oath Token Time Drift'       = $AppOathTokenTimeDrift
                'App Version'                     = $AppVersion

                'User Details Email'              = $User.StrongAuthenticationUserDetails.Email
                'User Details Phone'              = $User.StrongAuthenticationUserDetails.PhoneNumber
                'User Details Phone Alt'          = $User.StrongAuthenticationUserDetails.AlternativePhoneNumber
                'User Details Pin'                = $User.StrongAuthenticationUserDetails.Pin
                'User Details OldPin'             = $User.StrongAuthenticationUserDetails.OldPin
                'Strong Password Required'        = $User.StrongPasswordRequired

                'Requirement Relying Party'       = $User.StrongAuthenticationRequirements.RelyingParty
                'Requirement Not Issued Before'   = $User.StrongAuthenticationRequirements.RememberDevicesNotIssuedBefore
                'Requirement State'               = $User.StrongAuthenticationRequirements.State

                # Below needs checking...
                'StrongAuthenticationProofupTime' = $User.StrongAuthenticationProofupTime
            }
        } else {
            [PSCustomObject] @{
                'UserPrincipalName'               = $User.UserPrincipalName
                'DisplayName'                     = $User.DisplayName

                'MethodDefault'                   = $MFAOptions.AuthDefault
                'MethodAlternative'               = $MethodAlternative


                'AppAuthenticationType'           = $AppAuthenticationType
                'AppDeviceName'                   = $AppDeviceName
                'AppDeviceTag'                    = $AppDeviceTag
                'AppDeviceToken'                  = $AppDeviceToken
                'AppNotificationType'             = $AppNotificationType
                'AppOathSecretKey'                = $AppOathSecretKey
                'AppOathTokenTimeDrift'           = $AppOathTokenTimeDrift
                'AppVersion'                      = $AppVersion

                'UserDetailsEmail'                = $User.StrongAuthenticationUserDetails.Email
                'UserDetailsPhone'                = $User.StrongAuthenticationUserDetails.PhoneNumber
                'UserDetailsPhoneAlt'             = $User.StrongAuthenticationUserDetails.AlternativePhoneNumber
                'UserDetailsPin'                  = $User.StrongAuthenticationUserDetails.Pin
                'UserDetailsOldPin'               = $User.StrongAuthenticationUserDetails.OldPin
                'StrongPasswordRequired'          = $User.StrongPasswordRequired

                'RequirementRelyingParty'         = $User.StrongAuthenticationRequirements.RelyingParty
                'RequirementNotIssuedBefore'      = $User.StrongAuthenticationRequirements.RememberDevicesNotIssuedBefore
                'RequirementState'                = $User.StrongAuthenticationRequirements.State

                # Below needs checking...
                'StrongAuthenticationProofupTime' = $User.StrongAuthenticationProofupTime

            }
        }
    }
    return $AzureUsers | Sort-Object 'UserPrincipalName'
}