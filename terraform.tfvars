region      = "eu-west-1"
name_prefix = "cmtr-cbzir072"
vpc_cidr    = "10.10.0.0/16"

public_subnets = {
  a = { cidr = "10.10.1.0/24", az = "eu-west-1a" }
  b = { cidr = "10.10.3.0/24", az = "eu-west-1b" }
  c = { cidr = "10.10.5.0/24", az = "eu-west-1c" }
}

allowed_ip_range = ["18.153.146.156/32", "203.170.48.2/32"]

instance_type        = "t3.micro"
asg_desired_capacity = 2
asg_min_size         = 2
asg_max_size         = 2

tags = {
  Project   = "cmtr-cbzir072"
  ManagedBy = "Terraform"
}