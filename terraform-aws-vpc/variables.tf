##project variables
variable "project_name" {
  type = string

}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(string)

}

##vpc variables
variable "vpc_name" {
  type    = string
  default = "swetha-vpc"

}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true

}

variable "vpc_tags" {
  type = map(string)
  default = {

  }

}

variable "igw_tags" {
  type = map(string)
  default = {

  }

}
##public subnet
variable "public_subnet_cidrs" {
  type = list(any)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "value must be a list of two CIDR blocks"
  }
}

variable "public_subnet_cidr_tags" {
  type    = map(any)
  default = {}
}
