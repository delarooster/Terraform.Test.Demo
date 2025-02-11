variable "key_vault_name" {
  type        = string
  description = "Name of the key vault"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}
