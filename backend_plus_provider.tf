#Code to createe ec2 insstance and make sure it has no public IP

#TF12 Code (12.17)

terraform {
  required_version = ">= 0.12.17"

#When fully tested and ready to move to production, use code below to move to S3 backend.
//   backend "s3" {
//     bucket               = "NNtest-terraform-state"
//     encrypt              = "true"
//     dynamodb_table       = "NNtest-terraform-state-lock"
//     region               = "us-east-1"
//     key                  = "NNtest.tfstate"
//     workspace_key_prefix = ""
//     profile              = ""
//   }
}

provider "aws" {
  version = "~> 2.0"
  region  = var.region
  profile = var.profile
}
