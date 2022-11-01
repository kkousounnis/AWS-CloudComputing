# Providers

# Are plugins that connect to the real world
/*
    Terraform registry (main directory of publicly available Terraform providers)
    https://registry.terraform.io/browse/providers

    
*/

terraform {
  aws = {
    source = "hashicorp/aws" //Shortcut of https://registry.terraform.io/browse/providers/hashicorp/aws/latest
  }
}
