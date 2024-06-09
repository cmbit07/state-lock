#Output variable block
output "ec2_instance_publicip" {
  description = "EC2 instanc public IP"
  value       = aws_instance.ec2_example.public_ip
}

output "ec2_instance_publidns" {
  description = "EC2 instanc public DNS"
  value       = aws_instance.ec2_example.public_dns
}

