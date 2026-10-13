variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "igw_name" {
  description = "Name of the internet gateway."
  type        = string
}

variable "route_table_name" {
  description = "Name of the public route table."
  type        = string
}

variable "subnet_name_prefix" {
  description = "Prefix for public subnet names; the map key is appended."
  type        = string
}

variable "public_subnets" {
  description = "Public subnets keyed by suffix, each with a CIDR block and an availability zone."
  type = map(object({
    cidr = string
    az   = string
  }))
}