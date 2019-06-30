function Get-WinUTeamsConfiguration {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant
    )
    <#
        Identity                         : Global
        AllowEmailIntoChannel            : True
        RestrictedSenderList             :
        AllowDropBox                     : True
        AllowBox                         : True
        AllowGoogleDrive                 : True
        AllowShareFile                   : True
        AllowOrganizationTab             : True
        AllowSkypeBusinessInterop        : True
        ContentPin                       : RequiredOutsideScheduleMeeting
        AllowResourceAccountSendMessage  : True
        ResourceAccountContentAccess     : NoAccess
        AllowGuestUser                   : False
        AllowScopedPeopleSearchandAccess : False
    #>
    if ($Tenant) {
        $CsTeamsClientConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Tenant $Tenant -Identity Global
    } else {
        $CsTeamsClientConfiguration = & "Get-$($prefix)CsTeamsClientConfiguration" -Identity Global
    }
    return $CsTeamsClientConfiguration
}