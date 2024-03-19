# This output to refer public subnet id at the end (Used in main file to refer to public subnet)
output "public" {
  value = aws_subnet.public.id
}

# This output to refer private subnet id at the end (Used in main file to refer to private subnet)
output "private" {
  value = aws_subnet.private.id
}

# This output to refer VPC id at the end (Used in main file to refer to VPC)
output "vpc" {
  value = aws_vpc.main_vpc.id
}

# This output to refer ACL at the end 
output "acl" {
  value = aws_network_acl.my-acl.id
}

# This output to refer private route table for private subnet id at the end (Used in main file to refer to private route table)
output "private_route_table" {
  value = aws_route_table.private_route_table.id
}