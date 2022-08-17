provider "aws" {
}

data "aws_ami" "rhel" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"] # Red Hat Cloud Acces Gold Image
}

resource "aws_instance" "rhel" {
  ami           = data.aws_ami.rhel.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
