variable "region" { 
    description = "AWS region to deploy resources in"
    type        = string
    default = "us-east-1" 
}

variable "az"       { 
    description = "AWS availability zone to deploy resources in"
    type        = string
    default = "us-east-1a" 
    }

variable "env"      { 
    description = "Environment name (used for tagging)"
    type        = string
    default = "prod" 
}

variable "vpc_cidr" { 
    description = "CIDR block for the VPC"
    type        = string
    default = "10.0.0.0/16" 
}

variable "subnet_cidr" { 
    description = "CIDR block for the public subnet"
    type        = string
    default = "10.0.1.0/24" 
}

variable "instance_type" { 
    description = "EC2 instance type for the web server"
    type        = string
    default = "t2.micro" 
}