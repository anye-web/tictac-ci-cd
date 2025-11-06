module "vpc" {
  source = "git::https://github.com/anye-web/Terraform-Modules.git//vpc"

  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  private_subnet_cidrs  = var.private_subnet_cidrs
  public_subnet_cidrs   = var.public_subnet_cidrs
  cluster_name          = var.cluster_name
}

module "eks" {
    source = "git::https://github.com/anye-web/Terraform-Modules.git//eks"

    cluster_name       = var.cluster_name
    cluster_version    = var.cluster_version
    vpc_id             = module.vpc.vpc_id
    subnet_id          = module.vpc.private_subnet_id 
    node_groups        = var.node_groups

}