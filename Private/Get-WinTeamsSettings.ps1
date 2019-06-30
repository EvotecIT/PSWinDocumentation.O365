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
    if ($Formatted) {
        [ordered]@{
            #Identity                         = $TeamsConfiguration.Identity
            'Allow Email into Channel'            = $TeamsConfiguration.AllowEmailIntoChannel
            'Restricted Sender List'              = $TeamsConfiguration.RestrictedSenderList
            'Allow Organization Tab'              = $TeamsConfiguration.AllowOrganizationTab
            'Allow Skype for Business Interop'    = $TeamsConfiguration.AllowSkypeBusinessInterop
            'Content Pin'                         = Format-AddSpaceToSentence -Text $TeamsConfiguration.ContentPin
            'Allow Resource Account Send Message' = $TeamsConfiguration.AllowResourceAccountSendMessage
            'Resource Account Content Access'     = Format-AddSpaceToSentence -Text $TeamsConfiguration.ResourceAccountContentAccess
            'Allow Guest User'                    = $TeamsConfiguration.AllowGuestUser
            'Allow Scoped People Search'          = $TeamsConfiguration.AllowScopedPeopleSearchandAccess
        }
    } else {
        [ordered]@{
            #Identity                         = $TeamsConfiguration.Identity
            AllowEmailIntoChannel            = $TeamsConfiguration.AllowEmailIntoChannel
            RestrictedSenderList             = $TeamsConfiguration.RestrictedSenderList
            AllowOrganizationTab             = $TeamsConfiguration.AllowOrganizationTab
            AllowSkypeBusinessInterop        = $TeamsConfiguration.AllowSkypeBusinessInterop
            ContentPin                       = $TeamsConfiguration.ContentPin
            AllowResourceAccountSendMessage  = $TeamsConfiguration.AllowResourceAccountSendMessage
            ResourceAccountContentAccess     = $TeamsConfiguration.ResourceAccountContentAccess
            AllowGuestUser                   = $TeamsConfiguration.AllowGuestUser
            AllowScopedPeopleSearchandAccess = $TeamsConfiguration.AllowScopedPeopleSearchandAccess
        }
    }
}