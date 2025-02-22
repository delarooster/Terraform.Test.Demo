resource "azurerm_key_vault_access_policy" "this" {
  key_vault_id    = var.key_vault_id
  tenant_id       = var.tenant_id
  object_id       = var.object_id
  secret_permissions = ["Get"]
}