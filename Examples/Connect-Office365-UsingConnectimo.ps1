Import-Module Connectimo -Force

# THose may be a bit outdated as Connectimo wasn't updated for a while
Connect-WinConnectivity -UserName 'przemyslaw.klys@euvic.pl' -AsSecure -Service AzureAD, MSOnline, ExchangeOnline -MultiFactorAuthentication
Connect-WinConnectivity -UserName 'przemyslaw.klys@euvic.pl' -AsSecure -Service ExchangeOnline -MultiFactorAuthentication
Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service SkypeOnline