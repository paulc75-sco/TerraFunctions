variable "vpc-cidr" {
    default = "10.0.0.0/16"
  
}

variable "vpc-subnets" {
    default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
    }
  
