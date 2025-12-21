variable "region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "key_name" {}
variable "allowed_ports" {
  default = [80, 443, 8080, 9070, 8768, 7897, 3000, 9000]
}