﻿function Get-WinO365 {
    [CmdletBinding()]
    param(
        [PSWinDocumentation.O365[]] $TypesRequired,
        [string] $Prefix,
        [validateset("Bytes", "KB", "MB", "GB", "TB")][string]$SizeIn = 'MB',
        [alias('Precision')][int]$SizePrecision = 2
    )
    $TimeToGenerate = Start-TimeLog

    if ($null -eq $TypesRequired) {
        Write-Verbose 'Get-WinO365 - TypesRequired is null. Getting all.'
        $TypesRequired = Get-Types -Types ([PSWinDocumentation.O365])
    } # Gets all types

    if ($SkipAvailability) {
        $Commands = Test-AvailabilityCommands -Commands "Get-$($Prefix)Mailbox", "Get-$($Prefix)MsolUser", "Get-$($Prefix)MailboxStatistics"
        if ($Commands -contains $false) {
            Write-Warning "Get-WinO365 - One of commands Get-$($Prefix)Mailbox, Get-$($Prefix)MsolUser, Get-$($Prefix)MailboxStatistics is not available. Make sure connectivity to Office 365 exists."
            return
        }
    }

    $Data = @{ }

    # MSOnline
    $Data.UAzureADUsers = Get-DataInformation -Text "Getting O365 information - UAzureADUsers" {
        Get-WinUAzureADUsers  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADUsers
        [PSWinDocumentation.O365]::AzureADUsersMFA
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountry
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCity
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountryCity
        [PSWinDocumentation.O365]::ExchangeMailboxes
    )
    $Data.UAzureADUsersDeleted = Get-DataInformation -Text "Getting O365 information - UAzureADUsersDeleted" {
        Get-WinUAzureADUsersDeleted  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADUsersDeleted
    )
    $Data.UAzureADContacts = Get-DataInformation -Text "Getting O365 information - UAzureADContacts" {
        Get-WinUAzureADContacts  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADContacts
    )
    $Data.UAzureLicensing = Get-DataInformation -Text "Getting O365 information - UAzureLicensing" {
        Get-WinUAzureLicensing  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureLicensing
        [PSWinDocumentation.O365]::AzureLicensing
    )
    $Data.UAzureSubscription = Get-DataInformation -Text "Getting O365 information - UAzureSubscription" {
        Get-WinUAzureSubscription  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureSubscription
    )
    $Data.UAzureTenantDomains = Get-DataInformation -Text "Getting O365 information - UAzureTenantDomains" {
        Get-WinUAzureTenantDomains  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureTenantDomains
        [PSWinDocumentation.O365]::AzureTenantDomains
    )
    $Data.UAzureADGroups = Get-DataInformation -Text "Getting O365 information - UAzureADGroups" {
        Get-WinUAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADGroups
        [PSWinDocumentation.O365]::UAzureADGroupMembers
        [PSWinDocumentation.O365]::AzureADGroupMembersUser
    )
    $Data.UAzureADGroupMembers = Get-DataInformation -Text "Getting O365 information - UAzureADGroupMembers" {
        Get-WinUAzureADGroupMembers -UAzureADGroups $Data.UAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADGroupMembers
        [PSWinDocumentation.O365]::AzureADGroupMembersUser
    )
    $Data.AzureADGroupMembersUser = Get-DataInformation -Text "Getting O365 information - AzureADGroupMembersUser" {
        Get-WinUAzureADGroupMembers -UAzureADGroups $Data.UAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADGroupMembersUser
    )
    $Data.AzureADUsersMFA = Get-DataInformation -Text "Getting O365 information - AzureADUsersMFA" {
        Get-WinAzureADUsersMFA -UAzureADUsers $Data.UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADUsersMFA
    )
    $Data.AzureADUsersStatisticsByCountry = Get-DataInformation -Text "Getting O365 information - AzureADUsersStatisticsByCountry" {
        Get-WinAzureADUsersStatisticsByCountry -UAzureADUsers $Data.UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountry
    )
    $Data.AzureADUsersStatisticsByCity = Get-DataInformation -Text "Getting O365 information - AzureADUsersStatisticsByCity" {
        Get-WinAzureADUsersStatisticsByCity -UAzureADUsers $Data.UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCity
    )
    $Data.AzureADUsersStatisticsByCountryCity = Get-DataInformation -Text "Getting O365 information - AzureADUsersStatisticsByCountryCity" {
        Get-WinAzureADUsersStatisticsByCountryCity -UAzureADUsers $Data.UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountryCity
    )
    ## Microsoft Exchange
    $Data.UExchangeMailBoxes = Get-DataInformation -Text "Getting O365 information - UExchangeMailBoxes" {
        Get-WinUExchangeMailBoxes -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailBoxes
        [PSWinDocumentation.O365]::UExchangeMailboxesJunk
        [PSWinDocumentation.O365]::UExchangeMailboxesRooms
        [PSWinDocumentation.O365]::UExchangeMailboxesEquipment
        [PSWinDocumentation.O365]::UExchangeMailboxesInboxRules
        [PSWinDocumentation.O365]::ExchangeMailboxesInboxRulesForwarding
        [PSWinDocumentation.O365]::ExchangeMailboxesStatistics
        [PSWinDocumentation.O365]::ExchangeMailboxesStatisticsArchive
        [PSWinDocumentation.O365]::ExchangeMailboxes
    )
    $Data.UExchangeMailUsers = Get-DataInformation -Text "Getting O365 information - UExchangeMailUsers" {
        Get-WinUExchangeMailUsers -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailUsers
    )
    $Data.UExchangeUsers = Get-DataInformation -Text "Getting O365 information - UExchangeUsers" {
        Get-WinUExchangeUsers -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeUsers
    )
    $Data.UExchangeRecipients = Get-DataInformation -Text "Getting O365 information - UExchangeRecipients" {
        Get-WinUExchangeRecipients -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeRecipients
    )
    $Data.UExchangeRecipientsPermissions = Get-DataInformation -Text "Getting O365 information - UExchangeRecipientsPermissions" {
        Get-WinUExchangeRecipientsPermissions -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeRecipientsPermissions
    )
    $Data.UExchangeGroupsDistribution = Get-DataInformation -Text "Getting O365 information - UExchangeGroupsDistribution" {
        Get-WinUExchangeGroupsDistribution -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeGroupsDistribution
        [PSWinDocumentation.O365]::UExchangeGroupsDistributionMembers
        [PSWinDocumentation.O365]::ExchangeDistributionGroups
        [PSWinDocumentation.O365]::ExchangeDistributionGroupsMembers
    )
    $Data.UExchangeGroupsDistributionDynamic = Get-DataInformation -Text "Getting O365 information - UExchangeGroupsDistributionDynamic" {
        Get-WinUExchangeGroupsDistributionDynamic -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeGroupsDistributionDynamic
    )
    $Data.UExchangeGroupsDistributionMembers = Get-DataInformation -Text "Getting O365 information - UExchangeGroupsDistributionMembers" {
        Get-WinUExchangeGroupsDistributionMembers -Prefix $Prefix -UExchangeGroupsDistribution $Data.UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeGroupsDistributionMembers
    )
    $Data.UExchangeMailboxesJunk = Get-DataInformation -Text "Getting O365 information - UExchangeMailboxesJunk" {
        Get-WinUExchangeMailboxesJunk -Prefix $Prefix -UExchangeMailBoxes $Data.UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailboxesJunk
    )
    $Data.UExchangeContacts = Get-DataInformation -Text "Getting O365 information - UExchangeContacts" {
        Get-WinUExchangeContacts -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeContacts
    )
    $Data.UExchangeMailboxesInboxRules = Get-DataInformation -Text "Getting O365 information - UExchangeMailboxesInboxRules" {
        Get-WinUExchangeMailboxesInboxRules -Prefix $Prefix -UExchangeMailBoxes $Data.UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailboxesInboxRules
        [PSWinDocumentation.O365]::ExchangeMailboxesInboxRulesForwarding
    )
    $Data.UExchangeContactsMail = Get-DataInformation -Text "Getting O365 information - UExchangeContactsMail" {
        Get-WinUExchangeContactsMail -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeContactsMail
    )
    $Data.UExchangeMailboxesRooms = Get-DataInformation -Text "Getting O365 information - UExchangeMailboxesRooms" {
        Get-WinUExchangeMailboxesRooms -UExchangeMailBoxes $UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailboxesRooms
        [PSWinDocumentation.O365]::UExchangeRoomsCalendarProcessing
    )
    $Data.UExchangeMailboxesEquipment = Get-DataInformation -Text "Getting O365 information - UExchangeMailboxesEquipment" {
        Get-WinUExchangeMailboxesEquipment  -UExchangeMailBoxes $UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeMailboxesEquipment
        [PSWinDocumentation.O365]::UExchangeEquipmentCalendarProcessing
    )
    $Data.UExchangeRoomsCalendarProcessing = Get-DataInformation -Text "Getting O365 information - UExchangeMailboxesRooms" {
        Get-WinUExchangeRoomsCalendarProcessing -Prefix $Prefix -UExchangeMailboxesRooms $Data.UExchangeMailboxesRooms
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeRoomsCalendarProcessing
    )

    $Data.UExchangeEquipmentCalendarProcessing = Get-DataInformation -Text "Getting O365 information - UExchangeEquipmentCalendarProcessing" {
        Get-WinUExchangeEquipmentCalendarProcessing -Prefix $Prefix -UExchangeMailboxesEquipment   $Data.UExchangeMailboxesEquipment
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeEquipmentCalendarProcessing
    )

    ## Microsoft Teams
    $Data.UTeamsConfiguration = Get-DataInformation -Text "Getting O365 information - UTeamsConfiguration" {
        Get-WinUTeamsConfiguration -Prefix $Prefix -Tenant $Tenant
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UTeamsConfiguration
        [PSWinDocumentation.O365]::TeamsSettings
        [PSWinDocumentation.O365]::TeamsFileSharing
    )
    $Data.TeamsSettings = Get-DataInformation -Text "Getting O365 information - TeamsSettings" {
        Get-WinTeamsSettings -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted -TeamsConfiguration $Data.TeamsConfiguration
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettings
    )
    $Data.TeamsFileSharing = Get-DataInformation -Text "Getting O365 information - TeamsFileSharing" {
        Get-WinTeamsFileSharing -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted -TeamsConfiguration $Data.TeamsConfiguration
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsFileSharing
    )
    $Data.TeamsChannelPolicy = Get-DataInformation -Text "Getting O365 information - TeamsChannelPolicy" {
        Get-WinTeamsChannelsPolicy -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsChannelPolicy
    )

    ## Summary (Prepared Data)
    $Data.AzureLicensing = Get-DataInformation -Text "Getting O365 information - AzureLicensing" {
        Get-WinAzureLicensing -UAzureLicensing $Data.UAzureLicensing
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureLicensing
    )
    $Data.AzureSubscription = Get-DataInformation -Text "Getting O365 information - AzureSubscription" {
        Get-WinAzureSubscription -UAzureSubscription $Data.UAzureSubscription
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureSubscription
    )
    $Data.AzureTenantDomains = Get-DataInformation -Text "Getting O365 information - AzureTenantDomains" {
        Get-WinAzureTenantDomains -UAzureTenantDomains $Data.UAzureTenantDomains
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureTenantDomains
    )

    $Data.ExchangeDistributionGroups = Get-DataInformation -Text "Getting O365 information - ExchangeDistributionGroups" {
        Get-WinExchangeDistributionGroups -UExchangeGroupsDistribution $Data.UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeDistributionGroups
    )

    $Data.ExchangeDistributionGroupsMembers = Get-DataInformation -Text "Getting O365 information - ExchangeDistributionGroupsMembers" {
        Get-WinExchangeDistributionGroupsMembers -UExchangeGroupsDistribution $Data.UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeDistributionGroupsMembers
    )


    $Data.UExchangeUnifiedGroups = Get-DataInformation -Text "Getting O365 information - UExchangeUnifiedGroups" {
        Get-WinUExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UExchangeUnifiedGroups
        [PSWinDocumentation.O365]::ExchangeUnifiedGroups
        [PSWinDocumentation.O365]::ExchangeUnifiedGroupsMembers
    )

    $Data.ExchangeUnifiedGroups = Get-DataInformation -Text "Getting O365 information - ExchangeUnifiedGroups" {
        Get-WinExchangeUnifiedGroups -ExchangeUnifiedGroups $Data.UExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeUnifiedGroups
    )

    $Data.ExchangeUnifiedGroupsMembers = Get-DataInformation -Text "Getting O365 information - ExchangeUnifiedGroupsMembers" {
        Get-WinExchangeUnifiedGroupsMembers -ExchangeUnifiedGroups $Data.UExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeUnifiedGroupsMembers
    )


    $Data.ExchangeMailboxesInboxRulesForwarding = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxesInboxRulesForwarding" {
        Get-WinExchangeMailboxesInboxRulesForwarding -InboxRules $UExchangeMailboxesInboxRules -Mailboxes $UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxesInboxRulesForwarding
    )

    $Data.ExchangeMailboxesStatistics = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxesStatistics" {
        Get-WinExchangeMailboxesStatistics -ExchangeMailboxes $Data.UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxesStatistics
        [PSWinDocumentation.O365]::ExchangeMailboxes
    )
    $Data.ExchangeMailboxesStatisticsArchive = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxesStatisticsArchive" {
        Get-WinExchangeMailboxesStatisticsArchive -ExchangeMailboxes $Data.UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxesStatisticsArchive
        [PSWinDocumentation.O365]::ExchangeMailboxes
    )
    $Data.ExchangeMailboxes = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxes" {
        Get-WinExchangeMailboxes -ExchangeMailboxes $Data.UExchangeMailBoxes `
            -AzureUsers $Data.UAzureADUsers `
            -MailboxStatistics $Data.ExchangeMailboxesStatistics `
            -MailboxStatisticsArchive $Data.ExchangeMailboxesStatisticsArchive
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxes
    )


    $Data.ExchangeMailboxesPermissionsIncludingInherited = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxesPermissionsIncludingInherited" {
        Get-WinExchangeMailboxesPermissionsIncludingInherited -ExchangeMailboxes $Data.UExchangeMailBoxes -AzureUsers $Data.UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxesPermissionsIncludingInherited
        [PSWinDocumentation.O365]::ExchangeMailboxesPermissions
    )
    $Data.ExchangeMailboxesPermissions = Get-DataInformation -Text "Getting O365 information - ExchangeMailboxesPermissions" {
        Get-WinExchangeMailboxesPermissions -ExchangeMailboxes $Data.UExchangeMailBoxes -MailboxPermissions $Data.ExchangeMailboxesPermissionsIncludingInherited
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMailboxesPermissions
    )
    $Data.ExchangeAcceptedDomains = Get-DataInformation -Text "Getting O365 information - ExchangeAcceptedDomains" {
        Get-WinO365ExchangeAcceptedDomains -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeAcceptedDomains
    )


    $EndTime = Stop-TimeLog -Time $TimeToGenerate
    Write-Verbose "Getting domain information - $Domain - Time to generate: $EndTime"
    return ConvertTo-OrderedDictionary -HashTable $Data -Verbose
}
