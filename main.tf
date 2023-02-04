# AWS EC2 Instance  Terraform Module
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins-master"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  user_data = file("${path.module}/scripts/jenkins.sh")
  # monitoring             = true
  vpc_security_group_ids = [module.jenkins-sg.this_security_group_id]
  tags = {
    Terraform   = "true"
  }
}