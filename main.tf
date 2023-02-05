locals {
  ssh_user         = "ubuntu"
  key_name         = "onadeko"
  private_key_path = "~/Downloads/onadeko.pem"
  ansible_path     = "~/Downloads/apache.yaml"
}

provider "aws" {
region = "us-east-1"
access_key = "AKIATIWLIXROGWWYYLXR"
secret_key = "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"
}
# vpc
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  assign_generated_ipv6_cidr_block = "true"

  tags = {
    Name = "myvpc"
  }
}
# internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "myigw"
  }
}
# subnet
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "mypublic1"
    }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "mypublic2"
  }
}
# route table
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "myrt"
  }
}
# route table association
resource "aws_route_table_association" "rt-association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route-table.id
}
resource "aws_route_table_association" "rt-association1" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.route-table.id
}
# network acl
resource "aws_network_acl" "network" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.public1.id, aws_subnet.public2.id]

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "my-network"
}
}
# load balancer security group
resource "aws_security_group" "alp_sg" {
  name        = "alp_sg"
  description = "security group for load balancer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   tags = {
    Name = "allow_tls"
    }
}
# security group rule
  resource "aws_security_group" "sg-rule" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH, HTTP and HTTPS inbound traffic "
  vpc_id      = aws_vpc.vpc.id
 ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alp_sg.id]
  }
 ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alp_sg.id]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "security-grp-rule"
 }
}

# instance 1
resource "aws_instance" "instance" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = "onadeko"
  security_groups = [aws_security_group.sg-rule.id]
  subnet_id       = aws_subnet.public1.id
  availability_zone = "us-east-1a"
  tags = {
    Name   = "assignment1"
    source = "terraform"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install ansible -y
              sudo apt install apache2 -y
              EOF

             
}
   
# creating instance 2
 resource "aws_instance" "test" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = "onadeko"
  security_groups = [aws_security_group.sg-rule.id]
  subnet_id       = aws_subnet.public2.id
  availability_zone = "us-east-1b"
  tags = {
    Name   = "Assignment2"
    source = "terraform"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install ansible -y
              sudo apt install apache2 -y
              EOF
   
}

# instance 3
resource "aws_instance" "sample" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = "onadeko"
  security_groups = [aws_security_group.sg-rule.id]
  subnet_id       = aws_subnet.public1.id
  availability_zone = "us-east-1a"
  tags = {
    Name   = "assignment3"
    source = "terraform"
}
user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install ansible -y
              sudo apt install apache2 -y
              EOF
 
                      
}
   


# file to store ip address
resource "local_file" "Ip_address" {
  filename = "/vagrant/terraform_assignment/host-inventory"
  content  = <<EOT
  ${aws_instance.instance.public_ip}
  ${aws_instance.test.public_ip}
  ${aws_instance.sample.public_ip}
  EOT
}
# load balancer
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alp_sg.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  depends_on = [aws_instance.instance, aws_instance.test, aws_instance.sample]
}
# target group
resource "aws_lb_target_group" "tg" {
  name     = "tf-lb-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
}
}
# listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
# listener rule
resource "aws_lb_listener_rule" "rule" {
  listener_arn = aws_lb_listener.listener.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
resource "aws_lb_target_group_attachment" "attacha" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "attachb" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.test.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "attachc" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.sample.id
  port             = 80
}  
