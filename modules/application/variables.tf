variable "vpc_id" {
  description = "ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "IDs of the subnets used by the load balancer and Auto Scaling group."
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "ID of the SSH security group."
  type        = string
}

variable "public_http_sg_id" {
  description = "ID of the public HTTP security group used by the load balancer."
  type        = string
}

variable "private_http_sg_id" {
  description = "ID of the private HTTP security group used by the instances."
  type        = string
}

variable "ssh_sg_name" {
  description = "Name of the SSH security group, shown on the web page."
  type        = string
}

variable "private_http_sg_name" {
  description = "Name of the private HTTP security group, shown on the web page."
  type        = string
}

variable "launch_template_name" {
  description = "Name of the launch template."
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling group."
  type        = string
}

variable "lb_name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances."
  type        = number
}