provider "azurerm" {
  features {}
} 

run "verify_storage_account_creation" {
  command = plan

  module {
    source = "./storage"
  }

  variables {
    resource_group_name   = "example-rg"
    storage_account_name  = "examplestorageacc"
    location             = "eastus"
  }

  assert {
    condition     = azurerm_storage_account.this.account_tier == "Standard"
    error_message = "Storage account tier should be Standard"
  }

  assert {
    condition     = azurerm_storage_account.this.account_replication_type == "LRS"
    error_message = "Storage account replication type should be LRS"
  }

  assert {
    condition     = azurerm_storage_account.this.tags.environment == "test"
    error_message = "Environment tag should be set to 'test'"
  }
}

# File: tests/defaults.tftest.hcl
run "verify_name_validation" {
  command = plan

  module {
    source = "./storage"
  }

  variables {
    resource_group_name   = "example-rg"
    storage_account_name  = "invalid-name-with-hyphens"  # This should fail validation
    location             = "eastus"
  }

  expect_failures = [
    var.storage_account_name
  ]
}