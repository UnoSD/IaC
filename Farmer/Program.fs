open Farmer
open Farmer.Builders

let storage = storageAccount {
    name "sarandom767"
    sku Storage.Sku.Standard_LRS
}

let deployment = arm {
    location Location.WestEurope
    add_resource storage
}

deployment
|> Deploy.execute "rg-farmer" Deploy.NoParameters
|> ignore