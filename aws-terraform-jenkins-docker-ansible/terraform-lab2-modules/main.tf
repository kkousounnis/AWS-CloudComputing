terraform = {
  required_providers = {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# configure the Aws provider

provider "aws" {
  region = "us-east-1"
}


# Create a module block

module "vpc" {
  # where to find the module
  source                        = "./modules/vpc"
  cidr_block_from_variablesfile = var.cidr
}

module "subnet" {
  source                         = "./modules/subnet"
  cidr_subnet_from_variablesfile = var.cidr_subnet1

}
