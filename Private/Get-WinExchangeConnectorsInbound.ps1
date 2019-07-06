function Get-WinExchangeConnectorsInbound {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Splitter = ', ',
        [switch] $Formatted
    )
    $InboundConnector = & "Get-$($prefix)InboundConnector"
    # $OutboundConnector = & "Get-$($prefix)OutboundConnector"

    foreach ($_ in $InboundConnector) {
        if ($Formatted) {
            [PSCustomObject]@{
                'Name'                                        = $_.Name
                'Enabled'                                     = $_.Enabled
                'Connector Type'                              = Format-AddSpaceToSentence -Text $_.ConnectorType
                'Sender Domains'                              = $_.SenderDomains
                'Sender IP Addresses'                         = $_.SenderIPAddresses -join $Splitter
                'Treat Messages As Internal'                  = $_.TreatMessagesAsInternal
                'Associated Accepted Domains'                 = $_.AssociatedAcceptedDomains
                'Require Tls'                                 = $_.RequireTls
                'Restrict DomainsToIPAddresses'               = $_.RestrictDomainsToIPAddresses
                'Restrict DomainsToCertificate'               = $_.RestrictDomainsToCertificate
                'Comment'                                     = $_.Comment
                'Cloud Services Mail Enabled'                 = $_.CloudServicesMailEnabled
                'Tls Sender Certificate Name'                 = $_.TlsSenderCertificateName
                'Detect SenderIP By Skipping LastIP'          = $_.DetectSenderIPBySkippingLastIP
                'Detect SenderIP By Skipping These IPs'       = $_.DetectSenderIPBySkippingTheseIPs
                'Detect SenderIP By Skipping These Providers' = $_.DetectSenderIPBySkippingTheseProviders
                'Scan And Drop Recipients'                    = $_.ScanAndDropRecipients
                'Detect SenderIP Recipient List'              = $_.DetectSenderIPRecipientList
                'EF Test Mode'                                = $_.EFTestMode
                'EF Skip Last IP'                             = $_.EFSkipLastIP
                'EF Skip IPs'                                 = $_.EFSkipIPs
                'EF Skip Mail Gateway'                        = $_.EFSkipMailGateway
                'EF Users'                                    = $_.EFUsers
                'Connector Source'                            = $_.ConnectorSource
                'When Changed'                                = $_.WhenChanged #WhenChangedUTC
                'When Created'                                = $_.WhenCreated #WhenCreatedUTC
            }
        } else {
            [PSCustomObject]@{
                Name                                   = $_.Name
                Enabled                                = $_.Enabled
                SenderDomains                          = $_.SenderDomains
                SenderIPAddresses                      = $_.SenderIPAddresses
                AssociatedAcceptedDomains              = $_.AssociatedAcceptedDomains
                RequireTls                             = $_.RequireTls
                RestrictDomainsToIPAddresses           = $_.RestrictDomainsToIPAddresses
                RestrictDomainsToCertificate           = $_.RestrictDomainsToCertificate
                ConnectorType                          = $_.ConnectorType
                Comment                                = $_.Comment
                CloudServicesMailEnabled               = $_.CloudServicesMailEnabled
                TreatMessagesAsInternal                = $_.TreatMessagesAsInternal
                TlsSenderCertificateName               = $_.TlsSenderCertificateName
                DetectSenderIPBySkippingLastIP         = $_.DetectSenderIPBySkippingLastIP
                EFTestMode                             = $_.EFTestMode
                DetectSenderIPBySkippingTheseIPs       = $_.DetectSenderIPBySkippingTheseIPs
                DetectSenderIPBySkippingTheseProviders = $_.DetectSenderIPBySkippingTheseProviders
                ScanAndDropRecipients                  = $_.ScanAndDropRecipients
                DetectSenderIPRecipientList            = $_.DetectSenderIPRecipientList
                EFSkipLastIP                           = $_.EFSkipLastIP
                EFSkipIPs                              = $_.EFSkipIPs
                EFSkipMailGateway                      = $_.EFSkipMailGateway
                EFUsers                                = $_.EFUsers
                ConnectorSource                        = $_.ConnectorSource
                WhenChanged                            = $_.WhenChanged #WhenChangedUTC
                WhenCreated                            = $_.WhenCreated #WhenCreatedUTC
            }
        }
    }
}

#Get-OutboundConnector



<# Get-InboundConnector

Name           SenderDomains SenderIPAddresses                                            Enabled
----           ------------- -----------------                                            -------
Evotec Support {smtp:*;1}    {37.59.176.140, 37.59.176.139, 37.59.176.138, 37.59.176.137} True

ConnectorSource                        : AdminUI
Comment                                :
SenderIPAddresses                      : {37.59.176.140, 37.59.176.139, 37.59.176.138, 37.59.176.137}
SenderDomains                          : {smtp:*;1}
AssociatedAcceptedDomains              : {}
RequireTls                             : False
RestrictDomainsToIPAddresses           : True
RestrictDomainsToCertificate           : False
CloudServicesMailEnabled               : True
TreatMessagesAsInternal                : False
TlsSenderCertificateName               :
DetectSenderIPBySkippingLastIP         : False
EFTestMode                             : False
DetectSenderIPBySkippingTheseIPs       : {}
DetectSenderIPBySkippingTheseProviders : {}
ScanAndDropRecipients                  : {}
DetectSenderIPRecipientList            : {}
EFSkipLastIP                           : False
EFSkipIPs                              : {}
EFSkipMailGateway                      : {}
EFUsers                                : {}
AdminDisplayName                       :
ExchangeVersion                        : 0.1 (8.0.535.0)
Name                                   : Evotec Support
DistinguishedName                      : CN=Evotec Support,CN=Transport Settings,CN=Configuration,CN=evotecpoland.onmicrosoft.com,CN=ConfigurationUnits,DC=EURPR09A001,DC=PROD,DC=OUTLOOK,DC=COM
Identity                               : Evotec Support
ObjectCategory                         : EURPR09A001.PROD.OUTLOOK.COM/Configuration/Schema/ms-Exch-SMTP-Inbound-Connector
ObjectClass                            : {top, msExchSMTPInboundConnector}
WhenChanged                            : 01.02.2017 19:07:42
WhenCreated                            : 01.02.2017 19:07:24
WhenChangedUTC                         : 01.02.2017 18:07:42
WhenCreatedUTC                         : 01.02.2017 18:07:24
ExchangeObjectId                       : fd345610-25f8-47a8-b323-ffa7f5b3b6c2
OrganizationId                         : EURPR09A001.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/evotecpoland.onmicrosoft.com - EURPR09A001.PROD.OUTLOOK.COM/ConfigurationUnits/evotecpoland.onmicrosoft.com/Configuration
Id                                     : Evotec Support
Guid                                   : fd345610-25f8-47a8-b323-ffa7f5b3b6c2
OriginatingServer                      : VI1PR09A001DC01.EURPR09A001.PROD.OUTLOOK.COM
IsValid                                : True
ObjectState                            : Unchanged
#>