output "aws_instance" {
  value = aws_instance.cloud_ec2.id
}
output "ami" {
  value = var.ami.id
}