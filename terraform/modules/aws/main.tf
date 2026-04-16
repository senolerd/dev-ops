
resource "aws_vpc" "vpc_for_eks" {
    cidr_block       = var.VPC_CIDR
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    region = var.REGION
    tags = {
      Name = var.VPC_NAME
    }
}

resource "aws_subnet" "subnet_for_eks_private_1" {
  vpc_id = aws_vpc.vpc_for_eks.id
  cidr_block = var.PRIVATE_SUBNET_1_CIDR
  tags = {
    "Name" = "${var.VPC_NAME}-private-subnet-1"
    "Deployment" = var.VPC_NAME
  }
}

resource "aws_subnet" "subnet_for_eks_private_2" {
  vpc_id = aws_vpc.vpc_for_eks.id
  cidr_block = var.PRIVATE_SUBNET_2_CIDR
  tags = {
    "Name" = "${var.VPC_NAME}-private-subnet-2"
    "Deployment" = var.VPC_NAME
  }
}

resource "aws_subnet" "subnet_for_eks_public_1" {
  vpc_id = aws_vpc.vpc_for_eks.id
  cidr_block = var.PUBLIC_SUBNET_1_CIDR
  tags = {
    "Name" = "${var.VPC_NAME}-public-subnet-1"
    "Deployment" = var.VPC_NAME
  }
}

resource "aws_subnet" "subnet_for_eks_public_2" {
  vpc_id = aws_vpc.vpc_for_eks.id
  cidr_block = var.PUBLIC_SUBNET_2_CIDR
  tags = {
    "Name" = "${var.VPC_NAME}-public-subnet-2"
    "Deployment" = var.VPC_NAME
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


resource "aws_route_table" "RT" {
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
  route_table_id = aws_route_table.RT.id
  subnet_id= aws_subnet.subnet_for_eks_public_1.id
}

resource "aws_route_table_association" "public-subnet-2-default-route-for-igw" {
  route_table_id = aws_route_table.RT.id
  subnet_id= aws_subnet.subnet_for_eks_public_2.id

}







output "VPC" {
  value = aws_vpc.vpc_for_eks
}