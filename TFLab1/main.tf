module "iamrole" {
  source = "./modules/module_iam"

  datapolicy = {
    "name" = "SessionManagerPolicy"
    "desc" = "Sesion remota a las instancias de EC2"
  }
  datarole = {
    "inlinepname" = "LimitReadPolicy"
    "profilerole" = "InstanceProfileEC2r"
  }
}

module "awsvpc" {
  source = "./modules/module_vpc/"

  cidr_vpc = "10.80.0.0/16"

  tags = {
    "Environment" = "TerraEnv"
    "project"     = "demoscorp"
    "region"      = "virginia"
  }
}

module "awssg" {
  source = "./modules/module_sg/"

  vpcid = module.awsvpc.idvpc

  sg_ingress_cidr = "0.0.0.0/0"

  ingres_port_listALB = [80]
  ingres_port_listEC2 = [22]

}

module "awslb" {
  source = "./modules/module_alb/"

  vpcid  = module.awsvpc.idvpc
  pubsub = module.awsvpc.pubsubnet
  albsg  = module.awssg.albsgid

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

module "awsasg" {
  source = "./modules/module_asg/"

  ec2role = module.iamrole.role-arn
  albsg   = module.awssg.albsgid
  albtgarn = module.awslb.tgarn
  pubsub = module.awsvpc.pubsubnet


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

module "awsbacs3" {
  source = "./modules/module_bacloc"
}