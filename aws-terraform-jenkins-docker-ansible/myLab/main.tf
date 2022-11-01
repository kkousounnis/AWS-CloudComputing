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
  cidr_block = var.cidr_block[0]
  tags = {
    Name = "my-lab-vpc"
  }
}

# Create Subnet (Public) 

resource "aws_subnet" "mylab1" {
  vpc_id     = aws_vpc.mylab.id
  cidr_block = var.cidr_block[1]

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


# Create Security Group 

resource "aws_security_group" "mylab3" {

  name        = "My lab security group"
  description = "To allow inbound and outbound traffic to my lab"
  vpc_id      = aws_vpc.mylab.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {

      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = {
    Name = "allow-traffic"
  }
}

# Create route table and association

resource "aws_route_table" "mylab4" {
  vpc_id = aws_vpc.mylab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mylab2.id
  }


  tags = {
    Name = "route-table"
  }
}

resource "aws_route_table_association" "mylab5" {

  subnet_id      = aws_subnet.mylab1.id
  route_table_id = aws_route_table.mylab4.id
}


# Create an AWS EC2 Instance


resource "aws_instance" "linux" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.mylab3.id]
  subnet_id                   = aws_subnet.mylab1.id
  associate_public_ip_address = true

  tags = {
    "Name" = "linux-instance"
  }

}

