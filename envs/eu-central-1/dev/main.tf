module "main" {
  source = "../../../modules/"

  aws_region      = var.aws_region
  environment    = var.environment
  vpc_name = var.vpc_name
  vpc_id  = var.vpc_id
  cidr = var.cidr
  security_group_cidr = var.security_group_cidr
  rds_sg = var.rds_sg
  allowed_cidr_blocks = var.allowed_cidr_blocks
  aws_zones = var.aws_zones
  volume_type = var.volume_type
  volume_data_size = var.volume_data_size
  volume_root_size = var.volume_root_size
  subnet_name_private = var.subnet_name_private
  aws_key = var.aws_key
  
  instance_type = var.instance_type
  instance_name = var.instance_name

  zone_id  = data.aws_route53_zone.public.zone_id
  dns_name = var.dns_name

  db_params_group = var.db_params_group
  db_version = var.db_version
  db_password = var.db_password
  db_user = var.db_user
  db_storage = var.db_storage
  db_instance_class = var.db_instance_class
  db_name = var.db_name
  
  private_subnet_1 = data.aws_subnet.private_subnet_1.id
  private_subnet_2 = data.aws_subnet.private_subnet_2.id
  private_subnet_3 = data.aws_subnet.private_subnet_3.id
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
}

