targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-01-01' = {
  name: 'rg-bicep'
  location: 'West Europe'
  scope: subscription()
}

module stgModule './storageAccount.bicep' = {
  name: 'storageDeploy'
  scope: rg
  params: {
    location: rg.location
  }
}
