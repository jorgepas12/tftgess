# Busca al archivo raiz de terragrunt
include {
    path = find_in_parent_folders()
}

# Cargamos el modulo de AWS VPC
terraform {
    source = "../modules/module_vpc"
}

# Pasamos las variables
inputs = {
    cidr_vpc = "10.80.0.0/16"

  tags = {
    "Environment" = "TerraEnv"
    "project"     = "demoscorp"
    "region"      = "virginia"
  }
}