Import-Module .\PSWinDocumentation.O365.psd1 -Force

#Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service AzureAD, MSOnline, ExchangeOnline,Teams,SkypeOnline
#Connect-WinConnectivity -UserName 'przemyslaw.klys@evotec.pl' -FilePath 'C:\Support\Important\Password-O365-Evotec.txt' -AsSecure -Service SkypeOnline

#if (-not $O365) {
$O365 = Get-WinO365 -Formatted -Verbose
#}
