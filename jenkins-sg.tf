# AWS EC2 Security Group Terraform Module
# Security Group for Jenkins EC2 Instance
module "jenkins-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name = "jenkins-sg"
  vpc_id = null
  description = "Security Group with HTTP & SSH port open for entire VPC Block (IPv4 CIDR), egress ports are all world open"
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
}
