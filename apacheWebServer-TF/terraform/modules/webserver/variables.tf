variable "env" {
  description = "Environment name (used for tagging)"
  type        = string
  default     = "prod"
}

variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "ID of the VPC where instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to launch instance in"
  type        = string
}