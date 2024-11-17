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
