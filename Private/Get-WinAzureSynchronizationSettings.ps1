function Get-WinAzureSynchronizationSetings {
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
            'Directory Synchronization' = $UAzureCompany.DirectorySynchronizationEnabled           # : False
            'Dir Sync Service Account'  = $UAzureCompany.DirSyncServiceAccount                     # :
            'Last DirSync Time'         = $UAzureCompany.LastDirSyncTime                           # :
            'Last Password Sync Time'   = $UAzureCompany.LastPasswordSyncTime                      # :
            'Password Synchronization'  = $UAzureCompany.PasswordSynchronizationEnabled            # : False
        }
    } else {
        [PSCustomObject] @{
            DirectorySynchronization = $UAzureCompany.DirectorySynchronizationEnabled           # : False
            DirSyncServiceAccount    = $UAzureCompany.DirSyncServiceAccount                     # :
            LastDirSyncTime          = $UAzureCompany.LastDirSyncTime                           # :
            LastPasswordSyncTime     = $UAzureCompany.LastPasswordSyncTime                      # :
            PasswordSynchronization  = $UAzureCompany.PasswordSynchronizationEnabled            # : False
        }
    }
}
