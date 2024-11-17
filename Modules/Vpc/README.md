# AWS VPC Terraform Module

This Terraform module creates a VPC with public and private subnets in AWS.

## Features

- Creates a VPC with custom CIDR block
- Creates an Internet Gateway
- Creates public subnets with internet access
- Creates private subnets
- Configurable instance tenancy
- Automatic route table configuration for public subnets
- Supports custom tagging for all resources

## Usage

```hcl
module "vpc" {
  source = "./path/to/module"

  vpc_cidr_block  = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  
  tags = {
    Environment = "Production"
    Team        = "DevOps"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_cidr_block | The CIDR block for the VPC | `string` | n/a | yes |
| instance_tenancy | The instance tenancy option for the VPC | `string` | `"default"` | no |
| public_subnets | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| private_subnets | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| tags | Tags to be applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| public_subnets | List of IDs of public subnets |
| private_subnets | List of IDs of private subnets |

## Resource Creation

This module creates the following resources:

1. AWS VPC
2. Internet Gateway
3. Public Subnets (quantity based on input)
4. Private Subnets (quantity based on input)
5. Route Table for public subnets
6. Route Table Associations for public subnets

## Notes

- Public subnets are automatically configured with internet access through the Internet Gateway
- Private subnets are created without internet access
- All resources are tagged according to the provided tags variable
- The module supports multiple public and private subnets for high availability

## Examples

### Basic VPC with Two Subnets

```hcl
module "vpc" {
  source = "./path/to/module"

  vpc_cidr_block  = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
  
  tags = {
    Environment = "Development"
    Terraform   = "true"
  }
}
```

### Multi-AZ VPC Setup

```hcl
module "vpc" {
  source = "./path/to/module"

  vpc_cidr_block  = "172.16.0.0/16"
  public_subnets  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
  private_subnets = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
  
  tags = {
    Environment = "Production"
    Terraform   = "true"
    Team        = "Infrastructure"
  }
}
```