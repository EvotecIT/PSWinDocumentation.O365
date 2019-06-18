Add-Type -TypeDefinition @"
    using System;

    namespace PSWinDocumentation
    {
        [Flags]
        public enum O365 {
            AzureADGroupMembersUser,
            AzureADUsersMFA,
            AzureADUsersStatisticsByCity,
            AzureADUsersStatisticsByCountry,
            AzureADUsersStatisticsByCountryCity,
            AzureLicensing,
            AzureSubscription,
            AzureTenantDomains,

            ExchangeDistributionGroups,
            ExchangeDistributionGroupsMembers,
            ExchangeMailboxes,
            ExchangeMailboxesStatistics,
            ExchangeMailboxesStatisticsArchive,
            ExchangeMailboxesPermissions,
            ExchangeMailboxesPermissionsIncludingInherited,
            ExchangeMailboxesInboxRulesForwarding,
            ExchangeUnifiedGroups,
            ExchangeUnifiedGroupsMembers,
            TeamsConfiguration,




            UAzureADContacts,
            UAzureADGroupMembers,
            UAzureADGroups,
            UAzureADUsers,
            UAzureADUsersDeleted,
            UAzureLicensing,
            UAzureSubscription,
            UAzureTenantDomains,
            UExchangeContacts,
            UExchangeContactsMail,
            UExchangeEquipmentCalendarProcessing,
            UExchangeGroupsDistribution,
            UExchangeGroupsDistributionDynamic,
            UExchangeGroupsDistributionMembers,
            UExchangeMailBoxes,
            UExchangeMailboxesEquipment,
            UExchangeMailboxesInboxRules,
            UExchangeMailboxesJunk,
            UExchangeMailboxesPermissions,
            UExchangeMailboxesRooms,
            UExchangeMailUsers,
            UExchangeRecipients,
            UExchangeRecipientsPermissions,
            UExchangeRoomsCalendarProcessing,
            UExchangeUnifiedGroups,
            UExchangeUsers
        }
    }
"@