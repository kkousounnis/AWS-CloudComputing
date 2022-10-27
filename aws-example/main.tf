terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = "Add-Your-Public-Key"
  secret_key = "Add-Your-Secret-Key"
}

resource "aws_instance" "my-second-server" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "Example Ubuntu Application Server Instance"
  }
}
