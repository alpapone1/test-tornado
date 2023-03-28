####CREATE EC2 INSTANCE


## Getting latest Amazon2 Linux AMI image
data "aws_ami" "amazon2_ami_latest" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "app_server" {
  ami                                  = data.aws_ami.amazon2_ami_latest.id
  instance_type                        = var.instance_type
  associate_public_ip_address          = true
  key_name                             = var.aws_key
  availability_zone                    = var.aws_zones[0]
  vpc_security_group_ids               = [aws_security_group.web_sg.id]
  subnet_id                            = var.public_subnets[0]
  #user_data = templatefile("user_data.tfpl", { rds_endpoint = "${aws_db_instance.rds.endpoint}", user = var.db_user , password = var.db_password , dbname = var.db_name })
  user_data = templatefile("${path.module}/user_data.tfpl", { rds_endpoint = "${aws_db_instance.rds.endpoint}", user = var.db_user , password = var.db_password , dbname = var.db_name })
  instance_initiated_shutdown_behavior = "terminate"
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_root_size
  }


  tags = {
    Name = var.instance_name
  }

depends_on = [aws_db_instance.rds]
}

resource "aws_ebs_volume" "data_vol" {
 availability_zone = var.aws_zones[0]
 size = var.volume_data_size
 type = var.volume_type
 tags = {
        Name = "data-volume"
 }

}

resource "aws_volume_attachment" "data_vol" {
 device_name = "/dev/sdc"
 volume_id = aws_ebs_volume.data_vol.id
 instance_id = aws_instance.app_server.id
 skip_destroy = true
}


####CREATE WEB SECURITY GROUP 

resource "aws_security_group" "web_sg" {
  name   = "SG for Instance"
  description = "Terraform example security group"
  vpc_id      = var.vpc_id
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
       var.security_group_cidr,
    ]
  }

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
       var.security_group_cidr,
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-tornado-app-security-group"
  }

}
