function Get-WinTeamsSettingsEducationAppPolicy {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted
    )
    <#
    Identity                : Global
    ParentDigestEnabledType : Disabled
    MakeCodeEnabledType     : Disabled
    TurnItInEnabledType     : Disabled
    TurnItInApiUrl          :
    TurnItInApiKey          :

    #>
    if ($Tenant) {
        $CsTeamsEducationAssignmentsAppPolicy = & "Get-$($prefix)CsTeamsEducationAssignmentsAppPolicy" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsEducationAssignmentsAppPolicy = & "Get-$($prefix)CsTeamsEducationAssignmentsAppPolicy" -Identity Global
    }

    if ($Formatted) {
        [ordered]@{
            'Parent Digest Enabled Type' = $CsTeamsEducationAssignmentsAppPolicy.ParentDigestEnabledType
            'Make Code Enabled Type'     = $CsTeamsEducationAssignmentsAppPolicy.MakeCodeEnabledType
            'Turn It In Enabled Type'    = $CsTeamsEducationAssignmentsAppPolicy.TurnItInEnabledType
            'Turn It In Api Url'         = $CsTeamsEducationAssignmentsAppPolicy.TurnItInApiUrl
            'Turn It In Api Key'         = $CsTeamsEducationAssignmentsAppPolicy.TurnItInApiKey
        }
    } else {
        [ordered]@{
            ParentDigestEnabledType = $CsTeamsEducationAssignmentsAppPolicy.ParentDigestEnabledType
            MakeCodeEnabledType     = $CsTeamsEducationAssignmentsAppPolicy.MakeCodeEnabledType
            TurnItInEnabledType     = $CsTeamsEducationAssignmentsAppPolicy.TurnItInEnabledType
            TurnItInApiUrl          = $CsTeamsEducationAssignmentsAppPolicy.TurnItInApiUrl
            TurnItInApiKey          = $CsTeamsEducationAssignmentsAppPolicy.TurnItInApiKey
        }
    }
}