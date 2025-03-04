# Input bindings are passed in via param block.
param($Timer)

# Import Az Modules
Import-Module Az.Resources
Import-Module Az.Storage

# Define storage account names
$storageAccounts = @(
    'raztype',
    'razautomationpsstore',
    'raznotesapistore',
    'razghcpaisearchstore'
    # Add more storage account names here as needed
)

foreach ($accountName in $storageAccounts) {
    try {
        # Get the storage account
        $storageAccount = Get-AzStorageAccount -ResourceGroupName (Get-AzStorageAccount | 
            Where-Object StorageAccountName -eq $accountName).ResourceGroupName -Name $accountName

        # Enable Storage Account Key Access
        $storageAccount | Set-AzStorageAccount -AllowSharedKeyAccess $true

        # Enable public network access from all networks
        $storageAccount | Set-AzStorageAccount -PublicNetworkAccess Enabled -NetworkRuleSet @{
            DefaultAction = "Allow"
        }

        Write-Host "Storage account '$accountName' has been configured with key access and public network access enabled."
    }
    catch {
        Write-Error "Failed to configure storage account '$accountName': $_"
    }
}