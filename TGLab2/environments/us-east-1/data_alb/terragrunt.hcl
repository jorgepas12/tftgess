# Busca al archivo raiz de terragrunt
include {
    path = find_in_parent_folders()
}

# Cargamos el modulo de ALB
terraform {
    source = "../modules/module_alb"
}

# Pasamos las variables
inputs = {
    vpcid = dependency.shared_vpc.outputs.idvpc
    pub1 = dependency.shared_vpc.outputs.pub1
    pub2 = dependency.shared_vpc.outputs.pub2
    albsg = dependency.shared_sg.outputs.albsgid

    albtgdata = {
        "name"  = "WebServersTG"
        "proto" = "HTTP"

    }

  albdata = {
    "name"   = "TerraALB"
    "type"   = "application"
    "proto1" = "80"
  }
}

# Creamos la dependencia de los valores a importar de las redes
dependency "shared_vpc" {
  config_path = "../data_vpc"
}

# Creamos la dependencia de los valores a importar el SGID
dependency "shared_sg" {
  config_path = "../data_sg"
}