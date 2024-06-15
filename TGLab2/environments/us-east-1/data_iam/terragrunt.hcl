# Busca al archivo raiz de terragrunt
include {
    path = find_in_parent_folders()
}

# Cargamos el modulo de IAM
terraform {
    source = "../modules/module_iam"
}

# Pasamos las variables
inputs = {
    datapolicy = {
        "name" = "SessionManagerPolicy"
        "desc" = "Sesion remota a las instancias de EC2"
    }
    datarole = {
        "inlinepname" = "LimitReadPolicy"
        "profilerole" = "InstanceProfileEC2r"
    }
}