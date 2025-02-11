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