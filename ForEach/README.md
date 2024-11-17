# Terraform for_each Example with AWS VPC and Subnets

This example demonstrates how to use Terraform's `for_each` meta-argument to create multiple AWS subnets within a VPC. The `for_each` functionality allows you to create multiple instances of a resource based on a map or set of strings.

## 📋 Overview

This example creates:
- One VPC with a specified CIDR block
- Multiple subnets within the VPC using the `for_each` loop
- Each subnet gets a unique CIDR block from a predefined list

## 📁 Files Structure

```
terraform-foreach-example/
├── main.tf          # Main configuration file
├── provider.tf      # Provider configuration
├── variables.tf     # Variable definitions
└── terraform.tfvars # Variable values
```

## 💻 Code Examples

### main.tf
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

### provider.tf
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

provider "aws" {
  # Configuration options
}
```

### variables.tf
```hcl
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "vpc-subnets" {
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}
```

### terraform.tfvars
```hcl
vpc-cidr    = "10.1.0.0/16"
vpc-subnets = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
```

## 🔍 Understanding for_each

In this example, `for_each` is used to create multiple subnet resources:

1. The `toset()` function converts the list of subnet CIDR blocks into a set
2. `for_each` iterates over this set
3. Each iteration creates a new subnet with:
   - `each.value`: The CIDR block for the subnet
   - `vpc_id`: The ID of the created VPC

## 🚀 Usage

1. Clone this repository:
```bash
git clone <repository-url>
cd terraform-foreach-example
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the planned changes:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

5. To destroy the infrastructure:
```bash
terraform destroy
```

## 📝 Notes

- The example creates 7 subnets as defined in terraform.tfvars
- Each subnet is created in the same VPC
- The CIDR blocks are within the VPC's CIDR range (10.1.0.0/16)
- The default values in variables.tf will be overridden by terraform.tfvars

## 🛠 Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Basic understanding of AWS VPC networking

## ⚠️ Important Considerations

1. Ensure your AWS credentials are properly configured
2. Verify the CIDR ranges don't overlap with existing networks
3. Remember that AWS has limits on the number of subnets per VPC
4. Consider adding availability zone specifications for production use

## 📚 Additional Resources

- [Terraform for_each Documentation](https://www.terraform.io/docs/language/meta-arguments/for_each.html)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)