# Testing Terraform Modules

This repository demonstrates how to use Terraform's built-in testing framework with Terraform HCL modules.

## Prerequisites

- Terraform >= 1.6.0
- Azure subscription
- Azure CLI configured with appropriate credentials

## Basic Directory Structure

```
├── storage/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── tests/
│   └── storage.tftest.hcl
├── .gitignore
├── main.tf
└── readme.md
```

## Module Components

### Storage Module

Located in the `/storage` directory, this module manages storage resources with the following components:

- `main.tf`: Contains the primary storage resource configurations
- `outputs.tf`: Defines the output values exposed by the module
- `variables.tf`: Declares all variables used within the module

### Tests

The `/tests` directory contains automated tests for the module:

- `storage.tftest.hcl`: Test configurations for validating storage resources

### Root Configuration

- `main.tf`: The root module configuration file
- `.terraform.lock.hcl`: Terraform dependency lock file
- `.gitignore`: Specifies which files Git should ignore

## Getting Started

1. Ensure you have Terraform installed
2. Clone this repository
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Run the tests:
   ```bash
   terraform test
   ```

## Contributing

When contributing to this module:

1. Create a new branch for your changes
2. Update tests as needed
3. Ensure all tests pass before submitting a pull request
4. Update documentation to reflect any changes

## License

MIT

## Notes

- This is a demonstration module showcasing Terraform's testing capabilities
- The storage account name must be globally unique across Azure
- The module currently uses LRS (Locally Redundant Storage) by default