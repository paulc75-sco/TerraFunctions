# Terraform Outputs Example - AWS EC2 Instance

This example demonstrates how to use Terraform outputs to display important information about provisioned resources. The example creates an AWS EC2 instance and shows how to output its ID, public IP, and private IP addresses.

## 📋 Overview

This example showcases:
- Creating an EC2 instance with configurable parameters
- Using output blocks to display resource attributes
- String interpolation in outputs
- Variable definition and usage
- Resource tagging

## 📁 Files Structure

```
terraform-outputs-example/
├── main.tf          # EC2 instance configuration
├── output.tf        # Output definitions
├── provider.tf      # AWS provider configuration
└── variables.tf     # Variable definitions
```

## 💻 Code Examples

### main.tf
```hcl
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = var.tags
}
```

### output.tf
```hcl
output "instance_id" {
  value = "The instance id is ${aws_instance.ec2.id}"
}

output "public_ip" {
  value = "The public IP is ${aws_instance.ec2.public_ip}"
}

output "private_ip" {
  value = "The private IP is ${aws_instance.ec2.private_ip}"
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

### variables.tf
```hcl
variable "ami" {
  description = "The ami to use with the EC2 instance"
  type        = string
  default     = "ami-0b2ed2e3df8cf9080"
}

variable "instance_type" {
  description = "Instance type to use for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  description = "Tags to be included with the EC2 instance"
  type        = map(string)
  default = {
    "Name"       = "Output_Demo"
    "Department" = "Nuclear Safety"
    "Owner"      = "Homer Simpson"
  }
}
```

## 🔍 Understanding Outputs

Terraform outputs allow you to:
1. Extract information about your infrastructure
2. Share data between modules
3. Display important values after applying changes

### Output Syntax
```hcl
output "<name>" {
  value = <expression>
}
```

### String Interpolation
The example uses string interpolation to create readable output messages:
```hcl
"The instance id is ${aws_instance.ec2.id}"
```

## 🚀 Usage

1. Clone this repository:
```bash
git clone <repository-url>
cd terraform-outputs-example
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

6. View a specific output:
```bash
terraform output public_ip
```

## 📝 Expected Outputs

After applying the configuration, you'll see outputs similar to:
```
Outputs:

instance_id = "The instance id is i-1234567890abcdef0"
public_ip   = "The public IP is 18.130.123.45"
private_ip  = "The private IP is 172.31.23.45"
```

## 🔧 Prerequisites

- Terraform >= 1.0
- AWS CLI configured
- AWS credentials with EC2 creation permissions
- Basic understanding of AWS EC2 instances

## ⚠️ Important Considerations

1. **Security**:
   - Be careful when outputting sensitive information
   - Consider using `sensitive = true` for sensitive outputs
   - Avoid exposing private credentials or keys

2. **Output Usage**:
   - Outputs are stored in state files
   - They can be used as data sources in other configurations
   - Useful for CI/CD pipelines and automation

3. **State Management**:
   - Outputs are only available after successful apply
   - They're stored in the Terraform state
   - Remote state allows sharing outputs between configurations

## 🛠 Common Patterns

1. **Formatting Outputs**:
```hcl
output "instance_details" {
  value = {
    id         = aws_instance.ec2.id
    public_ip  = aws_instance.ec2.public_ip
    private_ip = aws_instance.ec2.private_ip
  }
}
```

2. **Conditional Outputs**:
```hcl
output "public_ip" {
  value = try(aws_instance.ec2.public_ip, "No public IP assigned")
}
```

3. **Sensitive Outputs**:
```hcl
output "instance_password" {
  value     = aws_instance.ec2.password_data
  sensitive = true
}
```

## 📚 Additional Resources

- [Terraform Output Values Documentation](https://developer.hashicorp.com/terraform/language/values/outputs)
- [AWS EC2 Instance Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [Terraform Variables Documentation](https://developer.hashicorp.com/terraform/language/values/variables)

## 🤝 Contributing

Feel free to contribute to this example by:
1. Adding more output examples
2. Improving documentation
3. Adding advanced output patterns
4. Sharing real-world use cases