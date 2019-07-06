function Get-WinExchangeRemoteDomains {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [switch] $Formatted
    )
    <#
    PSComputerName                       : outlook.office365.com
    RunspaceId                           : 322e3e06-9cb4-403b-bc5e-3694368818c2
    PSShowComputerName                   : False
    DomainName                           : *
    IsInternal                           : False
    TargetDeliveryDomain                 : False
    ByteEncoderTypeFor7BitCharsets       : Undefined
    CharacterSet                         : iso-8859-1
    NonMimeCharacterSet                  : iso-8859-1
    AllowedOOFType                       : External
    AutoReplyEnabled                     : True
    AutoForwardEnabled                   : True
    DeliveryReportEnabled                : True
    NDREnabled                           : True
    MeetingForwardNotificationEnabled    : False
    ContentType                          : MimeHtmlText
    DisplaySenderName                    : True
    PreferredInternetCodePageForShiftJis : Undefined
    RequiredCharsetCoverage              :
    TNEFEnabled                          :
    LineWrapSize                         : Unlimited
    TrustedMailOutboundEnabled           : False
    TrustedMailInboundEnabled            : False
    UseSimpleDisplayName                 : False
    NDRDiagnosticInfoEnabled             : True
    MessageCountThreshold                : 2147483647
    AdminDisplayName                     :
    ExchangeVersion                      : 0.1 (8.0.535.0)
    Name                                 : Default
    DistinguishedName                    : CN=Default,CN=Internet Message Formats,CN=Global Settings,CN=Configuration,CN=evotecpoland.onmicrosoft.com,CN=ConfigurationUnits,DC=EURPR09A001,DC=PROD,DC=OUTLOOK,DC=COM
    Identity                             : Default
    ObjectCategory                       : EURPR09A001.PROD.OUTLOOK.COM/Configuration/Schema/ms-Exch-Domain-Content-Config
    ObjectClass                          : {top, msExchDomainContentConfig}
    WhenChanged                          : 30.11.2016 00:00:22
    WhenCreated                          : 14.10.2015 15:22:40
    WhenChangedUTC                       : 29.11.2016 23:00:22
    WhenCreatedUTC                       : 14.10.2015 13:22:40
    ExchangeObjectId                     : b0ac599a-cbd9-4c3a-98a2-bd6d4c38b8f8
    OrganizationId                       : EURPR09A001.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/evotecpoland.onmicrosoft.com - EURPR09A001.PROD.OUTLOOK.COM/ConfigurationUnits/evotecpoland.onmicrosoft.com/Configuration
    Id                                   : Default
    Guid                                 : b0ac599a-cbd9-4c3a-98a2-bd6d4c38b8f8
    OriginatingServer                    : VI1PR09A001DC01.EURPR09A001.PROD.OUTLOOK.COM
    IsValid                              : True
    ObjectState                          : Unchanged
    #>

    $RemoteDomains = & "Get-$($Prefix)RemoteDomain"
    foreach ($Domain in $RemoteDomains) {
        if ($Formatted) {
            [PSCustomObject]@{
                'Name'                                      = $Domain.Name
                'Domain Name'                               = $Domain.DomainName
                'Is Internal'                               = $Domain.IsInternal
                'Target Delivery Domain'                    = $Domain.TargetDeliveryDomain
                'Byte Encoder Type For 7Bit Charsets'       = $Domain.ByteEncoderTypeFor7BitCharsets
                'Character Set'                             = $Domain.CharacterSet
                'Non Mime CharacterSet'                     = $Domain.NonMimeCharacterSet
                'Allowed OOF Type'                          = $Domain.AllowedOOFType
                'Auto Reply Enabled'                        = $Domain.AutoReplyEnabled
                'Auto Forward Enabled'                      = $Domain.AutoForwardEnabled
                'Delivery Report Enabled'                   = $Domain.DeliveryReportEnabled
                'NDR Enabled'                               = $Domain.NDREnabled
                'Meeting Forward Notification Enabled'      = $Domain.MeetingForwardNotificationEnabled
                'Content Type'                              = $Domain.ContentType
                'Display Sender Name'                       = $Domain.DisplaySenderName
                'Preferred Internet CodePage For Shift Jis' = $Domain.PreferredInternetCodePageForShiftJis
                'Required Charset Coverage'                 = $Domain.RequiredCharsetCoverage
                'TNEF Enabled'                              = $Domain.TNEFEnabled
                'Line WrapSize'                             = $Domain.LineWrapSize
                'Trusted Mail Outbound Enabled'             = $Domain.TrustedMailOutboundEnabled
                'Trusted Mail Inbound Enabled'              = $Domain.TrustedMailInboundEnabled
                'Use Simple Display Name'                   = $Domain.UseSimpleDisplayName
                'NDR Diagnostic Info Enabled'               = $Domain.NDRDiagnosticInfoEnabled
                'Message Count Threshold'                   = $Domain.MessageCountThreshold
                #'AdminDisplayName'                       =  $Domain.AdminDisplayName
                'WhenCreated'                               = $Domain.WhenCreated #WhenCreatedUTC
                'WhenChanged'                               = $Domain.WhenChanged #WhenChangedUTC
            }
        } else {
            [PSCustomObject]@{
                Name                                 = $Domain.Name
                DomainName                           = $Domain.DomainName
                IsInternal                           = $Domain.IsInternal
                TargetDeliveryDomain                 = $Domain.TargetDeliveryDomain
                ByteEncoderTypeFor7BitCharsets       = $Domain.ByteEncoderTypeFor7BitCharsets
                CharacterSet                         = $Domain.CharacterSet
                NonMimeCharacterSet                  = $Domain.NonMimeCharacterSet
                AllowedOOFType                       = $Domain.AllowedOOFType
                AutoReplyEnabled                     = $Domain.AutoReplyEnabled
                AutoForwardEnabled                   = $Domain.AutoForwardEnabled
                DeliveryReportEnabled                = $Domain.DeliveryReportEnabled
                NDREnabled                           = $Domain.NDREnabled
                MeetingForwardNotificationEnabled    = $Domain.MeetingForwardNotificationEnabled
                ContentType                          = $Domain.ContentType
                DisplaySenderName                    = $Domain.DisplaySenderName
                PreferredInternetCodePageForShiftJis = $Domain.PreferredInternetCodePageForShiftJis
                RequiredCharsetCoverage              = $Domain.RequiredCharsetCoverage
                TNEFEnabled                          = $Domain.TNEFEnabled
                LineWrapSize                         = $Domain.LineWrapSize
                TrustedMailOutboundEnabled           = $Domain.TrustedMailOutboundEnabled
                TrustedMailInboundEnabled            = $Domain.TrustedMailInboundEnabled
                UseSimpleDisplayName                 = $Domain.UseSimpleDisplayName
                NDRDiagnosticInfoEnabled             = $Domain.NDRDiagnosticInfoEnabled
                MessageCountThreshold                = $Domain.MessageCountThreshold
                #AdminDisplayName                       =  $Domain.AdminDisplayName
                WhenCreated                          = $Domain.WhenCreated #WhenCreatedUTC
                WhenChanged                          = $Domain.WhenChanged #WhenChangedUTC
            }
        }
    }
}