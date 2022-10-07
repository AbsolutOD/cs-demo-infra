include {
    path = find_in_parent_folders()
}

// remote_state {
//   backend = "s3"
//   generate = {
//     path      = "backend.tf"
//     if_exists = "overwrite"
//   }
//   config = {
//     bucket         = "cloudscape-demo-state"
//     key            = "${path_relative_to_include()}/terraform.tfstate"
//     region         = "us-east-2"
//     encrypt        = true
//     dynamodb_table = "cloudscape-demo-lock"
//   }
// }

terraform {
    source = "../../terraform/rds"
}
