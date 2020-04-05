function Get-WinAzurePasswordPolicy {
    [CmdletBinding()]
    param(
        [Array] $MsolDomains,
        [switch] $Formatted,
        [string] $Tenant,
        [string] $Splitter,
        [string] $Prefix
    )
    [Array] $Domain = $MsolDomains | Where-Object { $_.Name -like '*.onmicrosoft.com' }

    if ($Tenant) {
        $PasswordPolicy = & "Get-$($Prefix)MsolPasswordPolicy" -DomainName $Domain[0].Name -TenantId $Tenant
    } else {
        $PasswordPolicy = & "Get-$($Prefix)MsolPasswordPolicy" -DomainName $Domain[0].Name
    }
    if ($Formatted) {
        [PSCustomObject] @{
            'Notification Days' = $PasswordPolicy.NotificationDays
            'Validity Period'   = if ($PasswordPolicy.ValidityPeriod -eq 2147483647) { 'Never Expire' } else { $PasswordPolicy.ValidityPeriod }
        }
    } else {
        [PSCustomObject] @{
            NotificationDays = $PasswordPolicy.NotificationDays
            ValidityPeriod   = if ($PasswordPolicy.ValidityPeriod -eq 2147483647) { 'NeverExpire' } else { $PasswordPolicy.ValidityPeriod }
        }
    }
    <#
    ValidityPeriod. Specifies the length of time that a password is valid before it must be changed. A null value indicates the default value of 90 days will be used.
    NotificationDays. Specifies the number of days before a user receives notification that their password will expire. A null value indicates the default of 14 days will be used.
    #>
}