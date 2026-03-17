variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-south-1"

}

variable "var_terra" {
  description = "Complete infrastructure configuration"
  type = object({
    vpc_cidr = string
    public_subnet_cidr = string
    az                 = string
    instance_type      = string
        
  })
  default = {
    vpc_cidr = "192.168.0.0/16"
    public_subnet_cidr = "192.168.16.0/24"
    az = "ap-south-1a"
    instance_type = "t2.micro"

  }
}