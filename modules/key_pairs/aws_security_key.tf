variable "tags" {}
variable "public_key" {}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
  tags = var.tags
}
output "key_name" {
  value = aws_key_pair.deployer.key_name
}