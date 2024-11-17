variable "vpc_cidr_block" {
  type = string

}

variable "instance_tenancy" {
  type    = string
  default = "default"

}

variable "tags" {
  type = map(string)

}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)

}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)

}
