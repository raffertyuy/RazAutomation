# Input bindings are passed in via param block.
param($Timer)

# Import Az Modules
Import-Module Az.Resources
Import-Module Az.Storage

# Get the storage account
$storageAccount = Get-AzStorageAccount -ResourceGroupName (Get-AzStorageAccount | Where-Object StorageAccountName -eq 'raztype').ResourceGroupName -Name 'raztype'

# Enable Storage Account Key Access
$storageAccount | Set-AzStorageAccount -AllowSharedKeyAccess $true

# Enable public network access from all networks
$storageAccount | Set-AzStorageAccount -PublicNetworkAccess Enabled -NetworkRuleSet @{
    DefaultAction = "Allow"
}

Write-Host "Storage account 'raztype' has been configured with key access and public network access enabled."