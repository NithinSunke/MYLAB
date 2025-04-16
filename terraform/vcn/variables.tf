# This file contains the variables used in the VCN module.
variable "config_file_profile" {
  description = "profile name"
  type        = string
  default     = "sanjose"
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "us-sanjose-1"
}

variable "compartment_id" {
  description = "Compartment OCID"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa3bsnwqvif5r4gxzd6o5kd46jiwfdxly4v7pswkmvxkqoa34u4esa"
}

variable "my_ip" {
  description = "Your public IP address"
  type        = string
  default     = "139.5.248.180/32"
}

variable "vcn_name" {
  description = "Name of the VCN"
  type        = string
  default     = "sanj_vcn"
}
variable "cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "13.0.0.0/16"
}

variable "public_cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "13.0.1.0/24"
}

variable "private_cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "13.0.2.0/24"
}


variable "dns_label" {
  description = "DNS label for the VCN"
  type        = string
  default     = "sanjvcn"
}
variable "display_name" {
  description = "Display name for the VCN"
  type        = string
  default     = "sanjvcn"
}

#variable for internet gateway
variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "sanj_igw"
} 

#variable for NAT gateway
variable "nat_gw_name" {
  description = "Name of the NAT Gateway"
  type        = string
  default     = "sanj_nat_gw"
}
#variable for public route table
variable "public_rt_name" {
  description = "Name of the Public Route Table"
  type        = string
  default     = "sanj_public_rt"
}
#variable for private route table
variable "private_rt_name" {
  description = "Name of the Private Route Table"
  type        = string
  default     = "sanj_private_rt"
}
#variable for service gateway destination
variable "service_gw_dest" {
  description = "Name of the Service Gateway"
  type        = string
  default     = "all-sjc-services-in-oracle-services-network"
}

#variable public subnet display name
variable "public_subnet_name" {
  description = "Name of the Public Subnet"
  type        = string
  default     = "sanj_public_subnet"
}
#variable private subnet display name
variable "private_subnet_name" {
  description = "Name of the Private Subnet"
  type        = string
  default     = "sanj_private_subnet"
}
#variable for public subnet dns label
variable "public_subnet_dns_label" {
  description = "DNS label for the Public Subnet"
  type        = string
  default     = "sanjpubsubnet"
}
#variable for private subnet dns label
variable "private_subnet_dns_label" {
  description = "DNS label for the Private Subnet"
  type        = string
  default     = "sanjprivsubnet"
}

#variable for public security list name
variable "public_sl_name" {
  description = "Name of the Public Security List"
  type        = string
  default     = "sanj_public_sl"
}
#variable for private security list name
variable "private_sl_name" {
  description = "Name of the Private Security List"
  type        = string
  default     = "sanj_private_sl"
}
#variable service gateway name
variable "service_gw_name" {
  description = "Name of the Service Gateway"
  type        = string
  default     = "sanj_service_gw"
}