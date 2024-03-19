variable "ami" {
    description= "its the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "its the instance_type of ec2 instance"
    type= string 
}

variable "public_subnet" {
    description= "its the public subnet id"
    type=string
}