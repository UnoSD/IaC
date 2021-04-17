terraform {
  backend "azurerm" {
    resource_group_name  = "rg-iac-demo"
    storage_account_name = "saiacdemo"
    container_name       = "terraform"
    key                  = "demo.tfstate"
  }
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "random_id" "storage_account" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "rg-terraform"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                      = "sa${lower(random_id.storage_account.hex)}"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}