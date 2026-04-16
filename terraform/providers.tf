terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  
  #### Environment variables for s3 remote state backend
  # 
  # backend "s3" {
  #   bucket = "TF_VAR_S3_BACKEND_BUCKET"
  #   key = "TF_VAR_S3_BACKEND_PATH"
  #   region = "TF_VAR_S3_BACKEND_REGION"
  # }
}

