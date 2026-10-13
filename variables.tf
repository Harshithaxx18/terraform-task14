variable "region" {
  description = "AWS region where resources are created."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to build all resource names."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "public_subnets" {
  description = "Public subnets keyed by suffix, each with a CIDR block and an availability zone."
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "allowed_ip_range" {
  description = "CIDR blocks allowed to reach SSH and HTTP."
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for the application instances."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling group."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling group."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling group."
  type        = number
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
}