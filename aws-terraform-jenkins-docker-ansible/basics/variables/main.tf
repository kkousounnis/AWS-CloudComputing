terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# configure the Aws provider

provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "Terraform-VPC" {
  cidr_block = var.cidr

  tags = {
    Name = "Terrform-VPC"

    VPC_Name   = var.vpc_name
    VPC_Number = var.vpc_name
    VPC_Exists = var.vpc_exists
    VPC_List   = var.vpc_list[0]
    VPC_Map    = var.vpc_map["Key1"]
    VPC_Tuple  = var.vpc_tuple[1]
    VPC_Object = var.vpc_object["Key2"]
  }

}
