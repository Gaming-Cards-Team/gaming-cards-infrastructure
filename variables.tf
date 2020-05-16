locals {
  settings = {
    default = {
        project_name = "gaming-cards"
        instance_type = "t2.micro"
        ssh_user = "ubuntu"
        algorithm = "RSA"
        rsa_bits  = 4096
        bash_scripts_path = "bashScripts/"
    }
    pro  = {
        user_data_path = "userDataPro.sh"
        setup_script_path = "startupInstancePro.sh"
        public_ip = "3.16.209.207"
        ssh_key_name = "gaming_cards_generated_key_pro"
    }
    qa    = {
        user_data_path = "userDataQa.sh"
        setup_script_path = "startupInstanceQa.sh"
        public_ip = "3.23.123.190"
        ssh_key_name = "gaming_cards_generated_key_qa"
    }
  }
  setting = merge(local.settings["default"], local.settings[terraform.workspace])
}