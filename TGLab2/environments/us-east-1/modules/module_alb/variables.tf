variable "vpcid" {
  description = "Valor de la VPC Importado"
}

variable "albsg" {
  description = "Valor del ALB SG Importado"
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

variable "albtgdata" {
  description = "Datos del AWS ALB target group "
  type        = map(string)
}

variable "albdata" {
  description = "Datos del AWS ALB target group "
  type        = map(string)
}