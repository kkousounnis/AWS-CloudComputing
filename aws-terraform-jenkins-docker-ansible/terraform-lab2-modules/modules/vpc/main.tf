# Create VPC
resource "aws_vpc" "terraform" {
  cidr_block = var.cidr_block_from_variablesfile

  tags = {
    Name = "terrform-vpc"
  }

}
