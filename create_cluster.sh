#!/bin/bash
read -p  'enter AWS profile name : '  profile
read -p  'choose the region : '  region
read -p  'choose instance type : '  instance_type
read -p  'choose the number of worker nodes : '  worker_count
read -p  'enter path to the public key : '  public_key_path
read -p  'enter path to the private key : '  private_ssh_key
read -p  'enter a name for the key pair : '  key_pair_name
read -p  'enter VPC CIDR (example:10.0.0.0/16) : '  cidr_vpc
read -p  'enter subnet CIDR (example:10.0.1.0/24) : '  cidr_subnet
##################################################################
cd terraform-project/

echo "region = \"${region}\" "  > terraform.tfvars 
echo "profile = \"${profile}\" "  >> terraform.tfvars 
echo "worker_count = \"${worker_count}\" "  >> terraform.tfvars 
echo "cidr_vpc = \"${cidr_vpc}\" "  >> terraform.tfvars 
echo "cidr_subnet = \"${cidr_subnet}\" "  >> terraform.tfvars 
echo "instance_type = \"${instance_type}\" "  >> terraform.tfvars 
echo "public_key_path = \"${public_key_path}\" "  >> terraform.tfvars 
echo "private_ssh_key = \"${private_ssh_key}\" "  >> terraform.tfvars 
echo "key_pair_name = \"${key_pair_name}\" "  >> terraform.tfvars 
####################################################################
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /tmp/docker.gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key -o /tmp/kubernetes-apt-key.gpg
                    
terraform init
terraform apply --auto-approve 