provider "azurerm" {
  features {}
}

run "verify_key_vault_access_policy_object_id" {
  command = plan

  module {
    source = "./key_vault_access_policy"
  }

  variables {
    key_vault_id      = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.KeyVault/vaults/vaultValue"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
    object_id           = "00000000-0000-0000-0000-000000000000"
  }

  assert {
    condition     = azurerm_key_vault_access_policy.this.object_id == "00000000-0000-0000-0000-000000000000"
    error_message = "Key vault access object ID should match the provided value"
  }
}

run "verify_key_vault_access_policy_tenant_id" {
  command = plan

  module {
    source = "./key_vault_access_policy"
  }

  variables {
    key_vault_id      = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.KeyVault/vaults/vaultValue"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
    object_id           = "00000000-0000-0000-0000-000000000000"
  }

  assert {
    condition     = azurerm_key_vault_access_policy.this.tenant_id == "00000000-0000-0000-0000-000000000000"
    error_message = "Key vault access policy tenant_id should match the provided tenant_id"
  }
}