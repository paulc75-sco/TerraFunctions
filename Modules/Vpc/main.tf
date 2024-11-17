resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = var.tags


}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = var.tags


}


resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.public_subnets, count.index)
  tags       = var.tags


}


resource "aws_subnet" "private_subnets" {
  count      = length((var.private_subnets))
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.private_subnets, count.index)

  tags = var.tags

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = var.tags

}

resource "aws_route_table_association" "aws_route_table_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.route_table.id


}
