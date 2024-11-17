# Terraform Import Example - AWS VPC and Subnets

This example demonstrates how to use Terraform's import functionality to bring existing AWS infrastructure under Terraform management. The example shows how to import an existing VPC and multiple subnets into your Terraform state.

## 📋 Overview

This example covers:
- Importing an existing VPC into Terraform state
- Importing multiple existing subnets
- Using Terraform's new import blocks syntax (available from Terraform 1.5+)

## 🎯 Purpose

The purpose of this example is to show how to:
1. Bring existing infrastructure under Terraform management
2. Use the declarative import blocks syntax
3. Handle multiple related resources during import

## 💻 Code Example

### import.tf
```hcl
import {
  to = aws_vpc.main-vpc
  id = "vpc-030ae6a075b2818fa"
}

import {
  to = aws_subnet.subnet0
  id = "subnet-025b9fb0f0f184c2a"
}

import {
  to = aws_subnet.subnet1
  id = "subnet-02731e6b5157251c1"
}

import {
  to = aws_subnet.subnet2
  id = "subnet-02f653aef9f3fe32c"
}

import {
  to = aws_subnet.subnet3
  id = "subnet-01edf4fb3361ccfd2"
}

import {
  to = aws_subnet.subnet4
  id = "subnet-047881f499af81cda"
}

import {
  to = aws_subnet.subnet5
  id = "subnet-0801ef0b193de5faa"
}

import {
  to = aws_subnet.subnet6
  id = "subnet-066493212ce21935d"
}
```

## 🔍 Understanding Import Blocks

The import block syntax consists of two main parts:
1. `to` - Specifies the Terraform resource address where the infrastructure will be imported
2. `id` - The cloud provider's identifier for the existing resource

Example:
```hcl
import {
  to = aws_vpc.main-vpc        # Terraform resource address
  id = "vpc-030ae6a075b2818fa" # AWS VPC ID
}
```

## 🚀 Usage Steps

1. Create the import blocks file:
```bash
# Create import.tf with the import blocks
```

2. Create corresponding resource blocks:
```hcl
# Create empty resource blocks for each imported resource
resource "aws_vpc" "main-vpc" {
}

resource "aws_subnet" "subnet0" {
}

# ... repeat for other subnets
```

3. Initialize Terraform:
```bash
terraform init
```

4. Generate configuration:
```bash
terraform plan -generate-config-out=generated_resources.tf
```

5. Review and apply the import:
```bash
terraform plan
terraform apply
```

## 📝 Important Notes

1. **Resource Blocks Required**: You must have corresponding resource blocks for each imported resource
2. **State Management**: The import process will add the resources to your Terraform state
3. **Configuration Generation**: Use `-generate-config-out` to help create initial resource configurations
4. **Incremental Import**: You can import resources incrementally if needed
5. **ID Verification**: Double-check resource IDs before importing to avoid errors

## ⚠️ Best Practices

1. **Backup State**: Always backup your Terraform state before performing imports
2. **Resource Organization**: 
   - Use consistent naming conventions
   - Group related resources together
   - Document resource relationships
3. **Testing**:
   - Test imports in a non-production environment first
   - Verify resource configurations after import
4. **Documentation**:
   - Document the source of imported resources
   - Keep track of imported resource IDs
   - Document any manual modifications needed after import

## 🔧 Prerequisites

- Terraform >= 1.5 (for import blocks syntax)
- AWS CLI configured with appropriate permissions
- Access to the AWS Console to verify resource IDs
- Existing AWS resources to import

## 🛠 Common Issues and Solutions

1. **Resource Not Found**
   - Verify the resource ID is correct
   - Ensure you have proper AWS permissions
   - Check the AWS region configuration

2. **State Conflicts**
   - Backup your state before importing
   - Use `terraform state rm` if you need to remove incorrectly imported resources
   - Import resources one at a time if experiencing issues

3. **Configuration Mismatches**
   - Use `terraform plan -generate-config-out` to get accurate configurations
   - Compare generated configurations with existing resources
   - Update configurations incrementally

## 📚 Additional Resources

- [Terraform Import Documentation](https://developer.hashicorp.com/terraform/cli/import)
- [Import Blocks Syntax](https://developer.hashicorp.com/terraform/language/import)
- [AWS Resource Import Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform State Management](https://developer.hashicorp.com/terraform/language/state)

## 🤝 Contributing

Feel free to contribute to this example by:
1. Adding more import examples
2. Improving documentation
3. Sharing common issues and solutions
4. Adding best practices from real-world usage