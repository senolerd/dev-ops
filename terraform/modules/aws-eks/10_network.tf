
resource "aws_vpc" "vpc_for_eks" {
    cidr_block      = var.VPC_CIDR
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    region = var.REGION
    tags = {
      Name = var.VPC_NAME
    }
}


resource "aws_subnet" "worker-private-subnets" {
  vpc_id = aws_vpc.vpc_for_eks.id
  for_each = { for subnet in var.WORKER_SUBNETS : subnet.name => subnet}
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = {
    "Name" = "${var.VPC_NAME}-${each.value.name}"
    "Deployment" = var.VPC_NAME
    "kubernetes.io/role/internal-elb" = "1"
  }
}


resource "aws_subnet" "controller-public-subnets" {
  vpc_id = aws_vpc.vpc_for_eks.id
  for_each = { for subnet in var.CONTROLLER_SUBNETS : subnet.name => subnet}
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = {
    "Name" = "${var.VPC_NAME}-${each.value.name}"
    "Deployment" = var.VPC_NAME
    "kubernetes.io/role/elb" = "1"
    "Type" = "controller-subnet"
  }
}


resource "aws_default_route_table" "name" {
  default_route_table_id = aws_vpc.vpc_for_eks.default_route_table_id
  tags = {
    "Name" = "${var.VPC_NAME}-default-route-table"
  }
}


resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc_for_eks.id
  tags = {
    "Name" = "${var.VPC_NAME}-internet-gw"
  }
}


resource "aws_route_table" "RT-PUBLIC" {
  vpc_id = aws_vpc.vpc_for_eks.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "${var.VPC_NAME}-default-route-for-IGW"
  }
}


resource "aws_route_table_association" "public-subnet-1-default-route-for-igw" {
  for_each = aws_subnet.controller-public-subnets
  route_table_id = aws_route_table.RT-PUBLIC.id
  subnet_id= each.value.id
}





