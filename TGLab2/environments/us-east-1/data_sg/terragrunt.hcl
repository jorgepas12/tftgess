# Busca al archivo raiz de terragrunt
include {
    path = find_in_parent_folders()
}

# Cargamos el modulo de SG
terraform {
    source = "../modules/module_sg"
}

# Pasamos las variables
inputs = {
    vpcid = dependency.shared_infra.outputs.idvpc
    sg_ingress_cidr = "0.0.0.0/0"

  ingres_port_listALB = [80]
  ingres_port_listEC2 = [22]
}

dependency "shared_infra" {
  config_path = "../data_vpc"
}