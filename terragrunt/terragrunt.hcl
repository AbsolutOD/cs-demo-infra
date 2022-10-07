
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "cloudscape-demo-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "cloudscape-demo-lock"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "skip" # Allow modules to override provider settings
  contents  = <<EOF
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.34.0"
    }
  }
}
    
provider "aws" {
  region = "us-east-2"
}
EOF
}