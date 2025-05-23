resource storageacc 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'mystorage1107181124'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
