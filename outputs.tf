output "instance_ami" {
  value = aws_instance.rhel.ami
}

output "instance_arn" {
  value = aws_instance.rhel.arn
}

output "instance_ip" {
  value = aws_instance.rhel.public_ip
}
