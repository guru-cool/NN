# AIM:
Repo contains code to create an ec2-instance and display whether it has a public IP or not.

# Pre-req:
1.AWS account.  
2.Key-pair.  
3.Load ssh agent with the keypair.   
4.Setup .aws for awscli to work.  
5.That VPC is already setup separately.  


# Language:
Terraform 12.17


# How to run:
1. Setup tfvars file. An example is already in place.
2. Setup ssh-agent (eval `ssh-agent -s` && ssh-add $SSHKEYFILELOCATION)
3. You may edit the code and choose not to use bastion if running from within a vpc. In this case rm lines:33,34 from modules/aws_instance/aws_instance.tf
4. tf init
5. tf plan - verify
6. tf apply

# Sample Output:
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.vm.null_resource.check_public_ip: Destroying... [id=3812995183215121446]
module.vm.null_resource.check_public_ip: Destruction complete after 0s
module.vm.null_resource.check_public_ip: Creating...
module.vm.null_resource.check_public_ip: Provisioning with 'remote-exec'...
module.vm.null_resource.check_public_ip (remote-exec): Connecting to remote host via SSH...
module.vm.null_resource.check_public_ip (remote-exec):   Host: 10.222.101.104 (editted to mask original ip range)
module.vm.null_resource.check_public_ip (remote-exec):   User: ec2-user
module.vm.null_resource.check_public_ip (remote-exec):   Password: false
module.vm.null_resource.check_public_ip (remote-exec):   Private key: false
module.vm.null_resource.check_public_ip (remote-exec):   Certificate: false
module.vm.null_resource.check_public_ip (remote-exec):   SSH Agent: true
module.vm.null_resource.check_public_ip (remote-exec):   Checking Host Key: false
module.vm.null_resource.check_public_ip (remote-exec): Using configured bastion host...
module.vm.null_resource.check_public_ip (remote-exec):   Host: bastion.xxxx(editted to not display fqdn)
module.vm.null_resource.check_public_ip (remote-exec):   User: ec2-user
module.vm.null_resource.check_public_ip (remote-exec):   Password: false
module.vm.null_resource.check_public_ip (remote-exec):   Private key: false
module.vm.null_resource.check_public_ip (remote-exec):   Certificate: false
module.vm.null_resource.check_public_ip (remote-exec):   SSH Agent: true
module.vm.null_resource.check_public_ip (remote-exec):   Checking Host Key: false
module.vm.null_resource.check_public_ip (remote-exec): Connected!
module.vm.null_resource.check_public_ip (remote-exec): Private IP of this instance is: 10.222.101.104(editted to mask original ip range)
module.vm.null_resource.check_public_ip (remote-exec): Good Install, no public IP found.
module.vm.null_resource.check_public_ip: Creation complete after 2s [id=8138957688077430169]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

# How to test:
Comment line 23 and uncomment line 25 to make the null resource always run, now test with and without a public IP.

# Enhancements if this was a production Code:
Write Unit tests!  
Find out if you can trigger with aws_instance.vm.* - destroyed instance before I could test. 
Improve Readme. Write about how the repo and code works.
