output "instance_id" {
  value = "The instance id is ${aws_instance.ec2.id}"

}

output "public_ip" {
  value = "The public IP is ${aws_instance.ec2.public_ip}"

}

output "private_ip" {
  value = "The private IP is ${aws_instance.ec2.private_ip}"

}
