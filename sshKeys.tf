
data "aws_s3_bucket_object" "ssh_private_key" {
  bucket = "gaming-cards-terraform-remotestate"
  key    = "${local.setting["ssh_key_name"]}.pem"
}

data "tls_public_key" "gaming_cards_tls_public_key" {
  private_key_pem = data.aws_s3_bucket_object.ssh_private_key.body
}

resource "aws_key_pair" "gaming_cards_generated_key" {
  key_name   = "${local.setting["ssh_key_name"]}-${terraform.workspace}"
  public_key = data.tls_public_key.gaming_cards_tls_public_key.public_key_openssh
}
