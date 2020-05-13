locals {
  settings = {
    default = {
        project_name = "gaming-cards"
    }
    pro  = {
        user_data_path = "userDataPro.sh"
        setup_script_path = "startupInstancePro.sh"
        public_ip = "3.16.209.207"
    }
    qa    = {
        user_data_path = "userDataQa.sh"
        setup_script_path = "startupInstanceQa.sh"
        public_ip = "3.23.123.190"
    }
  }
  setting = merge(local.settings["default"], local.settings[terraform.workspace])
}