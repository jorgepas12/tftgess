# Busca al archivo raiz de terragrunt
include {
    path = find_in_parent_folders()
}

# Cargamos el modulo de ASG
terraform {
    source = "../modules/module_asg"
}

# Pasamos las variables
inputs = {

    ec2role = dependency.shared_iam.outputs.role-arn
    pub1 = dependency.shared_vpc.outputs.pub1
    pub2 = dependency.shared_vpc.outputs.pub2
    websg  = dependency.shared_sg.outputs.websg
    albtgarn = dependency.shared_alb.outputs.tgarn

    dataLT = {
        "nameLT"  = "BaseServerLT"
        "tagname" = "ServersASGLinux"
        "ami"     = "ami-0eaf7c3456e7b5b68"
        "itype"   = "t2.micro"
    }
    dataASG = {
        "name" = "TerraASG"
        "type"     = "application"
        "proto1" = "80"
    }

}

# Creamos la dependencia de los valores a importar de las redes
dependency "shared_vpc" {
  config_path = "../data_vpc"
}

# Creamos la dependencia de los valores a importar del ALB
dependency "shared_alb" {
  config_path = "../data_alb"
}

# Creamos la dependencia de los valores a importar del InstanceRole
dependency "shared_iam" {
  config_path = "../data_iam"
}

# Creamos la dependencia de los valores a importar del SGID
dependency "shared_sg" {
  config_path = "../data_sg"
}