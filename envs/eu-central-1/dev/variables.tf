variable "aws_region" {
  description = "Value of the region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "aws_key" {
  description = "AWS key-pair associated with the instance"
  default     = "test-tornado"
}

variable "dns_name" {
  description = "DNS Name"
  type        = string
  default     = "test-paolo.tornado.com"
}

data "aws_route53_zone" "public" {
  name = "tornado.com."
  private_zone = false 
}

variable "aws_zones" {
  type = list
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "db_name" {
  description = "DB Name"
  type        = string
  default     = "test-tornado"
}

variable "db_user" {
  description = "DB user"
  type        = string
  default     = "testdb"
}

variable "db_password" {
  description = "DB password"
  type        = string
  default     = "test1234"
}

variable "volume_root_size" {
  description = "The size of the root EBS volume"
  type        = string
  default     = "20"
}

variable "volume_data_size" {
  description = "The size of the data EBS volume"
  type        = string
  default     = "100"
}

variable "volume_type" {
  description = "The type of the EBS volume"
  type        = string
  default     = "gp2"
}

variable "instance_name" {
  description = "EC2 instance Name"
  type        = string
  default     = "test-tornado-webserver"
}

variable "endpoint" {
  description = "Value of the endpoint"
  type        = string
  default     = "http://rds-test.tornado.com"
}

variable "db_instance_class" {
  description = "DB instance class"
  default = "db.t3.micro"
}

variable "db_version" {
  default = "8.0"
}

variable "db_storage" {
  description = "DB storage in GB"
  default = "5"
}

# environment type dev / qa / prod 
variable "environment" {
  default = "dev"
}

variable "subnet_name_private" {
  default = "db-test-tornado-private"
}

data "aws_subnet" "private_subnet_1" {
  id = "subnet-0ceaa8ab91542762d"
}

data "aws_subnet" "private_subnet_2" {
  id = "subnet-02fa2e911024b2022"
}

data "aws_subnet" "private_subnet_3" {
  id = "subnet-0cc6c5edddbc345e7"
}

data "aws_subnet" "public_subnet_1" {
  id = "subnet-0ctaa8ab91542762d"
}

data "aws_subnet" "public_subnet_2" {
  id = "subnet-06fa2e911024b2022"
}

data "aws_subnet" "public_subnet_3" {
  id = "subnet-04c6c5edddbc345e7"
}

variable "rds_sg" {
  default = "rds-sg-test-tornado"
}

variable "db_params_group" {
  default = "default-mysql"
}

variable "vpc_name" {
  default = "vpc-test-tornado"
}

variable "vpc_id" {
  default = "vpc-0147d9e5500618404"
}

variable "allowed_cidr_blocks" {
  type = list
   default  = ["0.0.0.0/0"]
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "security_group_cidr" {
  default = "10.0.0.0/8"
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

