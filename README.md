Terraform Final project

This repository contains the Terraform code to deploy infrastructure on AWS. It includes creating a VPC with public subnet and private subnet, launching EC2 instances in the public subnets, Create s3 bucket 
AWS Architecture

Overview

This project uses Terraform to create the following AWS resources per region: - VPC - Internet Gateway - Public Route Table - Public EC2 instances – s3bucket


Prerequisites

Before running the deployment script, you will need to have the following:
•	AWS account
•	Terraform installed on your local machine
•	AWS CLI installed on your local machine
•	AWS credentials configured on your local machine
•	A S3 bucket to store the Terraform state file.



To get started:
Clone this repository to your local machine.
git clone https://github.com/AhmedALSaeed0/terraform_project
Run terraform init to download the necessary Terraform plugins.
Run terraform apply to create the infrastructure.



Final Result
you can check the look inspect .terraform/terraform.tfstate, you will see that it contains the location of the state file now instead of the actual state file.
