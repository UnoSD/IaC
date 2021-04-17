param location string

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }  
  sku: {
    name: 'Standard_LRS'
  }
}
