function Get-WinUAzureADGroupMembers{
    [CmdletBinding()]
    param(
        [Array] $UAzureADGroups
    )
    $GroupMembers = foreach ($Group in $UAzureADGroups) {
        $Object = Get-MsolGroupMember -GroupObjectId $Group.ObjectId -All
        $Object | Add-Member -MemberType NoteProperty -Name "GroupObjectID" -Value $Group.ObjectID
        $Object
    }
    $GroupMembers
}


