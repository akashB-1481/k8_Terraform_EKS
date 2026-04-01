variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/16"
}

variable "public_subnet_1_cidr" {
  type = string
  default = "192.168.16.0/24"
}

variable "public_subnet_2_cidr" {
  type = string
  default = "192.168.15.0/24"
}

variable "az1" {
  type = string
  default = "ap-south-1a"
}

variable "az2" {
  type = string
  default = "ap-south-1b"
}