# This file contain all variables used in network module

variable "vpc_varaiable" {
  description = "VPC CIDR Block"
  type = string
}

variable "public_subnet" {
  description = "Public Subnet"
  type = string
}

variable "private_subnet" {
  description = "Private Subnet"
  type = string
}


variable "eg_protocol" {
  description = "Egress protocol name"
  type = string
}

variable "eg_role_no" {
  description = "Egress role number"
  type = number
}

variable "eg_action" {
  description = "Egress action"
  type = string
}

variable "eg_cidr" {
  description = "Egress cidr blocks"
  type = string
}

variable "eg_from_port" {
  description = "Egress from port"
  type = number
}

variable "eg_to_port" {
  description = "Egress to port"
  type = number
}



variable "in_protocol" {
  description = "Egress protocol name"
  type = string
}

variable "in_role_no" {
  description = "Egress role number"
  type = number
}

variable "in_action" {
  description = "Egress action"
  type = string
}

variable "in_cidr" {
  description = "Egress cidr blocks"
  type = string
}

variable "in_from_port" {
  description = "Egress from port"
  type = number
}

variable "in_to_port" {
  description = "Egress to port"
  type = number
}