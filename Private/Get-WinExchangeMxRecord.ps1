function Get-WinExchangeMxRecord {
    [CmdletBinding()]
    param(
        [string] $Prefix,
        [string] $Tenant,
        [switch] $Formatted,
        [Array] $ExchangeAcceptedDomains,
        [string] $Splitter = ', '
    )
    <# Get-MxRecordReport evotec.xyz
    PSComputerName                   : outlook.office365.com
    RunspaceId                       : 71a39192-2143-40be-8df2-92173c7e9efe
    PSShowComputerName               : False
    Organization                     : evotecpoland.onmicrosoft.com
    IsAcceptedDomain                 : True
    RecordExists                     : True
    PointsToService                  : True
    HighestPriorityMailhost          : evotec-xyz.mail.protection.outlook.com
    HighestPriorityMailhostIpAddress : 104.47.8.36
    Domain                           : evotec.xyz

    PSComputerName                   : outlook.office365.com
    RunspaceId                       : 71a39192-2143-40be-8df2-92173c7e9efe
    PSShowComputerName               : False
    Organization                     : evotecpoland.onmicrosoft.com
    IsAcceptedDomain                 : True
    RecordExists                     : True
    PointsToService                  : True
    HighestPriorityMailhost          : evotec-xyz.mail.protection.outlook.com
    HighestPriorityMailhostIpAddress : 104.47.10.36
    Domain                           : evotec.xyz

    #>
    if (-not $ExchangeAcceptedDomains) {
        $ExchangeAcceptedDomains = & "Get-$($prefix)AcceptedDomain"
    }

    foreach ($_ in $ExchangeAcceptedDomains.Name) {
        $MxRecordReport = & "Get-$($prefix)MxRecordReport" -Domain $_
        foreach ($Mx in $MxRecordReport) {
            if ($Formatted) {
                [PSCustomObject]@{
                    'Domain'             = $Mx.Domain
                    'Is Accepted Domain' = $Mx.IsAcceptedDomain
                    'Record Exists'      = $Mx.RecordExists
                    'Points to Service'  = $Mx.PointsToService
                    'Mailhost'           = $Mx.HighestPriorityMailhost
                    'Ip Addresses'       = $MxRecordReport.HighestPriorityMailhostIpAddress -join ', '
                    #Organization                     = $MxRecordReport.Organization
                }
            } else {
                [PSCustomObject]@{
                    Domain           = $Mx.Domain
                    IsAcceptedDomain = $Mx.IsAcceptedDomain
                    RecordExists     = $Mx.RecordExists
                    PointsToService  = $Mx.PointsToService
                    Mailhost         = $Mx.HighestPriorityMailhost
                    IpAddresses      = $MxRecordReport.HighestPriorityMailhostIpAddress
                    #Organization                     = $MxRecordReport.Organization
                }
            }
            # since the result will be the same except for ipadress changer (at least according to my tests we just need to loop once)
            break
        }
    }
}