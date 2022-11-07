variable "cidr_block" {
  type    = list(string)
  default = ["172.20.0.0/16", "172.20.10.0/24"]
}

variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 8080, 8081]
}

variable "ami" {
  type    = string
  default = "ami-09d3b3274b6c5d4aa"
}

variable "ami_ubuntu" {
  type    = string
  default = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_type_for_nexus" {
  type    = string
  default = "t2.medium"
}

variable "key_name" {
  type    = string
  default = "Virginia-KP2"
}
