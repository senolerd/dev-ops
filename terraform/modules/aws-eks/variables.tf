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


variable "CONTROLLER_SUBNETS" {
    type = list(object({
      name: string
      az: string
      cidr: string
    }))
    
    default = [
        {name : "controller-pub-subnet-1", az: "us-east-1a", cidr: "10.254.5.0/24"},
        {name : "controller-pub-subnet-2", az: "us-east-1b", cidr: "10.254.6.0/24"},
    ]
}


variable "WORKER_SUBNETS" {
    type = list(object({
      name: string
      az: string
      cidr: string
    }))
    
    default = [
        {name : "worker-priv-subnet-1", az: "us-east-1a", cidr: "10.254.1.0/24"},
        {name : "worker-priv-subnet-2", az: "us-east-1b", cidr: "10.254.2.0/24"},
        {name : "worker-priv-subnet-3", az: "us-east-1c", cidr: "10.254.3.0/24"},
        {name : "worker-priv-subnet-4", az: "us-east-1d", cidr: "10.254.4.0/24"},
    ]
}