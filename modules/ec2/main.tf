resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("${path.module}/terraform-key.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "public" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  subnet_id               = var.public_subnet_id
  vpc_security_group_ids  = [var.security_group_id]
  key_name                = var.key_name
  
  tags = {
    Name = "terraform-ubuntu-ec2"
  }
}
