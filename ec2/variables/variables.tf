variable "image_id"{
type  = string
default ="ami-031d574cddc5bb371"
description = "RHEL-9 AMI ID"
}

variable "instance_type"{
type  = string
default ="t3.micro"
description = "type of instance type"
}

variable "tags"{
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
}
}