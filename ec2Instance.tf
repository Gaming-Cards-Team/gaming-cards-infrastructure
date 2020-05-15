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
  instance_type   = local.setting["instance_type"]
  security_groups = [aws_security_group.gaming_cards_sg.name]
  user_data       = file("${local.setting["bash_scripts_path"]}${local.setting["user_data_path"]}")
  key_name        = local.setting["ssh_key_name"]
		
  tags = {
    Name = "${local.setting["project_name"]}-${terraform.workspace}"
    Env = terraform.workspace
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = local.setting["ssh_user"]
      private_key = tls_private_key.gaming_cards_tls_private_key.private_key_pem
      host     = self.public_ip
    }
    scripts = ["${local.setting["bash_scripts_path"]}${local.setting["setup_script_path"]}"]
  }
}