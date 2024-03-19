#ec2_instance

resource "aws_instance" "cloud_ec2"{
    ami= var.ami
    instance_type= var.instance_type
    subnet_id = aws_subnet.cloud_public_subnet.id
    tags = {
    Name = "cloud_ec2"
}
}