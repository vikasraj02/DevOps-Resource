provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  allowed_ports        = var.allowed_ports   # 🔥 THIS FIXES YOUR ERROR
}

terraform {
  backend "s3" {
    bucket = "terraform-state-vikas-12345"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}



module "ec2" {
  source = "./modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  security_group_id = module.vpc.security_group_id
  key_name          = var.key_name
}
