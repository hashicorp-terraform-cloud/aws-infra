provider "aws" {
}

data "aws_ami" "rhel" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"] # Red Hat Cloud Acces Gold Image
}

data "aws_security_group" "default_sg" {
  name = "default"
}

resource "aws_key_pair" "rhel" {
  key_name   = format("%s-%s", var.instance_name, "key")
  public_key = var.ssh_admin_user_public_key
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  description       = "SSH Ingress to Instance"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = data.aws_security_group.default_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_instance" "rhel" {
  ami                         = data.aws_ami.rhel.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = aws_key_pair.rhel.key_name 

  tags = {
    Name = var.instance_name
  }
}