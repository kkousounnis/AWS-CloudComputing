resource "aws_subnet" "tarraformlab1" {

  vpc_id     = var.vpc_id_from_vpcmodule
  cidr_block = var.cidr_subnet_from_variablesfile

  tags = {
    "Name" = "terraformlab-subnet-1"
  }

}
