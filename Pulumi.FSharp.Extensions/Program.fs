module Program

open Pulumi.FSharp.AzureNative.Storage.Inputs
open Pulumi.FSharp.AzureNative.Resources
open Pulumi.FSharp.AzureNative.Storage
open Pulumi.AzureNative.Storage
open Pulumi.FSharp

let infra () =
    let rg =
        resourceGroup {
            name               "rg-pulumi"
            location           "West Europe"
        }

    storageAccount {
        name                   "sa"
        resourceGroup          rg.Name
        location               rg.Location
        enableHttpsTrafficOnly true
        kind                   Kind.StorageV2
        
        sku {
            name SkuName.Standard_LRS
        }            
    }

    dict []

[<EntryPoint>]
let main _ = Deployment.run infra
