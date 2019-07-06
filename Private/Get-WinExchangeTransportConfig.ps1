function Get-WinExchangeTransportConfig {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [switch] $Formatted,
        [string] $Splitter = ', '
    )
    #Get-TransportConfig

    <#
        AddressBookPolicyRoutingEnabled                             : False
        AnonymousSenderToRecipientRatePerHour                       : 1800
        ClearCategories                                             : True
        ConvertDisclaimerWrapperToEml                               : False
        DSNConversionMode                                           : PreserveDSNBody
        JournalArchivingEnabled                                     : False
        ExternalDelayDsnEnabled                                     : True
        ExternalDsnDefaultLanguage                                  :
        ExternalDsnLanguageDetectionEnabled                         : True
        ExternalDsnMaxMessageAttachSize                             : 10 MB (10,485,760 bytes)
        ExternalDsnReportingAuthority                               :
        ExternalDsnSendHtml                                         : True
        ExternalPostmasterAddress                                   :
        GenerateCopyOfDSNFor                                        : {}
        SafetyNetHoldTime                                           : 7.00:00:00
        ShadowHeartbeatFrequency                                    : 00:02:00
        ShadowMessageAutoDiscardInterval                            : 2.00:00:00
        ShadowMessagePreferenceSetting                              : PreferRemote
        ShadowRedundancyEnabled                                     : True
        ShadowResubmitTimeSpan                                      : 03:00:00
        SmtpClientAuthenticationDisabled                            : False
        SupervisionTags                                             : {Reject, Allow}
        TLSReceiveDomainSecureList                                  : {}
        TLSSendDomainSecureList                                     : {}
        VerifySecureSubmitEnabled                                   : False
        VoicemailJournalingEnabled                                  : True
        HeaderPromotionModeSetting                                  : NoCreate
        Xexch50Enabled                                              : True
    #>
    $TransportConfig = & "Get-$($prefix)TransportConfig"

    if ($Formatted) {
        [ordered]@{
            'Address Book Policy Routing Enabled'    = $TransportConfig.AddressBookPolicyRoutingEnabled
            'Anonymous SenderToRecipientRatePerHour' = $TransportConfig.AnonymousSenderToRecipientRatePerHour
            'Clear Categories'                       = $TransportConfig.ClearCategories
            'Convert DisclaimerWrapperToEml'         = $TransportConfig.ConvertDisclaimerWrapperToEml
            'DSN Conversion Mode'                    = Format-AddSpaceToSentence -Text $TransportConfig.DSNConversionMode
            'Journal Archiving Enabled'              = $TransportConfig.JournalArchivingEnabled
            'External Delay Dsn Enabled'             = $TransportConfig.ExternalDelayDsnEnabled
            'External Dsn Default Language'          = $TransportConfig.ExternalDsnDefaultLanguage
            'External Dsn Language DetectionEnabled' = $TransportConfig.ExternalDsnLanguageDetectionEnabled
            'External Dsn MaxMessage Attach Size'    = $TransportConfig.ExternalDsnMaxMessageAttachSize
            'External Dsn Reporting Authority'       = $TransportConfig.ExternalDsnReportingAuthority
            'External Dsn SendHtml'                  = $TransportConfig.ExternalDsnSendHtml
            'External Postmaster Address'            = $TransportConfig.ExternalPostmasterAddress
            'Generate Copy Of DSN For'               = $TransportConfig.GenerateCopyOfDSNFor -join $Splitter
            'SafetyNet Hold Time'                    = $TransportConfig.SafetyNetHoldTime
            'Shadow Heartbeat Frequency'             = $TransportConfig.ShadowHeartbeatFrequency
            'Shadow Message Auto Discard Interval'   = $TransportConfig.ShadowMessageAutoDiscardInterval
            'Shadow Message Preference Setting'      = $TransportConfig.ShadowMessagePreferenceSetting
            'Shadow Redundancy Enabled'              = $TransportConfig.ShadowRedundancyEnabled
            'Shadow Resubmit TimeSpan'               = $TransportConfig.ShadowResubmitTimeSpan
            'Smtp Client Authentication Disabled'    = $TransportConfig.SmtpClientAuthenticationDisabled
            'Supervision Tags'                       = $TransportConfig.SupervisionTags -join $Splitter
            'TLS Receive Domain Secure List'         = $TransportConfig.TLSReceiveDomainSecureList -join $Splitter
            'TLS SendDomain Secure List'             = $TransportConfig.TLSSendDomainSecureList -join $Splitter
            'Verify Secure Submit Enabled'           = $TransportConfig.VerifySecureSubmitEnabled
            'Voicemail Journaling Enabled'           = $TransportConfig.VoicemailJournalingEnabled
            'Header Promotion Mode Setting'          = $TransportConfig.HeaderPromotionModeSetting
            'Xexch50Enabled'                         = $TransportConfig.Xexch50Enabled

        }
    } else {
        [ordered]@{
            AddressBookPolicyRoutingEnabled       = $TransportConfig.AddressBookPolicyRoutingEnabled
            AnonymousSenderToRecipientRatePerHour = $TransportConfig.AnonymousSenderToRecipientRatePerHour
            ClearCategories                       = $TransportConfig.ClearCategories
            ConvertDisclaimerWrapperToEml         = $TransportConfig.ConvertDisclaimerWrapperToEml
            DSNConversionMode                     = $TransportConfig.DSNConversionMode
            JournalArchivingEnabled               = $TransportConfig.JournalArchivingEnabled
            ExternalDelayDsnEnabled               = $TransportConfig.ExternalDelayDsnEnabled
            ExternalDsnDefaultLanguage            = $TransportConfig.ExternalDsnDefaultLanguage
            ExternalDsnLanguageDetectionEnabled   = $TransportConfig.ExternalDsnLanguageDetectionEnabled
            ExternalDsnMaxMessageAttachSize       = $TransportConfig.ExternalDsnMaxMessageAttachSize
            ExternalDsnReportingAuthority         = $TransportConfig.ExternalDsnReportingAuthority
            ExternalDsnSendHtml                   = $TransportConfig.ExternalDsnSendHtml
            ExternalPostmasterAddress             = $TransportConfig.ExternalPostmasterAddress
            GenerateCopyOfDSNFor                  = $TransportConfig.GenerateCopyOfDSNFor
            SafetyNetHoldTime                     = $TransportConfig.SafetyNetHoldTime
            ShadowHeartbeatFrequency              = $TransportConfig.ShadowHeartbeatFrequency
            ShadowMessageAutoDiscardInterval      = $TransportConfig.ShadowMessageAutoDiscardInterval
            ShadowMessagePreferenceSetting        = $TransportConfig.ShadowMessagePreferenceSetting
            ShadowRedundancyEnabled               = $TransportConfig.ShadowRedundancyEnabled
            ShadowResubmitTimeSpan                = $TransportConfig.ShadowResubmitTimeSpan
            SmtpClientAuthenticationDisabled      = $TransportConfig.SmtpClientAuthenticationDisabled
            SupervisionTags                       = $TransportConfig.SupervisionTags
            TLSReceiveDomainSecureList            = $TransportConfig.TLSReceiveDomainSecureList
            TLSSendDomainSecureList               = $TransportConfig.TLSSendDomainSecureList
            VerifySecureSubmitEnabled             = $TransportConfig.VerifySecureSubmitEnabled
            VoicemailJournalingEnabled            = $TransportConfig.VoicemailJournalingEnabled
            HeaderPromotionModeSetting            = $TransportConfig.HeaderPromotionModeSetting
            Xexch50Enabled                        = $TransportConfig.Xexch50Enabled
        }
    }
}