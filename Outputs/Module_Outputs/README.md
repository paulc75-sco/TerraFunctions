# TerraFunctions - Module Outputs Example

This example demonstrates how to use outputs from a local Terraform VPC module, showing how to access and use module output values in your root module.

## 📋 Overview

This example showcases:
- Using a local VPC module from a shared modules directory
- Accessing and exposing module outputs
- Configuring VPC with public and private subnets
- Working with relative module paths

## 📁 Repository Structure

```
TerraFunctions/
├── Modules/
│   └── vpc/                  # VPC module directory
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── Outputs/
│   ├── Module_Outputs/       # This example directory
│   │   ├── main.tf          # Module usage
│   │   ├── output.tf        # Root module outputs
│   │   ├── provider.tf      # AWS provider configuration
│   │   └── terraform.tfvars
│   ├── ForEach/
│   ├── Import/
│   └── EC2_Outputs/
└── README.md
```

## 💻 Code Examples

### main.tf
```hcl
module "vpc" {
  source          = "../../Modules/vpc"
  vpc_cidr_block  = "10.0.0.0/16"
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  tags = {
    Name = "Testing Outputs"
  }
}
```

### output.tf
```hcl
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
```

## 🚀 Usage

1. Navigate to the example directory:
```bash
cd TerraFunctions/Outputs/Module_Outputs
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

5. View the outputs:
```bash
terraform output
```

## 📝 Expected Outputs

After applying, you'll see:
```hcl
Outputs:

vpc_id = "vpc-0abc123def456789"
public_subnets = [
  "subnet-0abc123def456789",
  "subnet-0def456789abc123",
  "subnet-0789abc123def456"
]
private_subnets = [
  "subnet-0123def456789abc",
  "subnet-0456789abc123def",
  "subnet-0789abc123def456"
]
```

## 🔧 Prerequisites

- Terraform >= 1.0
- AWS CLI configured
- AWS credentials with VPC creation permissions
- Basic understanding of Terraform modules and AWS VPC concepts

## ⚠️ Best Practices

1. **Module Usage**:
   - Use consistent path references
   - Keep module versions locked
   - Document required variables
   - Test module outputs

2. **Output Management**:
   - Only expose necessary values
   - Use descriptive output names
   - Document output formats
   - Consider output sensitivity

3. **Resource Organization**:
   - Follow consistent naming conventions
   - Group related resources
   - Use tags for resource management
   - Maintain clean directory structure

## 📚 Additional Resources

- [Terraform Module Documentation](https://developer.hashicorp.com/terraform/language/modules)
- [Terraform Output Values](https://developer.hashicorp.com/terraform/language/values/outputs)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [Terraform Best Practices](https://developer.hashicorp.com/terraform/language/modules/develop)

## 🤝 Contributing

Feel free to contribute to this example by:
1. Adding additional module examples
2. Improving documentation
3. Sharing best practices
4. Adding testing examples

## Notes

- This example is part of a larger collection of Terraform examples in the TerraFunctions repository
- The module structure follows AWS best practices for VPC setup
- The example demonstrates both public and private subnet configuration
- All subnet CIDR ranges are within the VPC CIDR block