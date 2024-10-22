# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "subnet2" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.2.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet3" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.3.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet5" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.5.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet4" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.4.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet6" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.6.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet0" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.0.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet1" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.1.1.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-030ae6a075b2818fa"
}

# __generated__ by Terraform
resource "aws_vpc" "main-vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.1.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  tags = {
    Name = "PaulVPC"
  }
  tags_all = {
    Name = "PaulVPC"
  }
}
