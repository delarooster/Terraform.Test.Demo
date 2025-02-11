# Azure Storage Account Terraform Module

This repository demonstrates how to use Terraform's built-in testing framework with an Azure Storage Account module.

## Prerequisites

- Terraform >= 1.6.0
- Azure subscription
- Azure CLI configured with appropriate credentials

## Directory Structure

```
.
├── main.tf                 # Root configuration
├── storage/               # Module directory
│   └── main.tf            # Module configuration
├── tests/                # Test directory
│   └── main.tftest.hcl    # Test file
└── README.md
```

## Module Usage

```hcl
module "storage" {
  source = "./storage"
  
  resource_group_name  = "example-rg"
  storage_account_name = "yourstorageaccount"
  location            = "eastus"
}
```

## Module Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| resource_group_name | Name of the resource group | string | yes |
| storage_account_name | Name of the storage account (must be globally unique) | string | yes |
| location | Azure region | string | no (defaults to eastus) |

## Testing

This module uses Terraform's built-in testing framework (introduced in Terraform 1.6). Tests are located in the `tests` directory.

To run the tests:

```bash
terraform init
terraform test
```

The test suite includes:
- Validation of storage account name format
- Verification of account tier and replication settings
- Tag validation

### Writing Additional Tests

To add new tests, create additional `.tftest.hcl` files in the `tests` directory. Example:

```hcl
run "test_name" {
  command = plan  # or apply

  module {
    source = "./storage"
  }

  variables {
    resource_group_name   = "example-rg"
    storage_account_name  = "examplestorageacc"
    location             = "eastus"
  }

  assert {
    condition     = module.main.azurerm_storage_account.this.account_tier == "Standard"
    error_message = "Storage account tier should be Standard"
  }
}
```

## License

MIT

## Notes

- This is a demonstration module showcasing Terraform's testing capabilities
- The storage account name must be globally unique across Azure
- The module currently uses LRS (Locally Redundant Storage) by default