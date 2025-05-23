param storageAccountName string
param storageAccountLocation string
param storageAccountKind string
param sku object

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: storageAccountLocation
  sku: sku
  kind: storageAccountKind
}
