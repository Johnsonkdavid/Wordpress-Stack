# Project Overview

## Wordpress-Networking
 - Create a VPC 
 - Two Public Subnet with 64 IPS
 - Two Private Subnet 64 Ips
 - Private Subnet have S3 VPC endpoint
 - Allow only Ports 80,443,22 between private Subnet

## Image Build
 - Create a VM in Public Subnet 
 - Install WordPress inside the machine using Ansible/Shell script
 - Convert the Machine to AMI

## Deployment
 - Use the AMI and Create an Autoscaling group in Private subnet
 - Create Load balancer in Public Subnet
 - Expose the Load balancer endpoint
 
 *These three phases are divided into three different ansible roles in this project. They are*
 - *wordpress-networking*
 - *image-build*
 - *deployment*
 
**ANSIBLE ROLE**

Roles provide a framework for fully independent, or interdependent collections of variables, tasks, files, templates, and modules. In Ansible, the role is the primary mechanism for breaking a playbook into multiple files. This simplifies writing complex playbooks, and it makes them easier to reuse.

**ANSIBLE GALAXY**

Ansible has a nice tool named ansible-galaxy which is used to perform various role related operations. One of these operations named ansible-galaxy init is to setup the predefined Ansible role directory structure for your Ansible projects.
Inside the roles directory you will execute the ansible-galaxy command with the init argument and the Ansible role name you wish to develop.

**Ansible Vault for AWS Credentials**

Ansible Vault is a feature of ansible that allows you to keep sensitive data such as passwords or keys in encrypted files, rather than as plaintext in playbooks or roles. These vault files can then be distributed or placed in source control.

Steps for creating Ansible-Vault file:

- Create a vault credentials file named <filename.yml> using the command 'ansible-vault create <filename.yml>'
- Enter a password for the vaultfile we created.
- Don't forgot to note down the password, we need the password to run our playbook file.

- Insert AWS Credentials into the file.The file be like;
```bash
---
VAULT_AWS_ACCESS_KEY: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
VAULT_AWS_SECRET_KEY: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
