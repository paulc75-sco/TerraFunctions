variable "rg_name" {
  description = "Name of the resource group"
  type        = string

  validation {
    condition     = lower(var.rg_name) == var.rg_name
    error_message = "Resource group names should be lowercase only.  Update the variables file"
  }

}

variable "location" {
  description = "Lcation for the deployments"
  type        = string
  validation {
    condition     = contains(["West Europe", "France Central"], var.location)
    error_message = "The location should be West Europe.  Update the TFvars file"
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
    error_message = "Storage account names should be lowercase characters only.  Update the TFvars file"
  }

  validation {
    condition     = can(regex("ct", var.sg_name))
    error_message = "Storage accounts should begin with ct.  Update the TFVARS file"
  }

}

variable "sg_account_tier" {
  description = "Account tier for the storage account"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.sg_account_tier)
    error_message = "The account tier should be Standard or Premium only.  Update the TFvars file"
  }

}

variable "sg_account_replication_type" {
  description = "Replication type used for the storage account"
  type        = string
  default     = "LRS"

  validation {

    condition     = contains(["LRS", "GRS", "ZRS"], var.sg_account_replication_type)
    error_message = "The account replication type can onlybe LRS, GRS or ZRS. Either leave it black for LRS or update the TFvars file with the required value."
  }

}
