# Terraform Variable Validation Examples

This repository demonstrates different approaches to variable validation in Terraform using Azure resources as examples. The project creates a resource group and storage account while showcasing various validation techniques to ensure infrastructure consistency and prevent deployment errors.

## Project Structure

### main.tf
```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sg" {
  name                     = var.sg_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.sg_account_tier
  account_replication_type = var.sg_account_replication_type
}
```

### variables.tf
```hcl
variable "rg_name" {
  description = "Name of the resource group"
  type        = string

  validation {
    condition     = lower(var.rg_name) == var.rg_name
    error_message = "Resource group names should be lowercase only. Update the variables file"
  }
}

variable "location" {
  description = "Location for the deployments"
  type        = string
  validation {
    condition     = contains(["West Europe", "France Central"], var.location)
    error_message = "The location should be West Europe. Update the TFvars file"
  }
}

variable "subscription_id" {
  type = string
}

variable "sg_name" {
  description = "Name of the storage account"
  type        = string

  validation {
    condition     = length(var.sg_name) >= 3 && length(var.sg_name) <= 24
    error_message = "The storage account name should be between 3 and 24 characters long. Update the TFvars file"
  }

  validation {
    condition     = lower(var.sg_name) == var.sg_name
    error_message = "Storage account names should be lowercase characters only. Update the TFvars file"
  }

  validation {
    condition     = can(regex("ct", var.sg_name))
    error_message = "Storage accounts should begin with ct. Update the TFVARS file"
  }
}

variable "sg_account_tier" {
  description = "Account tier for the storage account"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.sg_account_tier)
    error_message = "The account tier should be Standard or Premium only. Update the TFvars file"
  }
}

variable "sg_account_replication_type" {
  description = "Replication type used for the storage account"
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "ZRS"], var.sg_account_replication_type)
    error_message = "The account replication type can only be LRS, GRS or ZRS. Either leave it blank for LRS or update the TFvars file with the required value."
  }
}
```

## Validation Examples Demonstrated

### 1. String Case Validation
- Resource Group name must be lowercase
- Storage Account name must be lowercase

### 2. Length Validation
- Storage Account name must be between 3 and 24 characters

### 3. Allowed Values Validation
- Location is restricted to "West Europe" or "France Central"
- Storage Account tier must be either "Standard" or "Premium"
- Storage Account replication type must be "LRS", "GRS", or "ZRS"

### 4. Pattern Validation
- Storage Account name must include "ct"

## Variables

| Variable Name | Description | Validation Rules |
|--------------|-------------|------------------|
| rg_name | Resource Group Name | Must be lowercase |
| location | Azure Region | Must be "West Europe" or "France Central" |
| subscription_id | Azure Subscription ID | No validation |
| sg_name | Storage Account Name | - Length: 3-24 characters<br>- Must be lowercase<br>- Must contain "ct" |
| sg_account_tier | Storage Account Tier | Must be "Standard" or "Premium" |
| sg_account_replication_type | Storage Replication Type | Must be "LRS", "GRS", or "ZRS" |

## Usage

1. Create a `terraform.tfvars` file with your values:
```hcl
rg_name                      = "myresourcegroup"
location                     = "West Europe"
subscription_id              = "your-subscription-id"
sg_name                      = "ctstorageaccount"
sg_account_tier             = "Standard"
sg_account_replication_type = "LRS"
```

2. Initialize Terraform:
```bash
terraform init
```

3. Plan your deployment:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

## Validation Error Messages

The script will display helpful error messages if validation fails:

- Resource Group name: "Resource group names should be lowercase only. Update the variables file"
- Location: "The location should be West Europe. Update the TFvars file"
- Storage Account name length: "The storage account name should be between 3 and 24 characters long. Update the TFvars file"
- Storage Account name case: "Storage account names should be lowercase characters only. Update the TFvars file"
- Storage Account prefix: "Storage accounts should begin with ct. Update the TFVARS file"
- Account tier: "The account tier should be Standard or Premium only. Update the TFvars file"
- Replication type: "The account replication type can only be LRS, GRS or ZRS. Either leave it blank for LRS or update the TFvars file with the required value."

## Notes

- The storage account name must follow Azure's naming conventions
- Default values are provided for storage account tier (Standard) and replication type (LRS)
- All validation errors provide specific guidance on how to correct the issue