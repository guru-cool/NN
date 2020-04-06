variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "tags" {}
variable "vpc_security_group_ids" {}
variable "bastion_host" {}
variable "ami_user" {}
variable "bastion_user" {}
 
resource "aws_instance" "vm" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = false
  tags                        = var.tags
  }

  resource "null_resource" "check_public_ip" {
  triggers = {
    vm_id = aws_instance.vm.id
    #Change trigger to below to make it run always. Use this also to test.
    #always_run = "${timestamp()}"
  }


  connection {
    host = aws_instance.vm.private_ip
    user = var.ami_user
    agent = true
    bastion_host = var.bastion_host
    bastion_user = var.bastion_user
  }

  provisioner "remote-exec" {
    inline = [ "pvt_ip=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`   && echo Private IP of this instance is: $pvt_ip", "pub_ip=`curl -sf http://169.254.169.254/latest/meta-data/public-ipv4` && echo -E OOPS, you got a public IP. Public IP of this instance is: $pub_ip || echo Good Install, no public IP found."]
  }
}

