output "aws_instance" {
  value = aws_instance.cloud_ec2.id
}
output "ami" {
  value = var.ami.id
}

output "public_subnet" {
  value=var.public_subnet.id
  
}