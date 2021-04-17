Arm {
  Resource "sa$(Get-Random)" -Namespace 'Microsoft.Storage' -Type 'storageAccounts' -ApiVersion '2019-06-01' -Location 'West Europe' {
    ArmSku Standard_LRS

    properties {
      supportsHttpsTrafficOnly $true
    }
  }
}