function Get-WinO365UAzureADGroupMembers{
    [CmdletBinding()]
    param(
        [Array] $O365UAzureADGroups
    )
    $GroupMembers = foreach ($Group in $O365UAzureADGroups) {
        $Object = Get-MsolGroupMember -GroupObjectId $Group.ObjectId -All
        $Object | Add-Member -MemberType NoteProperty -Name "GroupObjectID" -Value $Group.ObjectID
        $Object
    }
    $GroupMembers
}


