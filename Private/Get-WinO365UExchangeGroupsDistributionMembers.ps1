function Get-WinO365UExchangeGroupsDistributionMembers {
    [CmdletBinding()]
    param(
        [Array] $O365UExchangeGroupsDistribution,
        [string] $Prefix
    )
    $GroupMembers = @(
        foreach ($Group in $O365UExchangeGroupsDistribution) {
            $Object = & "Get-$($prefix)DistributionGroupMember" -Identity $Group.PrimarySmtpAddress -ResultSize unlimited
            $Object | Add-Member -MemberType NoteProperty -Name "GroupGUID" -Value $Group.GUID
            $Object | Add-Member -MemberType NoteProperty -Name "GroupPrimarySmtpAddress" -Value $Group.PrimarySmtpAddress
            $Object | Add-Member -MemberType NoteProperty -Name "GroupIdentity" -Value $Group.Identity
            $Object
        }
    )
    return $GroupMembers
}
