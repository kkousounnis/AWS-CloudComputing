terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}


# configure the Aws provider

provider "aws" {
  region = "us-east-1"
}

# Create a VPC

resource "aws_vpc" "mylab" {
  cidr_block = "172.20.0.0/16"

  tags = {
    Name = "my-lab-vpc"
  }
}

# Create Subnet (Public) 

resource "aws_subnet" "mylab1" {
  vpc_id     = aws_vpc.mylab.id
  cidr_block = "172.20.10.0/24"

  tags = {
    Name = "my-Lab-subnet-1"
  }
}

# Create internet Gateway

resource "aws_internet_gateway" "mylab2" {
  vpc_id = aws_vpc.mylab.id

  tags = {
    Name = "my-lab-internet-gateway"
  }

}
