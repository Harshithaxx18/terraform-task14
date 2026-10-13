locals {
  vpc_name             = "${var.name_prefix}-vpc"
  igw_name             = "${var.name_prefix}-igw"
  route_table_name     = "${var.name_prefix}-rt"
  ssh_sg_name          = "${var.name_prefix}-ssh-sg"
  public_http_sg_name  = "${var.name_prefix}-public-http-sg"
  private_http_sg_name = "${var.name_prefix}-private-http-sg"
  launch_template_name = "${var.name_prefix}-template"
  asg_name             = "${var.name_prefix}-asg"
  lb_name              = "${var.name_prefix}-lb"
  target_group_name    = "${var.name_prefix}-tg"
  subnet_name_prefix   = "${var.name_prefix}-subnet-public"
}

module "network" {
  source = "./modules/network"

  vpc_name           = local.vpc_name
  vpc_cidr           = var.vpc_cidr
  igw_name           = local.igw_name
  route_table_name   = local.route_table_name
  subnet_name_prefix = local.subnet_name_prefix
  public_subnets     = var.public_subnets
}

module "network_security" {
  source = "./modules/network_security"

  vpc_id               = module.network.vpc_id
  allowed_ip_range     = var.allowed_ip_range
  ssh_sg_name          = local.ssh_sg_name
  public_http_sg_name  = local.public_http_sg_name
  private_http_sg_name = local.private_http_sg_name
}

module "application" {
  source = "./modules/application"

  vpc_id               = module.network.vpc_id
  subnet_ids           = module.network.subnet_ids
  ssh_sg_id            = module.network_security.ssh_sg_id
  public_http_sg_id    = module.network_security.public_http_sg_id
  private_http_sg_id   = module.network_security.private_http_sg_id
  ssh_sg_name          = local.ssh_sg_name
  private_http_sg_name = local.private_http_sg_name
  launch_template_name = local.launch_template_name
  asg_name             = local.asg_name
  lb_name              = local.lb_name
  target_group_name    = local.target_group_name
  instance_type        = var.instance_type
  asg_desired_capacity = var.asg_desired_capacity
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
}