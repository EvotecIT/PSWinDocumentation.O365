function Get-WinTeamsCalling {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )

    <#
    Identity                   : Global
    Description                :
    AllowPrivateCalling        : True
    AllowVoicemail             : UserOverride
    AllowCallGroups            : True
    AllowDelegation            : True
    AllowCallForwardingToUser  : True
    AllowCallForwardingToPhone : True
    PreventTollBypass          : False
    BusyOnBusyEnabledType      : Disabled

    Identity                   : Tag:AllowCalling
    Description                :
    AllowPrivateCalling        : True
    AllowVoicemail             : UserOverride
    AllowCallGroups            : True
    AllowDelegation            : True
    AllowCallForwardingToUser  : True
    AllowCallForwardingToPhone : True
    PreventTollBypass          : False
    BusyOnBusyEnabledType      : Disabled

    Identity                   : Tag:DisallowCalling
    Description                :
    AllowPrivateCalling        : False
    AllowVoicemail             : AlwaysDisabled
    AllowCallGroups            : False
    AllowDelegation            : False
    AllowCallForwardingToUser  : False
    AllowCallForwardingToPhone : False
    PreventTollBypass          : False
    BusyOnBusyEnabledType      : Disabled

    Identity                   : Tag:AllowCallingPreventTollBypass
    Description                :
    AllowPrivateCalling        : True
    AllowVoicemail             : UserOverride
    AllowCallGroups            : True
    AllowDelegation            : True
    AllowCallForwardingToUser  : True
    AllowCallForwardingToPhone : True
    PreventTollBypass          : True
    BusyOnBusyEnabledType      : Disabled

    Identity                   : Tag:AllowCallingPreventForwardingtoPhone
    Description                :
    AllowPrivateCalling        : True
    AllowVoicemail             : UserOverride
    AllowCallGroups            : True
    AllowDelegation            : True
    AllowCallForwardingToUser  : True
    AllowCallForwardingToPhone : False
    PreventTollBypass          : False
    BusyOnBusyEnabledType      : Disabled
    #>


    if ($Tenant) {
        $CsTeamsCallingPolicy = & "Get-$($prefix)CsTeamsCallingPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsCallingPolicy = & "Get-$($prefix)CsTeamsCallingPolicy" -Identity Global
    }

    <#
    Identity      : Global
    Description   :
    AllowCallPark : False

    Identity      : Tag:CoreCallingCallParkTestPolicyA
    Description   :
    AllowCallPark : True

    Identity      : Tag:CoreCallingCallParkTestPolicyB
    Description   :
    AllowCallPark : True
    F
    #>

    if ($Tenant) {
        $CsTeamsCallParkPolicy = & "Get-$($prefix)CsTeamsCallParkPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsCallParkPolicy = & "Get-$($prefix)CsTeamsCallParkPolicy" -Identity Global
    }
    if ($Formatted) {
        [PSCustomObject]@{
            'Description'                    = $CsTeamsCallingPolicy.Description
            'Allow Private Calling'          = $CsTeamsCallingPolicy.AllowPrivateCalling
            'Allow Voicemail'                = $CsTeamsCallingPolicy.AllowVoicemail
            'Allow CallGroups'               = $CsTeamsCallingPolicy.AllowCallGroups
            'Allow Delegation'               = $CsTeamsCallingPolicy.AllowDelegation
            'Allow Call Forwarding To User'  = $CsTeamsCallingPolicy.AllowCallForwardingToUser
            'Allow Call Forwarding To Phone' = $CsTeamsCallingPolicy.AllowCallForwardingToPhone
            'Prevent Toll Bypass'            = $CsTeamsCallingPolicy.PreventTollBypass
            'Busy On Busy EnabledType'       = $CsTeamsCallingPolicy.BusyOnBusyEnabledType
            'Allow Call Park'                = $CsTeamsCallParkPolicy.AllowCallPark
        }
    } else {
        [PSCustomObject]@{
            Description                = $CsTeamsCallingPolicy.Description
            AllowPrivateCalling        = $CsTeamsCallingPolicy.AllowPrivateCalling
            AllowVoicemail             = $CsTeamsCallingPolicy.AllowVoicemail
            AllowCallGroups            = $CsTeamsCallingPolicy.AllowCallGroups
            AllowDelegation            = $CsTeamsCallingPolicy.AllowDelegation
            AllowCallForwardingToUser  = $CsTeamsCallingPolicy.AllowCallForwardingToUser
            AllowCallForwardingToPhone = $CsTeamsCallingPolicy.AllowCallForwardingToPhone
            PreventTollBypass          = $CsTeamsCallingPolicy.PreventTollBypass
            BusyOnBusyEnabledType      = $CsTeamsCallingPolicy.BusyOnBusyEnabledType
            AllowCallPark              = $CsTeamsCallParkPolicy.AllowCallPark

        }
    }
}