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

    $Data = [ordered] @{ }

    # MSOnline
    $Data.O365UAzureADUsers = Get-DataInformation -Text "Getting O365 information - O365UAzureADUsers" {
        Get-WinO365UAzureUsers  #-Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UAzureADUsers
        [PSWinDocumentation.O365]::O365AzureADUsersMFA
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountry
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCountryCity
    )
    $Data.O365UAzureADUsersDeleted = Get-DataInformation -Text "Getting O365 information - O365UAzureADUsersDeleted" {
        Get-WinO365UAzureUsers  #-Prefix $Prefix
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
    $Data.O365AzureADUsersStatisticsByCountry = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersStatisticsByCountry" {
        Get-WinO365AzureADUsersStatisticsByCity -O365UAzureADUsers $Data.O365UAzureADUsers
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365AzureADUsersStatisticsByCity
    )
    $Data.O365AzureADUsersStatisticsByCountry = Get-DataInformation -Text "Getting O365 information - O365AzureADUsersStatisticsByCountry" {
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
        Get-WinO365UExchangeMailboxesJunk -Prefix $Prefix -O365UExchangeGroupsDistribution $Data.O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesJunk
    )
    $Data.O365UExchangeContacts = Get-DataInformation -Text "Getting O365 information - O365UExchangeContacts" {
        Get-WinO365UExchangeContacts -Prefix $Prefix
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeContacts
    )
    $Data.O365UExchangeMailboxesInboxRules = Get-DataInformation -Text "Getting O365 information - O365UExchangeMailboxesInboxRules" {
        Get-WinO365UExchangeInboxRules -Prefix $Prefix -O365UExchangeMailBoxes $Data.O365UExchangeMailBoxes
    } -TypesRequired $TypesRequired -TypesNeeded @(
        [PSWinDocumentation.O365]::O365UExchangeMailboxesInboxRules
    )


    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeContacts)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeContacts"
        $Data.O365ExchangeInboxRules = Invoke-Command -ScriptBlock {
            return $Data.O365UExchangeInboxRules
        }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeContacts)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeContacts"
        $Data.O365ExchangeInboxRules = Invoke-Command -ScriptBlock {
            return $Data.O365UExchangeInboxRules
        }
    }

    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeContactsMail)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeContactsMail"
        $Data.O365UExchangeContactsMail = & "Get-$($prefix)MailContact" -ResultSize unlimited
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeMailboxesRooms, [PSWinDocumentation.O365]::O365UExchangeRoomsCalendarProcessing)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeMailboxesRooms"
        $Data.O365UExchangeMailboxesRooms = $Data.O365UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'RoomMailbox' }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeMailboxesEquipment, [PSWinDocumentation.O365]::O365UExchangeEquipmentCalendarProcessing)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeMailboxesEquipment"
        $Data.O365UExchangeMailboxesEquipment = $Data.O365UExchangeMailBoxes | Where-Object { $_.RecipientTypeDetails -eq 'EquipmentMailbox' }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeRoomsCalendarProcessing)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeRoomsCalendarProcessing"
        $Data.O365UExchangeRoomsCalendarProcessing = Invoke-Command -ScriptBlock {
            $Output = @()
            foreach ($Mailbox in $Data.O365UExchangeMailboxesRooms) {
                $Object = & "Get-$($prefix)CalendarProcessing" -Identity $Mailbox.PrimarySmtpAddress -ResultSize unlimited
                if ($Object) {
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxPrimarySmtpAddress" -Value $Mailbox.PrimarySmtpAddress
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxAlias" -Value $Mailbox.Alias
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxGUID" -Value $Mailbox.GUID
                    $Output += $Object
                }
            }

        }
    }
    if (Find-TypesNeeded -TypesRequired $TypesRequired -TypesNeeded @([PSWinDocumentation.O365]::O365UExchangeEquipmentCalendarProcessing)) {
        Write-Verbose "Get-WinO365Exchange - Getting O365UExchangeEquipmentCalendarProcessing"
        $Data.O365UExchangeEquipmentCalendarProcessing = Invoke-Command -ScriptBlock {
            $Output = @()
            foreach ($Mailbox in $Data.O365UExchangeMailboxesEquipment) {
                $Object = & "Get-$($prefix)CalendarProcessing" -Identity $Mailbox.PrimarySmtpAddress -ResultSize unlimited
                if ($Object) {
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxPrimarySmtpAddress" -Value $Mailbox.PrimarySmtpAddress
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxAlias" -Value $Mailbox.Alias
                    $Object | Add-Member -MemberType NoteProperty -Name "MailboxGUID" -Value $Mailbox.GUID
                    $Output += $Object
                }
            }
        }
    }



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










    $EndTime = Stop-TimeLog -Time $TimeToGenerate
    Write-Verbose "Getting domain information - $Domain - Time to generate: $EndTime"
    return $Data
}

