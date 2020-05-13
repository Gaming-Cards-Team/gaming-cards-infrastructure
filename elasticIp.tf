
data "aws_eip" "by_public_ip" {
    public_ip = local.setting["public_ip"]
}

resource "aws_eip_association" "gaming_cards_eip_assoc" {
  instance_id   = aws_instance.gaming_cards.id
  public_ip     = data.aws_eip.by_public_ip.public_ip
}

/*resource "aws_eip" "gaming_cards_eip" {
  instance = aws_instance.gaming_cards.id
  vpc      = true
}*/