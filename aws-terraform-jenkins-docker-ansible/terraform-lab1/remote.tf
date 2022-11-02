# Provider Requirement : How to declare providers so Terraform can install me.

terraform {
  backend "remote" {
    organization = "CoodleTerraformLab"

    workspaces {
      name = "TerraformLab"
    }
  }
}
