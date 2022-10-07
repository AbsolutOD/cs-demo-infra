include {
    path = find_in_parent_folders()
}

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

terraform {
    source = "../../terraform/ecr"
}

// locals {
//     common_vars = read_terragrunt_config(find_in_parent_folders())
// }

// inputs = {
//     stack_name = "veracity-uat-redis"
//     resource_group_name = local.common_vars.inputs.resource_group_name
//     location = local.common_vars.inputs.location
// }
