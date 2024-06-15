variable "ec2role" {
  description = "Valor el EC2 Role Importado"
}

variable "websg" {
  description = "Valor del Web SG Importado"
}

variable "albtgarn" {
  description = "Valor del ARN Target Group Importado"
}

# variable "pubsub" {
#   description = "Valor de las subredes publicas Importadas"
# }

variable "pub1" {
  description = "Valor de las subredes publica 1 Importada"
}

variable "pub2" {
  description = "Valor de las subredes publica 2 Importada"
}

variable "dataLT" {
    description = "Datos de AWS Launch Tempalte para AWS ASG"
    type = map(string)
}

variable "dataASG" {
    description = "Datos de AWS Auto Scaling Group"
    type = map(string)
}