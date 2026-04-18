# I have read somewhere some zones are allowed, i forgot to take note where it was
# AWS Region	 | Region name	            | Disallowed Availability Zone IDs
# us-east-1    | US East (N. Virginia)   | use1-az3
# us-west-1    | US West (N. California) | usw1-az2
# ca-central-1 | Canada (Central)        | cac1-az3

module "aws-EKS-DEV" {
    source = "../../modules/aws-eks"
    VPC_NAME="EKS-DEV"
    REGION="us-east-1"
    VPC_CIDR="10.0.0.0/16"
    WORKER_SUBNETS= [
        {name : "worker-priv-subnet-1", az: "us-east-1a", cidr: "10.0.1.0/24"},
        {name : "worker-priv-subnet-2", az: "us-east-1b", cidr: "10.0.2.0/24"},
        {name : "worker-priv-subnet-3", az: "us-east-1c", cidr: "10.0.3.0/24"},
        {name : "worker-priv-subnet-4", az: "us-east-1d", cidr: "10.0.4.0/24"},
    ]
    CONTROLLER_SUBNETS= [
        {name : "controller-pub-subnet-1", az: "us-east-1a", cidr: "10.0.5.0/24"},
        {name : "controller-pub-subnet-2", az: "us-east-1b", cidr: "10.0.6.0/24"},
    ]
        
}


