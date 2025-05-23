resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'myacc1130181124'
  location: 'westus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
