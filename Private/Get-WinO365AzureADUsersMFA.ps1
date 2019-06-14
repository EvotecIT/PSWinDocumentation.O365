function Get-WinO365AzureADUsersMFA {
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADUsers,
        [Array] $O365UAzureADGroupMembers
    )
    $AzureUsers = foreach ($User in $O365UAzureADUsers) {
        $MFAOptions = @{ }
        $MFAOptions.AuthAvailable = @(
        foreach ($Auth in $User.StrongAuthenticationMethods) {
            if ($Auth.IsDefault) {
                $MFAOptions.AuthDefault = $Auth.MethodType
            } else {
                $MFAOptions.AuthAvailable += $Auth.MethodType
            }
        }
        )

        [pscustomobject] @{
            'UserPrincipalName'               = $User.UserPrincipalName
            'Display Name'                    = $User.DisplayName

            'Method Default'                  = $MFAOptions.AuthDefault
            'Method Alternative'              = ($MFAOptions.AuthAvailable | Sort-Object) -join ','


            'App Authentication Type'         = $User.StrongAuthenticationPhoneAppDetails.AuthenticationType
            'App Device Name'                 = $User.StrongAuthenticationPhoneAppDetails.DeviceName
            'App Device Tag'                  = $User.StrongAuthenticationPhoneAppDetails.DeviceTag
            'App Device Token'                = $User.StrongAuthenticationPhoneAppDetails.DeviceToken
            'App Notification Type'           = $User.StrongAuthenticationPhoneAppDetails.NotificationType
            'App Oath Secret Key'             = $User.StrongAuthenticationPhoneAppDetails.OathSecretKey
            'App Oath Token Time Drift'       = $User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift
            'App Version'                     = $User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion

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

    }
    return $AzureUsers | Sort-Object 'UserPrincipalName'
}