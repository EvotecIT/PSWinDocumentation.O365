function Get-WinTeamsSettingsCalling {
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
    #>

    if ($Tenant) {
        $CsTeamsCallParkPolicy = & "Get-$($prefix)CsTeamsCallParkPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsCallParkPolicy = & "Get-$($prefix)CsTeamsCallParkPolicy" -Identity Global
    }
    if ($Formatted) {
        [ordered]@{
            'Allow Private Calling'          = $CsTeamsCallingPolicy.AllowPrivateCalling
            'Allow Voicemail'                = Format-AddSpaceToSentence -Text $CsTeamsCallingPolicy.AllowVoicemail
            'Allow Call Groups'               = $CsTeamsCallingPolicy.AllowCallGroups
            'Allow Delegation'               = $CsTeamsCallingPolicy.AllowDelegation
            'Allow Call Forwarding to User'  = $CsTeamsCallingPolicy.AllowCallForwardingToUser
            'Allow Call Forwarding to Phone' = $CsTeamsCallingPolicy.AllowCallForwardingToPhone
            'Prevent Toll Bypass'            = $CsTeamsCallingPolicy.PreventTollBypass
            'Busy on Busy EnabledType'       = $CsTeamsCallingPolicy.BusyOnBusyEnabledType
            'Allow Call Park'                = $CsTeamsCallParkPolicy.AllowCallPark
            'Description'                    = $CsTeamsCallingPolicy.Description
        }
    } else {
        [ordered]@{
            AllowPrivateCalling        = $CsTeamsCallingPolicy.AllowPrivateCalling
            AllowVoicemail             = $CsTeamsCallingPolicy.AllowVoicemail
            AllowCallGroups            = $CsTeamsCallingPolicy.AllowCallGroups
            AllowDelegation            = $CsTeamsCallingPolicy.AllowDelegation
            AllowCallForwardingToUser  = $CsTeamsCallingPolicy.AllowCallForwardingToUser
            AllowCallForwardingToPhone = $CsTeamsCallingPolicy.AllowCallForwardingToPhone
            PreventTollBypass          = $CsTeamsCallingPolicy.PreventTollBypass
            BusyOnBusyEnabledType      = $CsTeamsCallingPolicy.BusyOnBusyEnabledType
            AllowCallPark              = $CsTeamsCallParkPolicy.AllowCallPark
            Description                = $CsTeamsCallingPolicy.Description
        }
    }
}