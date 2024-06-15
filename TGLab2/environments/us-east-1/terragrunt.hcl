# Cramos el bucket para el backend remoto con bloqueo
remote_state {
    backend = "s3"

    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        bucket = "terragruntbucket-ieu72"
        key = "us-east-1/${path_relative_to_include()}/terraform.tfvars"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "courses-lock-table"
        profile = "default"
    }
    
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn = "arn:aws:iam::472867741616:role/TerraTGRole"
        session_name = "terra-session"
        external_id  = "93734a9282-e21d-2c35-b293-029283840199"
    }
}
EOF
}