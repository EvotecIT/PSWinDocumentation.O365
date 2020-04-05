function Get-WinAzureCompany {
    [CmdletBinding()]
    param(
        [Array] $UAzureCompany,
        [switch] $Formatted,
        [string] $Splitter
    )
    if ($null -eq $UAzureCompany) {
        $UAzureCompany = Get-WinUAzureCompany
    }


    if ($Formatted) {
        [PSCustomObject] @{
            'Company Name'       = $UAzureCompany.DisplayName
            'Preferred Language' = $UAzureCompany.PreferredLanguage
            Street               = $UAzureCompany.Street
            City                 = $UAzureCompany.City
            State                = $UAzureCompany.State
            'Postal Code'        = $UAzureCompany.PostalCode
            Country              = $UAzureCompany.Country
            'Country Code'       = $UAzureCompany.CountryLetterCode
            'Telephone Number'   = $UAzureCompany.TelephoneNumber
            'Marketing Emails'   = $UAzureCompany.MarketingNotificationEmails -join $Splitter
            'Technical Emails'   = $UAzureCompany.TechnicalNotificationEmails -join $Splitter
        }
    } else {
        [PSCustomObject] @{
            CompanyName       = $UAzureCompany.DisplayName
            PreferredLanguage = $UAzureCompany.PreferredLanguage
            Street            = $UAzureCompany.Street
            City              = $UAzureCompany.City
            State             = $UAzureCompany.State
            PostalCode        = $UAzureCompany.PostalCode
            Country           = $UAzureCompany.Country
            CountryLetterCode = $UAzureCompany.CountryLetterCode
            TelephoneNumber   = $UAzureCompany.TelephoneNumber
            MarketingEmails   = $UAzureCompany.MarketingNotificationEmails
            TechnicalEmails   = $UAzureCompany.TechnicalNotificationEmails
        }
    }
}