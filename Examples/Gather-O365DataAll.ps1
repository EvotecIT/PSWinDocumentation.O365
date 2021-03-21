Import-Module .\PSWinDocumentation.O365.psd1 -Force

$O365 = Get-WinO365 -Formatted -Verbose
$O365