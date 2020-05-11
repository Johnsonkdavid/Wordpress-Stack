Role Name
=========

Wordpress-networking is an ansible role which will create the VPC side for the infrastucutre. This includes VPC creation, private and public subnet creations, Route tables along with NAT and Internet Gateway.

Role Structure
------------

```bash
wordpress-networking/
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   ├── igw.yml
│   ├── main.yml
│   ├── nacls.yml
│   ├── nat_gw.yml
│   ├── private_route_table.yml
│   ├── private_subnet_1.yml
│   ├── private_subnet_2.yml
│   ├── public_route_table.yml
│   ├── public_subnet_1.yml
│   ├── public_subnet_2.yml
│   ├── s3_endpoint.yml
│   └── vpc.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    ├── credentials.yml
    └── main.yml
```    
The above mentioned tasks are included together in main.yml file under wordpress-networking/tasks directory.
```bash
---
# tasks file for wordpress-networking
- include_vars:
    file: credentials.yml
- include_tasks: vpc.yml
- include_tasks: public_subnet_1.yml
- include_tasks: public_subnet_2.yml
- include_tasks: private_subnet_1.yml
- include_tasks: private_subnet_2.yml
- include_tasks: igw.yml
- include_tasks: nat_gw.yml
- include_tasks: public_route_table.yml
- include_tasks: private_route_table.yml
- include_tasks: s3_endpoint.yml
- include_tasks: nacls.yml
```

