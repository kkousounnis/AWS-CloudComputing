terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "my-second-server-on-aws" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "Example Ubuntu Application Server Instance"
  }
}
