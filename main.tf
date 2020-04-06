module "vm" {
    source = "./modules/aws_instance"
    ami_id                         = var.ami_id
    instance_type               = var.instance_type
    key_name                    = module.key_pairs.key_name
    subnet_id                   = var.subnet_id
    vpc_security_group_ids      = [ module.security_groups.allow_ssh_sg_id ]
    tags                        = var.tags
    bastion_user                = var.bastion_user
    bastion_host                = var.bastion_host
    ami_user                    = var.ami_user
}



module "key_pairs" {
  source = "./modules/key_pairs"
  tags = var.tags
  public_key = var.public_key
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = var.vpc_id
  subnet_cidr_block = var.subnet_cidr_block 
}
