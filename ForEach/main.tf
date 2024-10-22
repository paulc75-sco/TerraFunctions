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
