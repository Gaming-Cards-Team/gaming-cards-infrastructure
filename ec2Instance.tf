data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] #Canonical
}

resource "aws_instance" "gaming_cards" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.gaming_cards_sg.name]
  user_data       = file(local.setting["user_data_path"])
  key_name        = "nodeInstance"
		
  tags = {
    Name = "${local.setting["project_name"]}-${terraform.workspace}"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("~/.ssh/nodeInstance.pem")
      host     = self.public_ip
    }
    scripts = [local.setting["setup_script_path"]]
  }
}