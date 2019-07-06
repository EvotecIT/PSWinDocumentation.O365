Add-Type -TypeDefinition @"
    using System;

    namespace PSWinDocumentation
    {
        [Flags]
        public enum O365 {
            AzureADGroupMembersUser,
            AzureADUsers,
            AzureADGuests,
            AzureADUsersMFA,
            AzureADUsersStatisticsByCity,
            AzureADUsersStatisticsByCountry,
            AzureADUsersStatisticsByCountryCity,
            AzureLicensing,
            AzureRoles,
            AzureRolesActiveOnly,
            AzureRolesMembers,
            AzureSubscription,
            AzureTenantDomains,

            ExchangeAcceptedDomains,
            ExchangeConnectorsInbound,
            ExchangeConnectorsOutbound,
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
            ExchangeTransportConfig,

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
            UAzureRoles,
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