function Get-WinUExchangeRecipientsPermissions {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeRecipientsPermissions = & "Get-$($prefix)RecipientPermission" -ResultSize unlimited
    return $UExchangeRecipientsPermissions
}