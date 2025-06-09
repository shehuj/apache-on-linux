provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  env          = var.env
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
  az           = var.az
}

module "webserver" {
  source        = "./modules/webserver"
  env           = var.env
  instance_type = var.instance_type
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.subnet_id
}