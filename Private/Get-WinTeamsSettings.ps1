function Get-WinTeamsSettings {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [Array] $TeamsConfiguration,
        [switch] $Formatted
    )
    if (-not $TeamsConfiguration) {
        #$TeamsConfiguration = Get-CsTeamsClientConfiguration
        if ($Tenant) {
            $TeamsConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Tenant $Tenant -Identity Global
        } else {
            $TeamsConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Identity Global
        }
    }
    foreach ($_ in $TeamsConfiguration) {
        if ($Formatted) {
            [PSCustomObject]@{
                #Identity                         = $_.Identity
                'Allow EmailInto Channel'             = $_.AllowEmailIntoChannel
                'Restricted Sender List'              = $_.RestrictedSenderList
                'Allow Organization Tab'              = $_.AllowOrganizationTab
                'Allow SkypeBusiness Interop'         = $_.AllowSkypeBusinessInterop
                'Content Pin'                         = Format-AddSpaceToSentence -Text $_.ContentPin
                'Allow Resource Account Send Message' = $_.AllowResourceAccountSendMessage
                'Resource Account Content Access'     = Format-AddSpaceToSentence -Text $_.ResourceAccountContentAccess
                'Allow Guest User'                    = $_.AllowGuestUser
                'Allow Scoped People Search'          = $_.AllowScopedPeopleSearchandAccess
            }
        } else {
            [PSCustomObject]@{
                #Identity                         = $_.Identity
                AllowEmailIntoChannel            = $_.AllowEmailIntoChannel
                RestrictedSenderList             = $_.RestrictedSenderList
                AllowOrganizationTab             = $_.AllowOrganizationTab
                AllowSkypeBusinessInterop        = $_.AllowSkypeBusinessInterop
                ContentPin                       = Format-AddSpaceToSentence -Text $_.ContentPin
                AllowResourceAccountSendMessage  = $_.AllowResourceAccountSendMessage
                ResourceAccountContentAccess     = Format-AddSpaceToSentence -Text $_.ResourceAccountContentAccess
                AllowGuestUser                   = $_.AllowGuestUser
                AllowScopedPeopleSearchandAccess = $_.AllowScopedPeopleSearchandAccess
            }
        }
    }
}