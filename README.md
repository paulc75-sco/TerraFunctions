# TerraFunctions

A collection of reusable Terraform modules and examples for various cloud providers including AWS and Azure.

## 🌟 Overview

TerraFunctions provides Infrastructure as Code (IaC) examples and modules to help you quickly deploy cloud resources using Terraform. This repository includes implementations for:
- AWS VPC and Networking
- AWS EC2 Instances
- Azure Resource Groups
- Azure Storage Accounts

## 📂 Repository Structure

```
TerraFunctions/
├── AWS/
│   ├── Modules/
│   │   └── Vpc/
│   └── Examples/
│       ├── vpc-with-subnets/
│       └── basic-ec2/
└── Azure/
    └── Examples/
        └── storage-account/
```

## 🚀 Examples

### AWS VPC with Subnets

Creates a VPC with multiple subnets using a for_each loop:

```hcl
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "PaulVPC"
  }
}

resource "aws_subnet" "mainsubnet" {
  for_each   = toset(var.vpc-subnets)
  cidr_block = each.value
  vpc_id     = aws_vpc.vpc.id
}
```

### AWS VPC Module Usage

Example of using the VPC module with public and private subnets:

```hcl
module "vpc" {
  source          = "../../../AWS/Modules/Vpc"
  vpc_cidr_block  = "10.0.0.0/16"
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  tags = {
    Name = "Testing Outputs"
  }
}
```

### Azure Storage Account

Example of creating an Azure storage account with its resource group:

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

## 📝 Import Examples

The repository includes examples of importing existing infrastructure. Here's a sample import block:

```hcl
import {
  to = aws_vpc.main-vpc
  id = "vpc-030ae6a075b2818fa"
}

import {
  to = aws_subnet.subnet0
  id = "subnet-025b9fb0f0f184c2a"
}
```

## 🔧 Prerequisites

- Terraform >= 1.0
- AWS CLI (for AWS resources)
- Azure CLI (for Azure resources)
- Appropriate cloud provider credentials configured

## 🚀 Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/TerraFunctions.git
```

2. Navigate to the desired example directory:
```bash
cd TerraFunctions/AWS/Examples/vpc-with-subnets
```

3. Initialize Terraform:
```bash
terraform init
```

4. Review the planned changes:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.