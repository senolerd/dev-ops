provider "aws" {
    # Assumed, AWS configuration for [default] is set and that account has necessary policy/permissions attached
    # To use remote state backend, backend block must be edited for accessable from the aws accound that will be used to
    # use resources defined in this terraform files.
    region = "us-east-1"
}

# ###  EKS DEV MODULE
# module "aws-EKS-DEV" {
#     source = "./modules/aws"
#     VPC_NAME="EKS-DEV"
#     REGION="us-east-1"
#     VPC_CIDR="10.0.0.0/16"
#     PRIVATE_SUBNET_1_CIDR = "10.0.1.0/24"
#     PRIVATE_SUBNET_2_CIDR = "10.0.3.0/24"
#     PUBLIC_SUBNET_1_CIDR = "10.0.2.0/24"
#     PUBLIC_SUBNET_2_CIDR = "10.0.4.0/24"
# }
# output "EKS-DEV-VPC" {
#   value = module.aws-EKS-DEV.VPC
# }



# ####  EKS STAGE MODULE
# module "aws-EKS-STAGE" {
#     source = "./modules/aws"
#     VPC_NAME="EKS-STAGE"
#     REGION="us-east-1"
#     VPC_CIDR="10.1.0.0/16"
#     PRIVATE_SUBNET_1_CIDR = "10.1.1.0/24"
#     PRIVATE_SUBNET_2_CIDR = "10.1.3.0/24"
#     PUBLIC_SUBNET_1_CIDR = "10.1.2.0/24"
#     PUBLIC_SUBNET_2_CIDR = "10.1.4.0/24"
# }
# output "EKS-STAGE-VPC" {
#   value = module.aws-EKS-STAGE.VPC
# }



# ####  EKS PROD MODULE
# module "aws-EKS-PROD" {
#     source = "./modules/aws"
#     VPC_NAME="EKS-PROD"
#     REGION="us-east-1"
#     VPC_CIDR="10.2.0.0/16"
#     PRIVATE_SUBNET_1_CIDR = "10.2.1.0/24"
#     PRIVATE_SUBNET_2_CIDR = "10.2.3.0/24"
#     PUBLIC_SUBNET_1_CIDR = "10.2.2.0/24"
#     PUBLIC_SUBNET_2_CIDR = "10.2.4.0/24"
# }
# output "EKS-PROD-VPC" {
#   value = module.aws-EKS-PROD.VPC
# }
