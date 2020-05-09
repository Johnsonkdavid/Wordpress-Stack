# Project Overview

## Wordpress-Networking
 - Create a VPC 
 - Two Public Subnet with 64 IPS
 - Two Private Subnet 64 Ips
 - Private Subnet have S3 VPC endpoint
 - Allow only Ports 80,443,22 between private Subnet

##Image Build
 - Create a VM in Public Subnet 
 - Install WordPress inside the machine using Ansible/Shell script
 - Convert the Machine to AMI

## Deployment
 - Use the AMI and Create an Autoscaling group in Private subnet
 - Create Load balancer in Public Subnet
 - Expose the Load balancer endpoint
