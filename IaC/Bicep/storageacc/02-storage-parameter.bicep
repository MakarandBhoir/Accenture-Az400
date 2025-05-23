param storageAccountName string = 'myacc1130181124b'
param storageAccountSku string = 'Standard_LRS'
param storageAccountLocation string = 'westus'
param storageAccountKind string = 'StorageV2'
param sku object = {
  name: storageAccountSku
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: storageAccountLocation
  sku: sku
  kind: storageAccountKind
}
