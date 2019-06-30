function Get-WinUExchangeRecipientsPermissions {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $UExchangeRecipientsPermissions = & "Get-$($prefix)RecipientPermission" -ResultSize unlimited
    return $UExchangeRecipientsPermissions
}

# Get-RecipientPermission | Where {($_.Trustee -ne 'nt authority\self') } | select Identity, Trustee, AccessRights


function Get-WinUExchangeRecipientsPermissions1 {
    [CmdletBinding()]
    param(
        [Array] $ExchangeRecipientsPermissions
    )
    <#

    Identity                                                      Trustee                         AccessControlType AccessRights Inherited
    --------                                                      -------                         ----------------- ------------ ---------
    adam.kolendo                                                  NT AUTHORITY\SELF               Allow             {SendAs}     False
    AggregateGroupMailbox.A.201708112247                          NT AUTHORITY\SELF               Allow             {SendAs}     False
    Wsparcie Alior Leasing                                        NT AUTHORITY\SELF               Allow             {SendAs}     False
    AliorLeasing_e7772951-4b0e-4f10-8f38-eae9b8f55962             przemyslaw.klys@evotec.pl       Allow             {SendAs}     False
    AliorLeasing_e7772951-4b0e-4f10-8f38-eae9b8f55962             damian.baryla@evotec.pl         Allow             {SendAs}     False
    AliorLeasing_e7772951-4b0e-4f10-8f38-eae9b8f55962             karol.ostapowicz@evotec.pl      Allow             {SendAs}     False

    Identity           : CompliancePolicyCacheMipLabel
    Trustee            : NT AUTHORITY\SELF
    AccessControlType  : Allow
    AccessRights       : {SendAs}
    IsInherited        : False
    InheritanceType    : All
    IsValid            : True
    ObjectState        : New

    Identity           : CompliancePolicyCacheOneDriveRetention
    Trustee            : NT AUTHORITY\SELF
    AccessControlType  : Allow
    AccessRights       : {SendAs}
    IsInherited        : False
    InheritanceType    : All
    IsValid            : True
    ObjectState        : New
    #>

    foreach ($_ in $ExchangeRecipientsPermissions) {
        [PSCustomObject]@{
            Identity          = $_.Identity
            Trustee           = $_.Trustee
            AccessControlType = $_.AccessControlType
            AccessRights      = $_.AccessRights
            IsInherited       = $_.IsInherited
            InheritanceType   = $_.InheritanceType
        }
    }

}

function Get-WinUExchangeRecipientsPermissionsLimited {
    [CmdletBinding()]
    param(
        [Array] $ExchangeRecipientsPermissions
    )
    $ExchangeRecipientsPermissions | Where-Object { ($_.Trustee -ne 'NT AUTHORITY\SELF') }
}