variable "image_id" {
  type        = string
  default     = "ami-0c614dee691cbbf37"
  description = "RHEL-9 AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "type of instance type"
}

variable "tags" {
  default = {
    Project     = "Expense"
    Environment = "Dev"
    Module      = "DB"
    Name        = "DB"
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "allowing port 22"
}

variable "ssh_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "allowed_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

