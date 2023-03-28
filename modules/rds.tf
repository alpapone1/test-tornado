####CREATE RDS SUBNET GROUP####

resource "aws_db_subnet_group" "rds" {
  name       = var.subnet_name_private
  #subnet_ids = [data.aws_subnet.private_subnet_1.id, data.aws_subnet.private_subnet_2.id, data.aws_subnet.private_subnet_3.id]
  subnet_ids = [var.private_subnet_1, var.private_subnet_2, var.private_subnet_3]

  tags = {
    Name = var.subnet_name_private
  }
}



######CREATE RDS SECURITY GROUP

resource "aws_security_group" "rds" {
  name        = var.rds_sg
  vpc_id      = var.vpc_id


  ingress {
    description = "ssh"
    security_groups= [aws_security_group.web_sg.id]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    description = "MYSQL"
    security_groups= [aws_security_group.web_sg.id]
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }


  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.rds_sg
  }
}


### CREATE DB PARAMETER GROUP

resource "aws_db_parameter_group" "rds" {
  name   = var.db_params_group
  family = "mysql8"

  parameter {
    name  = "autocommit"
    value = "1"
  }

  parameter {
    name  = "binlog_error_action"
    value = "IGNORE_ERROR"
  }
}


##### CREATE RDS DB INSTANCE######

resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_storage
  engine               = "mysql"
  engine_version       = var.db_version
  instance_class       = var.db_instance_class
  identifier           = var.db_name
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds.id
  publicly_accessible = false
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name =  aws_db_parameter_group.rds.id
  skip_final_snapshot  = true


  tags = {
    Name = "Test-Tornado-RDS-MYSQL"
  }
}
