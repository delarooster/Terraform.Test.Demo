terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

module "storage" {
  source = "./storage"
  
  resource_group_name  = "example-rg"
  storage_account_name = "examplestorageacc"
  location            = "eastus"
}

module "key_vault" {
  source = "./key_vault"
  
  resource_group_name = "example-rg"
  key_vault_name      = "examplekeyvault"
  location            = "eastus"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
}

module "key_vault_access_policy" {
  source = "./key_vault_access_policy"

  key_vault_id = module.key_vault.id
  object_id    = "00000000-0000-0000-0000-000000000000"
  tenant_id    = "00000000-0000-0000-0000-000000000000"
}