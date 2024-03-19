# Choosing randam numbers for naming 
resource "random_id" "id" {
  byte_length = 1
}

# Creating VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_varaiable

  tags = {
    Name = "VPC-${random_id.id.hex}"
  }
}


# Creating Public Subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet-${random_id.id.hex}"
  }
}


# Creating Private Subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "Private_Subnet-${random_id.id.hex}"
  }
}


# Creating Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Gateway-${random_id.id.hex}"
  }
}


# Creating Public Route Table For Our Public Subnet (Needed For EC2 Instance)
resource "aws_route_table" "public_route_table" { 
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route Table-${random_id.id.hex}"
  }
}



# Creating accress control list 
resource "aws_network_acl" "my-acl" {
  vpc_id = aws_vpc.main_vpc.id

  # Outgoing traffic rule
  egress {
    protocol   = var.eg_protocol
    rule_no    = var.eg_role_no
    action     = var.eg_action
    cidr_block = var.eg_cidr
    from_port  = var.eg_from_port
    to_port    = var.eg_to_port
  }

  # Incoming traffic rule
  ingress {
    protocol   = var.in_protocol
    rule_no    = var.in_role_no
    action     = var.in_action
    cidr_block = var.in_cidr
    from_port  = var.in_from_port
    to_port    = var.in_to_port
  }

  tags = {
    Name = "ACL-${random_id.id.hex}"
  }
}


# Creating Network ACL association with public subnet
resource "aws_network_acl_association" "acl_associate" {
  network_acl_id = aws_network_acl.my-acl.id
  subnet_id = aws_subnet.public.id

  depends_on = [aws_network_acl.my-acl]

}

# Associate public subnet with public route table
resource "aws_route_table_association" "public_table_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_route_table.id
}



# Creating Route Table for Private Subnet (Needed For Endpoints)
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Private Route Table-${random_id.id.hex}"
  }
}

# Associate private subnet with private route table
resource "aws_route_table_association" "private_table_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_route_table.id
}