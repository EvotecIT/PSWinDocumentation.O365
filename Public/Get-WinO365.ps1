function Get-WinO365 {
    [CmdletBinding()]
    param(
        [PSWinDocumentation.O365[]] $TypesRequired,
        [string] $Prefix
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
    $Data.O365UAzureADUsers = Get-DataInformation -Text "Getting O365 information - O365UAzureADUsers" {
        Get-WinO365UAzureADUsers  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADUsers
        [PSWinDocumentation.O365]::O365AzureADUsersMFA
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountry
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountryCity
    )
    $Data.O365UAzureADUsersDeleted = Get-DataInformation -Text "Getting O365 information - O365UAzureADUsersDeleted" {
        Get-WinO365UAzureADUsersDeleted  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADUsersDeleted
    )
    $Data.O365UAzureADContacts = Get-DataInformation -Text "Getting O365 information - O365UAzureADContacts" {
        Get-WinO365UAzureADContacts  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADContacts
    )
    $Data.O365UAzureLicensing = Get-DataInformation -Text "Getting O365 information - O365UAzureLicensing" {
        Get-WinO365UAzureLicensing  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureLicensing
        [PSWinDocumentation.O365]::O365AzureLicensing
    )
    $Data.O365UAzureSubscription = Get-DataInformation -Text "Getting O365 information - O365UAzureSubscription" {
        Get-WinO365UAzureSubscription  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureSubscription
    )
    $Data.O365UAzureTenantDomains = Get-DataInformation -Text "Getting O365 information - O365UAzureTenantDomains" {
        Get-WinO365UAzureTenantDomains  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureTenantDomains
        [PSWinDocumentation.O365]::O365AzureTenantDomains
    )
    $Data.O365UAzureADGroups = Get-DataInformation -Text "Getting O365 information - O365UAzureADGroups" {
        Get-WinO365UAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADGroups
        [PSWinDocumentation.O365]::O365UAzureADGroupMembers
        [PSWinDocumentation.O365]::O365AzureADGroupMembersUser
    )
    $Data.O365UAzureADGroupMembers = Get-DataInformation -Text "Getting O365 information - O365UAzureADGroupMembers" {
        Get-WinO365UAzureADGroupMembers -O365UAzureADGroups $Data.O365UAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADGroupMembers
        [PSWinDocumentation.O365]::O365AzureADGroupMembersUser
    )
    $Data.O365AzureADGroupMembersUser = Get-DataInformation -Text "Getting O365 information - O365AzureADGroupMembersUser" {
        Get-WinO365UAzureADGroupMembers -O365UAzureADGroups $Data.O365UAzureADGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADGroupMembersUser
    )
    $Data.O365AzureADUsersMFA = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersMFA" {
        Get-WinO365AzureADUsersMFA -O365UAzureADUsers $Data.O365UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADUsersMFA
    )
    $Data.O365AzureADUsersStatisticsByCountry = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersStatisticsByCountry" {
        Get-WinO365AzureADUsersStatisticsByCountry -O365UAzureADUsers $Data.O365UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountry
    )
    $Data.O365AzureADUsersStatisticsByCity = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersStatisticsByCity" {
        Get-WinO365AzureADUsersStatisticsByCity -O365UAzureADUsers $Data.O365UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity
    )
    $Data.O365AzureADUsersStatisticsByCountryCity = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersStatisticsByCountryCity" {
        Get-WinO365AzureADUsersStatisticsByCountryCity -O365UAzureADUsers $Data.O365UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountryCity
    )
    ## Microsoft Exchange
    $Data.O365UExchangeMailBoxes = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailBoxes" {
        Get-WinO365UExchangeMailBoxes -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailBoxes
        [PSWinDocumentation.O365]::O365UExchangeMailboxesJunk
        [PSWinDocumentation.O365]::O365UExchangeMailboxesRooms
        [PSWinDocumentation.O365]::O365UExchangeMailboxesEquipment
        [PSWinDocumentation.O365]::O365UExchangeMailboxesInboxRules
        [PSWinDocumentation.O365]::O365ExchangeMailboxesInboxRulesForwarding
    )
    $Data.O365UExchangeMailUsers = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailUsers" {
        Get-WinO365UExchangeMailUsers -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailUsers
    )
    $Data.O365UExchangeUsers = Get-DataInformation -Text "Getting O365 information - O365UExchangeUsers" {
        Get-WinO365UExchangeUsers -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeUsers
    )
    $Data.O365UExchangeRecipients = Get-DataInformation -Text "Getting O365 information - O365UExchangeRecipients" {
        Get-WinO365UExchangeRecipients -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeRecipients
    )
    $Data.O365UExchangeRecipientsPermissions = Get-DataInformation -Text "Getting O365 information - O365UExchangeRecipientsPermissions" {
        Get-WinO365UExchangeRecipientsPermissions -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeRecipientsPermissions
    )
    $Data.O365UExchangeGroupsDistribution = Get-DataInformation -Text "Getting O365 information - O365UExchangeGroupsDistribution" {
        Get-WinO365UExchangeGroupsDistribution -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeGroupsDistribution
        [PSWinDocumentation.O365]::O365UExchangeGroupsDistributionMembers
        [PSWinDocumentation.O365]::O365ExchangeDistributionGroups
        [PSWinDocumentation.O365]::O365ExchangeDistributionGroupsMembers
    )
    $Data.O365UExchangeGroupsDistributionDynamic = Get-DataInformation -Text "Getting O365 information - O365UExchangeGroupsDistributionDynamic" {
        Get-WinO365UExchangeGroupsDistributionDynamic -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeGroupsDistributionDynamic
    )
    $Data.O365UExchangeGroupsDistributionMembers = Get-DataInformation -Text "Getting O365 information - O365UExchangeGroupsDistributionMembers" {
        Get-WinO365UExchangeGroupsDistributionMembers -Prefix $Prefix -O365UExchangeGroupsDistribution $Data.O365UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeGroupsDistributionMembers
    )
    $Data.O365UExchangeMailboxesJunk = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesJunk" {
        Get-WinO365UExchangeMailboxesJunk -Prefix $Prefix -O365UExchangeMailBoxes $Data.O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesJunk
    )
    $Data.O365UExchangeContacts = Get-DataInformation -Text "Getting O365 information - O365UExchangeContacts" {
        Get-WinO365UExchangeContacts -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeContacts
    )
    $Data.O365UExchangeMailboxesInboxRules = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesInboxRules" {
        Get-WinO365UExchangeMailboxesInboxRules -Prefix $Prefix -O365UExchangeMailBoxes $Data.O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesInboxRules
        [PSWinDocumentation.O365]::O365ExchangeMailboxesInboxRulesForwarding
    )
    $Data.O365UExchangeContactsMail = Get-DataInformation -Text "Getting O365 information - O365UExchangeContactsMail" {
        Get-WinO365UExchangeContactsMail -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeContactsMail
    )
    $Data.O365UExchangeMailboxesRooms = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesRooms" {
        Get-WinO365UExchangeMailboxesRooms -O365UExchangeMailBoxes $O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesRooms
        [PSWinDocumentation.O365]::O365UExchangeRoomsCalendarProcessing
    )
    $Data.O365UExchangeMailboxesEquipment = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesEquipment" {
        Get-WinO365UExchangeMailboxesEquipment  -O365UExchangeMailBoxes $O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesEquipment
        [PSWinDocumentation.O365]::O365UExchangeEquipmentCalendarProcessing
    )
    $Data.O365UExchangeRoomsCalendarProcessing = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesRooms" {
        Get-WinO365UExchangeRoomsCalendarProcessing -Prefix $Prefix -O365UExchangeMailboxesRooms $Data.O365UExchangeMailboxesRooms
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeRoomsCalendarProcessing
    )

    $Data.O365UExchangeEquipmentCalendarProcessing = Get-DataInformation -Text "Getting O365 information - O365UExchangeEquipmentCalendarProcessing" {
        Get-WinO365UExchangeEquipmentCalendarProcessing -Prefix $Prefix -O365UExchangeMailboxesEquipment   $Data.O365UExchangeMailboxesEquipment
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeEquipmentCalendarProcessing
    )

    ## Microsoft Teams
    $Data.O365TeamsConfiguration = Get-DataInformation -Text "Getting O365 information - O365TeamsConfiguration" {
        #Get-WinO365TeamsConfiguration
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365TeamsConfiguration
    )

    ## Summary (Prepared Data)
    $Data.O365AzureLicensing = Get-DataInformation -Text "Getting O365 information - O365AzureLicensing" {
        Get-WinO365AzureLicensing -O365UAzureLicensing $Data.O365UAzureLicensing
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureLicensing
    )
    $Data.O365AzureSubscription = Get-DataInformation -Text "Getting O365 information - O365AzureSubscription" {
        Get-WinO365AzureSubscription -O365UAzureSubscription $Data.O365UAzureSubscription
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureSubscription
    )
    $Data.O365AzureTenantDomains = Get-DataInformation -Text "Getting O365 information - O365AzureTenantDomains" {
        Get-WinO365AzureTenantDomains -O365UAzureTenantDomains $Data.O365UAzureTenantDomains
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureTenantDomains
    )

    $Data.O365ExchangeDistributionGroups = Get-DataInformation -Text "Getting O365 information - O365ExchangeDistributionGroups" {
        Get-WinO365ExchangeDistributionGroups -O365UExchangeGroupsDistribution $Data.O365UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365ExchangeDistributionGroups
    )

    $Data.O365ExchangeDistributionGroupsMembers = Get-DataInformation -Text "Getting O365 information - O365ExchangeDistributionGroupsMembers" {
        Get-WinO365ExchangeDistributionGroupsMembers -O365UExchangeGroupsDistribution $Data.O365UExchangeGroupsDistribution
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365ExchangeDistributionGroupsMembers
    )


    $Data.O365UExchangeUnifiedGroups = Get-DataInformation -Text "Getting O365 information - O365UExchangeUnifiedGroups" {
        Get-WinO365UExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeUnifiedGroups
        [PSWinDocumentation.O365]::O365ExchangeUnifiedGroups
        [PSWinDocumentation.O365]::O365ExchangeUnifiedGroupsMembers
    )

    $Data.O365ExchangeUnifiedGroups = Get-DataInformation -Text "Getting O365 information - O365ExchangeUnifiedGroups" {
        Get-WinO365ExchangeUnifiedGroups -ExchangeUnifiedGroups $Data.O365UExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365ExchangeUnifiedGroups
    )

    $Data.O365ExchangeUnifiedGroupsMembers = Get-DataInformation -Text "Getting O365 information - O365ExchangeUnifiedGroupsMembers" {
        Get-WinO365ExchangeUnifiedGroupsMembers -ExchangeUnifiedGroups $Data.O365UExchangeUnifiedGroups
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365ExchangeUnifiedGroupsMembers
    )


    $Data.O365ExchangeMailboxesInboxRulesForwarding = Get-DataInformation -Text "Getting O365 information - O365ExchangeMailboxesInboxRulesForwarding" {
        Get-WinO365UExchangeMailboxesInboxRulesForwarding -InboxRules $O365UExchangeMailboxesInboxRules -Mailboxes $O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365ExchangeMailboxesInboxRulesForwarding
    )

    $EndTime = Stop-TimeLog -Time $TimeToGenerate
    Write-Verbose "Getting domain information - $Domain - Time to generate: $EndTime"
    return ConvertTo-OrderedDictionary -HashTable $Data -Verbose
}

