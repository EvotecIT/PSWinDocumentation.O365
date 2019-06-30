$CompanyName = 'Evotec'

Documentimo -FilePath "$PSScriptRoot\Output\Office365-Documentation.docx" {
    DocToc -Title 'Table of content'

    DocPageBreak

    DocText {
        "This document provides documentation of Office 365 for $CompanyName."
    }
    DocNumbering -Text 'Microsoft Teams' -Level 0 -Type Numbered -Heading Heading1 {
        DocText -Text "Following section provides overview of settings for Microsoft Teams and it's relation to Skype For Business"

        DocNumbering -Text 'Global Settings' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettings -OverwriteTitle 'Global Settings'
        }
        DocNumbering -Text 'File Sharing Options' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsFileSharing -OverwriteTitle 'File Sharing Options'
        }
        DocNumbering -Text 'Channel Settings' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsChannels -OverwriteTitle 'Channel Settings'
        }
        DocNumbering -Text 'Settings for Guests' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsGuests -OverwriteTitle 'Settings for Guests'
        }
        DocNumbering -Text 'Settings for Upgrading Skype to Teams' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsUpgrade -OverwriteTitle 'Settings for Upgrading Skype to Teams'
        }
        DocNumbering -Text 'Settings for Users' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsUsers -OverwriteTitle 'Settings for Users'
        }
        DocNumbering -Text 'Broadcasting Settings' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsBroadcasting -OverwriteTitle 'Broadcasting Settings'
        }
        DocNumbering -Text 'Calling Settings' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsCalling -OverwriteTitle 'Calling Settings'
        }
        DocNumbering -Text 'Meetings Settings' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsMeetings -OverwriteTitle 'Meetings Settings'
        }
        DocNumbering -Text 'Meetings Technical Information' -Level 1 -Type Numbered -Heading Heading1 {
            DocTable -DataTable $O365.TeamsSettingsMeetingsTechnical -OverwriteTitle 'Meetings Technical Information'
        }
    }
} -Open