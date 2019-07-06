function Get-WinO365 {
    [CmdletBinding()]
    param(
        [PSWinDocumentation.O365[]] $TypesRequired,
        [string] $Prefix,
        [validateset("Bytes", "KB", "MB", "GB", "TB")][string]$SizeIn = 'MB',
        [alias('Precision')][int]$SizePrecision = 2,
        [switch] $Formatted,
        [switch] $SkipAvailability,
        [string] $Splitter = ', ',
        [string] $Tenant
    )

    $PSDefaultParameterValues["Get-DataInformation:Verbose"] = $PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent

    $TimeToGenerate = Start-TimeLog

    if ($null -eq $TypesRequired) {
        Write-Verbose 'Get-WinO365 - TypesRequired is null. Getting all.'
        $TypesRequired = Get-Types -Types ([PSWinDocumentation.O365])
    } # Gets all types

    if (-not $SkipAvailability) {
        $Commands = Test-AvailabilityCommands -Commands "Get-$($Prefix)Mailbox", "Get-$($Prefix)MsolUser", "Get-$($Prefix)MailboxStatistics"
        if ($Commands -contains $false) {
            Write-Warning "Get-WinO365 - One of commands Get-$($Prefix)Mailbox, Get-$($Prefix)MsolUser, Get-$($Prefix)MailboxStatistics is not available. Make sure connectivity to Office 365 exists."
            return
        }
    }

    $Data = @{ }

    $Data.Objects = @{ }

    # MSOnline
    $Data.UAzureADUsers = Get-DataInformation -Text "Getting O365 information - UAzureADUsers" {
        Get-WinUAzureADUsers -Tenant $Tenant  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureADUsers
        [PSWinDocumentation.O365]::AzureADUsers
        [PSWinDocumentation.O365]::AzureADUsersMFA
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountry
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCity
        [PSWinDocumentation.O365]::AzureADUsersStatisticsByCountryCity
        [PSWinDocumentation.O365]::ExchangeMailboxes
        [PSWinDocumentation.O365]::AzureRolesMembers
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
        [PSWinDocumentation.O365]::AzureADGuests
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
    $Data.AzureADUsers = Get-DataInformation -Text "Getting O365 information - AzureADUsers" {
        Get-WinAzureUsers -MsolUsers $Data.UAzureADUsers -Prefix $Prefix -Formatted:$Formatted -Splitter $Splitter -Users $Data.Objects
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADUsers
        [PSWinDocumentation.O365]::AzureRolesMembers
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
    )
    $Data.AzureADGuests = Get-DataInformation -Text "Getting O365 information - AzureADGuests" {
        Get-WinAzureGuests -MsolUsers $Data.UAzureADUsers -Prefix $Prefix -Formatted:$Formatted -Splitter $Splitter -Users $Data.Objects
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureADGuests
        [PSWinDocumentation.O365]::AzureRolesMembers
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
    )
    $Data.UAzureRoles = Get-DataInformation -Text "Getting O365 information - UAzureRoles" {
        Get-WinUAzureRoles -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::UAzureRoles
        [PSWinDocumentation.O365]::AzureRolesMembers
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
    )
    $Data.AzureRolesMembers = Get-DataInformation -Text "Getting O365 information - AzureRolesMembers" {
        Get-WinAzureRolesMembers -MsolRoles $Data.UAzureRoles -Prefix $Prefix -Formatted:$Formatted -Users $Data.Objects
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureRolesMembers
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
    )
    $Data.AzureRoles = Get-DataInformation -Text "Getting O365 information - AzureRoles" {
        Get-WinAzureRoles -MsolRoles $Data.UAzureRoles -AzureRolesMembers $Data.AzureRolesMembers -Prefix $Prefix -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureRoles
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
    )
    $Data.AzureRolesActiveOnly = Get-DataInformation -Text "Getting O365 information - AzureRolesActiveOnly" {
        Get-WinAzureRolesActiveOnly -AzureRoles $Data.AzureRoles -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureRolesActiveOnly
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
        [PSWinDocumentation.O365]::TeamsSettingsFileSharing
    )
    $Data.TeamsSettings = Get-DataInformation -Text "Getting O365 information - TeamsSettings" {
        Get-WinTeamsSettings -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted -TeamsConfiguration $Data.TeamsConfiguration
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettings
    )
    $Data.TeamsSettingsBroadcasting = Get-DataInformation -Text "Getting O365 information - TeamsSettingsBroadcasting" {
        Get-WinTeamsSettingsBroadcasting -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsBroadcasting
    )
    $Data.TeamsSettingsCalling = Get-DataInformation -Text "Getting O365 information - TeamsSettingsCalling" {
        Get-WinTeamsSettingsCalling -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsCalling
    )
    $Data.TeamsSettingsChannels = Get-DataInformation -Text "Getting O365 information - TeamsSettingsChannels" {
        Get-WinTeamsSettingsChannels -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsChannels
    )
    $Data.TeamsSettingsEducationAppPolicy = Get-DataInformation -Text "Getting O365 information - TeamsSettingsEducationAppPolicy" {
        Get-WinTeamsSettingsEducationAppPolicy -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsEducationAppPolicy
    )
    $Data.TeamsSettingsFileSharing = Get-DataInformation -Text "Getting O365 information - TeamsSettingsFileSharing" {
        Get-WinTeamsSettingsFileSharing -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted -TeamsConfiguration $Data.TeamsConfiguration
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsFileSharing
    )
    $Data.TeamsSettingsGuests = Get-DataInformation -Text "Getting O365 information - TeamsSettingsGuests" {
        Get-WinTeamsSettingsGuests -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsGuests
    )
    $Data.TeamsSettingsMeetings = Get-DataInformation -Text "Getting O365 information - TeamsSettingsMeetings" {
        Get-WinTeamsSettingsMeetings -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsMeetings
    )
    $Data.TeamsSettingsMeetingsTechnical = Get-DataInformation -Text "Getting O365 information - TeamsSettingsMeetingsTechnical" {
        Get-WinTeamsSettingsMeetingsTechnical -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsMeetingsTechnical
    )
    $Data.TeamsSettingsUpgrade = Get-DataInformation -Text "Getting O365 information - TeamsSettingsUpgrade" {
        Get-WinTeamsSettingsUpgrade -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsUpgrade
    )
    $Data.TeamsSettingsUsers = Get-DataInformation -Text "Getting O365 information - TeamsSettingsUsers" {
        Get-WinTeamsSettingsUsers -Prefix $Prefix -Tenant $Tenant -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::TeamsSettingsUsers
    )
    ## Summary (Prepared Data)
    $Data.AzureLicensing = Get-DataInformation -Text "Getting O365 information - AzureLicensing" {
        Get-WinAzureLicensing -UAzureLicensing $Data.UAzureLicensing -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureLicensing
    )
    $Data.AzureSubscription = Get-DataInformation -Text "Getting O365 information - AzureSubscription" {
        Get-WinAzureSubscription -UAzureSubscription $Data.UAzureSubscription -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::AzureSubscription
    )
    $Data.AzureTenantDomains = Get-DataInformation -Text "Getting O365 information - AzureTenantDomains" {
        Get-WinAzureTenantDomains -UAzureTenantDomains $Data.UAzureTenantDomains -Formatted:$Formatted
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
        Get-WinExchangeAcceptedDomains -Prefix $Prefix -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeAcceptedDomains
        [PSWinDocumentation.O365]::ExchangeMxRecords
    )
    $Data.ExchangeMxRecords = Get-DataInformation -Text "Getting O365 information - ExchangeMxRecords" {
        Get-WinExchangeMxRecord -Prefix $Prefix -Formatted:$Formatted -ExchangeAcceptedDomains $Data.ExchangeAcceptedDomains
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeMxRecords
    )
    $Data.ExchangeTransportConfig = Get-DataInformation -Text "Getting O365 information - ExchangeTransportConfig" {
        Get-WinExchangeTransportConfig -Prefix $Prefix -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeTransportConfig
    )

    $Data.ExchangeConnectorsInbound = Get-DataInformation -Text "Getting O365 information - ExchangeConnectorsInbound" {
        Get-WinExchangeConnectorsInbound -Prefix $Prefix -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeConnectorsInbound
    )
    $Data.ExchangeConnectorsOutbound = Get-DataInformation -Text "Getting O365 information - ExchangeConnectorsOutbound" {
        Get-WinExchangeConnectorsOutbound -Prefix $Prefix -Formatted:$Formatted
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::ExchangeConnectorsOutbound
    )


    $EndTime = Stop-TimeLog -Time $TimeToGenerate
    Write-Verbose "Getting domain information - $Domain - Time to generate: $EndTime"
    return ConvertTo-OrderedDictionary -HashTable $Data #-Verbose
}

