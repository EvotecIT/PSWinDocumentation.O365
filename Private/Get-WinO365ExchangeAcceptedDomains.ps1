function Get-WinO365ExchangeAcceptedDomains {
    [CmdletBinding()]
    param(
        [string] $Prefix
    )
    $AcceptedDomains = & "Get-$($prefix)AcceptedDomain"
    #$AcceptedDomains = Get-AcceptedDomain #| Select Name, DomainName, DomainType, Default

    foreach ($_ in $AcceptedDomains) {
        [PSCustomObject]@{
            Name                             = $_.Name
            DomainName                       = $_.DomainName
            DomainType                       = $_.DomainType
            Default                          = $_.Default
            MatchSubDomains                  = $_.MatchSubDomains
            CatchAllRecipientID              = $_.CatchAllRecipientID
            AddressBookEnabled               = $_.AddressBookEnabled
            EmailOnly                        = $_.EmailOnly
            ExternallyManaged                = $_.ExternallyManaged
            AuthenticationType               = $_.AuthenticationType
            LiveIdInstanceType               = $_.LiveIdInstanceType
            PendingRemoval                   = $_.PendingRemoval
            PendingCompletion                = $_.PendingCompletion
            FederatedOrganizationLink        = $_.FederatedOrganizationLink
            MailFlowPartner                  = $_.MailFlowPartner
            OutboundOnly                     = $_.OutboundOnly
            PendingFederatedAccountNamespace = $_.PendingFederatedAccountNamespace
            PendingFederatedDomain           = $_.PendingFederatedDomain
            IsCoexistenceDomain              = $_.IsCoexistenceDomain
            PerimeterDuplicateDetected       = $_.PerimeterDuplicateDetected
            IsDefaultFederatedDomain         = $_.IsDefaultFederatedDomain
            EnableNego2Authentication        = $_.EnableNego2Authentication
            InitialDomain                    = $_.InitialDomain
            AdminDisplayName                 = $_.AdminDisplayName
            WhenChanged                      = $_.WhenChanged # WhenChangedUTC
            WhenCreated                      = $_.WhenCreated # WhenCreatedUTC
        }
    }

    <#
        PSComputerName                   = outlook.office365.com
        RunspaceId                       = d9fa549e-7be6-47b2-a0d1-322a6b095b0f
        PSShowComputerName               = False
        DomainName                       = evotecpoland.onmicrosoft.com
        CatchAllRecipientID              =
        DomainType                       = Authoritative
        MatchSubDomains                  = False
        AddressBookEnabled               = True
        Default                          = False
        EmailOnly                        = False
        ExternallyManaged                = False
        AuthenticationType               = Managed
        LiveIdInstanceType               = Business
        PendingRemoval                   = False
        PendingCompletion                = False
        FederatedOrganizationLink        = Federation
        MailFlowPartner                  =
        OutboundOnly                     = False
        PendingFederatedAccountNamespace = False
        PendingFederatedDomain           = False
        IsCoexistenceDomain              = False
        PerimeterDuplicateDetected       = False
        IsDefaultFederatedDomain         = False
        EnableNego2Authentication        = False
        InitialDomain                    = True
        AdminDisplayName                 =
        ExchangeVersion                  = 0.20 (15.0.0.0)
        Name                             = evotecpoland.onmicrosoft.com
        DistinguishedName                = CN=evotecpoland.onmicrosoft.com,CN=Accepted Domains,CN=Transport Settings,CN=Configuration,CN=evotecpoland.onmicrosoft.com,CN=ConfigurationUnits,DC=EURPR09A001,DC=PROD,DC=OUTLOOK,DC=COM
        Identity                         = evotecpoland.onmicrosoft.com
        ObjectCategory                   = EURPR09A001.PROD.OUTLOOK.COM/Configuration/Schema/ms-Exch-Accepted-Domain
        ObjectClass                      = {top, msExchAcceptedDomain}
        WhenChanged                      = 30.11.2016 00=00=22
        WhenCreated                      = 14.10.2015 15=22=40
        WhenChangedUTC                   = 29.11.2016 23=00=22
        WhenCreatedUTC                   = 14.10.2015 13=22=40
        ExchangeObjectId                 = 74986e16-092e-4fa1-8a04-f6990ed058a5
        OrganizationId                   = EURPR09A001.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/evotecpoland.onmicrosoft.com - EURPR09A001.PROD.OUTLOOK.COM/ConfigurationUnits/evotecpoland.onmicrosoft.com/Configuration
        Id                               = evotecpoland.onmicrosoft.com
        Guid                             = 74986e16-092e-4fa1-8a04-f6990ed058a5
        OriginatingServer                = VI1PR09A001DC05.EURPR09A001.PROD.OUTLOOK.COM
        IsValid                          = True
        ObjectState                      = Unchanged
    #>
}
