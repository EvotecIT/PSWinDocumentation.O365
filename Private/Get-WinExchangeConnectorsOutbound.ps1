function Get-WinExchangeConnectorsOutbound {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Splitter = ', ',
        [switch] $Formatted
    )

    <#
    Enabled                       : True
    UseMXRecord                   : False
    Comment                       :
    ConnectorType                 : OnPremises
    ConnectorSource               : AdminUI
    RecipientDomains              : {evotec.pl}
    SmartHosts                    : {poczta.evotec.pl}
    TlsDomain                     :
    TlsSettings                   : CertificateValidation
    IsTransportRuleScoped         : False
    RouteAllMessagesViaOnPremises : False
    CloudServicesMailEnabled      : True
    AllAcceptedDomains            : False
    TestMode                      : False
    LinkForModifiedConnector      : 00000000-0000-0000-0000-000000000000
    ValidationRecipients          : {marcin@evotec.pl}
    IsValidated                   : True
    LastValidationTimestamp       : 15.03.2019 02:31:53
    AdminDisplayName              :
    ExchangeVersion               : 0.1 (8.0.535.0)
    Name                          : Some Works Connector
    WhenCreated                   : 15.03.2019 02:31:06
    WhenChangedUTC                : 15.03.2019 01:32:23
    WhenCreatedUTC                : 15.03.2019 01:31:06
    #>

    $OutboundConnector = & "Get-$($prefix)OutboundConnector"
    foreach ($_ in $OutboundConnector) {
        if ($Formatted) {
            [PSCustomObject]@{
                'Name'                              = $_.Name
                'Enabled'                           = $_.Enabled
                'Recipient Domains'                 = $_.RecipientDomains -join $Splitter
                'Smart Hosts'                       = $_.SmartHosts -join $Splitter
                'Use MX Record'                     = $_.UseMXRecord
                'Connector Type'                    = Format-AddSpaceToSentence -Text $_.ConnectorType
                'Comment'                           = $_.Comment
                'Tls Domain'                        = $_.TlsDomain
                'Tls Settings'                      = $_.TlsSettings
                'Is Transport Rule Scoped'          = $_.IsTransportRuleScoped
                'Route AllMessages Via On Premises' = $_.RouteAllMessagesViaOnPremises
                'Cloud Services Mail Enabled'       = $_.CloudServicesMailEnabled
                'All Accepted Domains'              = $_.AllAcceptedDomains
                'TestMode'                          = $_.TestMode
                #LinkForModifiedConnector      = $_.LinkForModifiedConnector
                'Validation Recipients'             = $_.ValidationRecipients -join $Splitter
                'Is Validated'                      = $_.IsValidated
                'Last Validation Timestamp'         = $_.LastValidationTimestamp
                'Connector Source'                  = $_.ConnectorSource
                'When Changed'                      = $_.WhenChanged      #      WhenChangedUTC
                'When Created'                      = $_.WhenCreated       #     WhenCreatedUTC

            }
        } else {
            [PSCustomObject]@{
                Name                          = $_.Name
                Enabled                       = $_.Enabled
                RecipientDomains              = $_.RecipientDomains
                SmartHosts                    = $_.SmartHosts
                UseMXRecord                   = $_.UseMXRecord
                ConnectorType                 = $_.ConnectorType
                Comment                       = $_.Comment
                TlsDomain                     = $_.TlsDomain
                TlsSettings                   = $_.TlsSettings
                IsTransportRuleScoped         = $_.IsTransportRuleScoped
                RouteAllMessagesViaOnPremises = $_.RouteAllMessagesViaOnPremises
                CloudServicesMailEnabled      = $_.CloudServicesMailEnabled
                AllAcceptedDomains            = $_.AllAcceptedDomains
                TestMode                      = $_.TestMode
                #LinkForModifiedConnector      = $_.LinkForModifiedConnector
                ValidationRecipients          = $_.ValidationRecipients
                IsValidated                   = $_.IsValidated
                LastValidationTimestamp       = $_.LastValidationTimestamp
                ConnectorSource               = $_.ConnectorSource
                WhenChanged                   = $_.WhenChanged      #      WhenChangedUTC
                WhenCreated                   = $_.WhenCreated       #     WhenCreatedUTC

            }
        }
    }
}
