variable "VPC_NAME" {
    default = "not assigned"
    type = string
}

variable "REGION" {
    default = "us-east-1"
    type = string
}

variable "VPC_CIDR" {
    default = "10.254.0.0/16"
    type = string
}

variable "PRIVATE_SUBNET_1_CIDR" {
    default = "10.254.1.0/24"
    type = string
}

variable "PRIVATE_SUBNET_2_CIDR" {
    default = "10.254.3.0/24"
    type = string
}

variable "PUBLIC_SUBNET_1_CIDR" {
    default = "10.254.2.0/24"
    type = string
}

variable "PUBLIC_SUBNET_2_CIDR" {
    default = "10.254.4.0/24"
    type = string
}
