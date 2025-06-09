data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
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
  tags = { Name = "${var.env}-web-sg" }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    echo "WELCOME TO LUIT - RED TEAM!" > /var/www/html/index.html
    systemctl restart httpd
  EOF

  tags = { Name = "${var.env}-webserver-1" }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}