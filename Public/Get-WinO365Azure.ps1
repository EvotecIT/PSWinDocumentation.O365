﻿function Get-WinO365Azure {
    [CmdletBinding()]
    param(
        $TypesRequired
    )
    $Data = [ordered] @{}
    if ($TypesRequired -eq $null) {
        Write-Verbose 'Get-WinO365Azure - TypesRequired is null. Getting all Office 365 types.'
        $TypesRequired = Get-Types -Types ([PSWinDocumentation.O365])  # Gets all types
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureLicensing)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureLicensing (prepared data)"
        $Data.O365AzureLicensing = Get-ReportO365Licenses
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureSubscription)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureSubscription (prepared data)"
        $Data.O365AzureSubscription = Get-ReportO365Subscriptions
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @(
            [PSWinDocumentation.O365]::O365UAzureADUsers,
            [PSWinDocumentation.O365]::O365AzureADUsersMFA,
            [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountry,
            [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity,
            [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountryCity
        )) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADUsers"
        $Data.O365UAzureADUsers = Get-MsolUser -All
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UAzureADUsersDeleted)) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADUsersDeleted"
        $Data.O365UAzureADUsersDeleted = Get-MsolUser -ReturnDeletedUsers
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UAzureADGroups, [PSWinDocumentation.O365]::O365AzureADGroupMembersUser)) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADGroups"
        $Data.O365UAzureADGroups = Get-MsolGroup -All
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UAzureADGroupMembers, [PSWinDocumentation.O365]::O365AzureADGroupMembersUser)) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADGroupMembers"
        $Data.O365UAzureADGroupMembers = Invoke-Command -ScriptBlock {
            $GroupMembers = foreach ($Group in $Data.Groups) {
                $Object = Get-MsolGroupMember -GroupObjectId $Group.ObjectId -All
                $Object | Add-Member -MemberType NoteProperty -Name "GroupObjectID" -Value $Group.ObjectID
                $Object
            }
            return $GroupMembers
        }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UAzureADContacts)) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADContacts"
        $Data.O365UAzureADContacts = Get-MsolContact -All
    }
    # Below is data that is prepared entirely using data from above (suitable for Word for the most part)
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureTenantDomains)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureTenantDomains (prepared data)"
        $Data.O365AzureTenantDomains = Get-ReportO365TenantDomains
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureADGroupMembersUser)) {
        Write-Verbose "Get-WinO365Azure - Getting O365UAzureADGroupMembersUser"
        $Data.O365AzureADGroupMembersUser = Invoke-Command -ScriptBlock {
            $Members = foreach ($Group in $Data.O365UAzureADGroups) {
                $GroupMembers = $Data.O365UAzureADGroupMembers | Where-Object { $_.GroupObjectId -eq $Group.ObjectId }
                foreach ($GroupMember in $GroupMembers) {
                    [PsCustomObject] @{
                        "GroupDisplayName"    = $Group.DisplayName
                        "GroupEmail"          = $Group.EmailAddress
                        "GroupEmailSecondary" = $Group.ProxyAddresses -replace 'smtp:', '' -join ','
                        "GroupType"           = $Group.GroupType
                        "MemberDisplayName"   = $GroupMember.DisplayName
                        "MemberEmail"         = $GroupMember.EmailAddress
                        "MemberType"          = $GroupMember.GroupMemberType
                        "LastDirSyncTime"     = $Group.LastDirSyncTime
                        "ManagedBy"           = $Group.ManagedBy
                        "ProxyAddresses"      = $Group.ProxyAddresses
                    }
                }
            }
            return $Members
        }
    }

    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureADUsersMFA)) {

        $Data.O365AzureADUsersMFA = Invoke-Command -ScriptBlock {
            $AzureUsers = foreach ($User in $Data.O365UAzureADUsers) {
                $MFAOptions = @{}
                $MFAOptions.AuthAvailable = @()
                foreach ($Auth in $User.StrongAuthenticationMethods) {
                    if ($Auth.IsDefault) {
                        $MFAOptions.AuthDefault = $Auth.MethodType
                    } else {
                        $MFAOptions.AuthAvailable += $Auth.MethodType
                    }
                }

                [pscustomobject] @{
                    'UserPrincipalName'             = $User.UserPrincipalName
                    'Display Name'                  = $User.DisplayName

                    'Method Default'                = $MFAOptions.AuthDefault
                    'Method Alternative'            = ($MFAOptions.AuthAvailable | Sort-Object) -join ','


                    'App Authentication Type'       = $User.StrongAuthenticationPhoneAppDetails.AuthenticationType
                    'App Device Name'               = $User.StrongAuthenticationPhoneAppDetails.DeviceName
                    'App Device Tag'                = $User.StrongAuthenticationPhoneAppDetails.DeviceTag
                    'App Device Token'              = $User.StrongAuthenticationPhoneAppDetails.DeviceToken
                    'App Notification Type'         = $User.StrongAuthenticationPhoneAppDetails.NotificationType
                    'App Oath Secret Key'           = $User.StrongAuthenticationPhoneAppDetails.OathSecretKey
                    'App Oath Token Time Drift'     = $User.StrongAuthenticationPhoneAppDetails.OathTokenTimeDrift
                    'App Version'                   = $User.StrongAuthenticationPhoneAppDetails.PhoneAppVersion

                    'User Details Email'            = $User.StrongAuthenticationUserDetails.Email
                    'User Details Phone'            = $User.StrongAuthenticationUserDetails.PhoneNumber
                    'User Details Phone Alt'        = $User.StrongAuthenticationUserDetails.AlternativePhoneNumber
                    'User Details Pin'              = $User.StrongAuthenticationUserDetails.Pin
                    'User Details OldPin'           = $User.StrongAuthenticationUserDetails.OldPin
                    'Strong Password Required'      = $User.StrongPasswordRequired

                    'Requirement Relying Party'     = $User.StrongAuthenticationRequirements.RelyingParty
                    'Requirement Not Issued Before' = $User.StrongAuthenticationRequirements.RememberDevicesNotIssuedBefore
                    'Requirement State'             = $User.StrongAuthenticationRequirements.State

                    # Below needs checking...
                    StrongAuthenticationProofupTime = $User.StrongAuthenticationProofupTime

                }

            }
            return $AzureUsers | Sort-Object 'UserPrincipalName'
        }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountry)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureADUsersStatisticsByCountry"
        $Data.O365AzureADUsersStatisticsByCountry = $Data.O365UAzureADUsers | Group-Object Country | Select-Object @{ L = 'Country'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } }} , @{ L = 'Users Count'; Expression = { $_.Count }} | Sort-Object 'Country'
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureADUsersStatisticsByCity"
        $Data.O365AzureADUsersStatisticsByCity = $Data.O365UAzureADUsers | Group-Object City | Select-Object @{ L = 'City'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } }} , @{ L = 'Users Count'; Expression = { $_.Count }} | Sort-Object 'City'
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountryCity)) {
        Write-Verbose "Get-WinO365Azure - Getting O365AzureADUsersStatisticsByCountryCity"
        $Data.O365AzureADUsersStatisticsByCountryCity = $Data.O365UAzureADUsers |  Group-Object Country, City | Select-Object @{ L = 'Country, City'; Expression = { if ($_.Name -ne '') { $_.Name } else { 'Unknown' } }} , @{ L = 'Users Count'; Expression = { $_.Count }} | Sort-Object 'Country, City'
    }
    return $Data
}