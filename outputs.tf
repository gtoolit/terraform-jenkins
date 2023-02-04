output "jenkins-url" {
    description = "url of jenkins dashboard"
    value = "${module.ec2_instance.public_ip}:8080"
}