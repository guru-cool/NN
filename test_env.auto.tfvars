#my-test.auto.tfvars

#AMI Linux Image as on 5/4/20 on eu-west-1 aws
ami_id = "ami-04d5cc9b88f9d1d39"
instance_type = "t2.micro"
subnet_id = "subnet-xxxxx"
#change to valid tag later
tags = {Name="vm-destroy-if-found"}
vpc_id = "vpc-xxxxxx"
subnet_cidr_block = ["10.207.0.0/20","10.207.96.0/20","10.155.69.0/21","10.155.144.0/23"]
region = "eu-west-1"
bastion_user                = "ec2-user"
bastion_host                = "bastion.mydomain"
ami_user                    = "ec2-user"
public_key = "xxxxxx"