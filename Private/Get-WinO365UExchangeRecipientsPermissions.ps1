function Get-WinO365UExchangeRecipientsPermissions {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $O365UExchangeRecipientsPermissions = & "Get-$($prefix)RecipientPermission" -ResultSize unlimited
    return $O365UExchangeRecipientsPermissions
}