# example-terraform-bastion

Example using Terraform to create two AWS instances - one with only private
network access and one as a bastion to provide access to the private instance.

The majority of the Terraform configuration is boilerplate to create the VPC,
subnets, etc. The provisioner configuration showing bastion and non-bastion
access is in [provisioners.tf](terraform/provisioners.tf).
