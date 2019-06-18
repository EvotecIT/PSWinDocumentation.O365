Add-Type -TypeDefinition @"
    using System;

    namespace PSWinDocumentation
    {
        [Flags]
        public enum O365 {
            O365AzureADGroupMembersUser,
            O365AzureADUsersMFA,
            O365AzureADUsersStatisticsByCity,
            O365AzureADUsersStatisticsByCountry,
            O365AzureADUsersStatisticsByCountryCity,
            O365AzureLicensing,
            O365AzureSubscription,
            O365AzureTenantDomains,

            O365ExchangeDistributionGroups,
            O365ExchangeDistributionGroupsMembers,
            O365ExchangeMailboxesInboxRulesForwarding,
            O365ExchangeUnifiedGroups,
            O365ExchangeUnifiedGroupsMembers,
            O365TeamsConfiguration,




            O365UAzureADContacts,
            O365UAzureADGroupMembers,
            O365UAzureADGroups,
            O365UAzureADUsers,
            O365UAzureADUsersDeleted,
            O365UAzureLicensing,
            O365UAzureSubscription,
            O365UAzureTenantDomains,
            O365UExchangeContacts,
            O365UExchangeContactsMail,
            O365UExchangeEquipmentCalendarProcessing,
            O365UExchangeGroupsDistribution,
            O365UExchangeGroupsDistributionDynamic,
            O365UExchangeGroupsDistributionMembers,
            O365UExchangeMailBoxes,
            O365UExchangeMailboxesEquipment,
            O365UExchangeMailboxesInboxRules,
            O365UExchangeMailboxesJunk,
            O365UExchangeMailboxesRooms,
            O365UExchangeMailUsers,
            O365UExchangeRecipients,
            O365UExchangeRecipientsPermissions,
            O365UExchangeRoomsCalendarProcessing,
            O365UExchangeUnifiedGroups,
            O365UExchangeUsers
        }
    }
"@