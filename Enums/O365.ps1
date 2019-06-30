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

            ExchangeAcceptedDomains,
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

            TeamsSettings,
            TeamsSettingsBroadcasting,
            TeamsSettingsCalling,
            TeamsSettingsChannels,
            TeamsSettingsEducationAppPolicy,
            TeamsSettingsFileSharing,
            TeamsSettingsGuests,
            TeamsSettingsMeetings,
            TeamsSettingsMeetingsTechnical,
            TeamsSettingsUpgrade,
            TeamsSettingsUsers,


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
            UExchangeUsers,

            UTeamsConfiguration,
            UTeamsVideoInteropService
        }
    }
"@