
resource "tls_private_key" "gaming_cards_tls_private_key" {
  algorithm = local.setting["algorithm"]
  rsa_bits  = local.setting["rsa_bits"]
}
resource "aws_key_pair" "gaming_cards_generated_key" {
  key_name   = local.setting["ssh_key_name"]
  public_key = tls_private_key.gaming_cards_tls_private_key.public_key_openssh
}
