# Not describing variables since the names are self explanatory
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "tags" {}
variable "vpc_id" {}
variable  "subnet_cidr_block" {}
variable "region" {}
variable "bastion_user" {}
variable "bastion_host" {}
variable "ami_user" {}
variable "public_key" { description = "Public Key for the instance you want to Create"}
variable "profile" {description = "Variable holding your AWS profile."}