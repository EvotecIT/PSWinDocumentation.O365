@{
    AliasesToExport   = @()
    Author            = 'Przemyslaw Klys'
    CmdletsToExport   = @()
    CompanyName       = 'Evotec'
    Copyright         = '(c) 2011 - 2021 Przemyslaw Klys @ Evotec. All rights reserved.'
    Description       = 'Dataset covering Office 365'
    FunctionsToExport = 'Get-WinO365'
    GUID              = '71ea1419-d950-444b-83c9-c579de74962a'
    ModuleVersion     = '0.0.8'
    PowerShellVersion = '5.1'
    PrivateData       = @{
        PSData = @{
            Tags       = @('Windows', 'Office365', 'O365')
            ProjectUri = 'https://github.com/EvotecIT/PSWinDocumentation.O365'
            IconUri    = 'https://evotec.xyz/wp-content/uploads/2018/10/PSWinDocumentation.png'
        }
    }
    RequiredModules   = @(@{
            ModuleVersion = '0.0.198'
            ModuleName    = 'PSSharedGoods'
            Guid          = 'ee272aa8-baaa-4edf-9f45-b6d6f7d844fe'
        }, @{
            ModuleVersion = '1.1.183.57'
            ModuleName    = 'MSOnline'
            Guid          = 'd162594e-d7aa-42be-9884-84928d3f7acf'
        }, @{
            ModuleVersion = '2.0.3'
            ModuleName    = 'ExchangeOnlineManagement'
            Guid          = 'B5ECED50-AFA4-455B-847A-D8FB64140A22'
        }, @{
            ModuleVersion = '2.0.2.130'
            ModuleName    = 'AzureAD'
            Guid          = 'd60c0004-962d-4dfb-8d28-5707572ffd00'
        }, @{
            ModuleVersion = '1.1.6'
            ModuleName    = 'MicrosoftTeams'
            Guid          = 'd910df43-3ca6-4c9c-a2e3-e9f45a8e2ad9'
        })
    RootModule        = 'PSWinDocumentation.O365.psm1'
    ScriptsToProcess  = @('Enums\O365.ps1')
}