provider "azurerm" {
  features {}
} 

run "verify_key_vault_creation" {
  command = plan

  module {
    source = "./key_vault"
  }

  variables {
    resource_group_name = "example-rg"
    key_vault_name      = "examplekeyvault"
    location            = "eastus"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
  }

  assert {
    condition     = azurerm_key_vault.this.tenant_id == "00000000-0000-0000-0000-000000000000"
    error_message = "Key vault tenant ID should be set to '00000000-0000-0000-0000-000000000000'"
  }
}

run "verify_key_vault_tags" {
  command = plan

  module {
    source = "./key_vault"
  }

  variables {
    resource_group_name = "example-rg"
    key_vault_name      = "examplekeyvault"
    location            = "eastus"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
  }

  assert {
    condition     = azurerm_key_vault.this.tags.environment == "test"
    error_message = "Environment tag should be set to 'test'"
  }
}

run "verify_key_vault_sku_name" {
  command = plan

  module {
    source = "./key_vault"
  }

  variables {
    resource_group_name = "example-rg"
    key_vault_name      = "examplekeyvault"
    location            = "eastus"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
  }

  assert {
    condition     = azurerm_key_vault.this.sku_name == "standard"
    error_message = "Key vault SKU should be Standard"
  }
}