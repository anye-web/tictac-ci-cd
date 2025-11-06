# vpc
variable "vpc_cidr" {
    description = "CIDR block for vpc"
    type = string
    default = "10.0.0.0/16"
}
# vpc
variable "availability_zones" {
    description = "Availability zones"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}
# vpc
variable "private_subnet_cidrs" {
 description = "Cidr block for private subnet" 
 type = list(string)
 default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24",]

}
# vpc
variable "public_subnet_cidrs" {
    description = "Public Subnet Cidrs"
    type = list(string)
    default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24",]
}

# Eks
variable "cluster_name" {
    description = "EKS cluster name"
    type = string
    default = "my-eks-cluster"
}

# Eks
variable "cluster_version" {
    description = "Kubernetes Version"
    type = string
    default = "1.32"
}

#  eks
variable "node_groups" {
    description = "EKS node group configuration"
    type = map(object({
      instance_types   = list(string)
      capacity_type    = string
      scaling_config   = object({
        desired_size   = number
        max_size       = number
        min_size       = number 
      })
    }))

    default = {
      general = {
        instance_types     = ["t3.medium"]
        capacity_type      = "ON_DEMAND"
        scaling_config  = {
            desired_size   = 3
            max_size       = 5
            min_size       = 1
        }
        
      }
    }
  
}