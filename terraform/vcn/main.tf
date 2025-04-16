terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  region              = var.region
  config_file_profile = var.config_file_profile
}

# VCN
resource "oci_core_vcn" "sanj_vcn" {
  cidr_block     = var.cidr_block
  display_name   = var.display_name
  compartment_id = var.compartment_id
  dns_label      = var.dns_label
}

# Internet Gateway
resource "oci_core_internet_gateway" "sanj_igw" {
  display_name   = var.igw_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id
  enabled        = true
}

# NAT Gateway
resource "oci_core_nat_gateway" "sanj_nat_gw" {
  display_name   = var.nat_gw_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id
}

# Public Route Table
resource "oci_core_route_table" "sanj_public_rt" {
  display_name   = var.public_rt_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.sanj_igw.id
  }
}

# Private Route Table
resource "oci_core_route_table" "sanj_private_rt" {
  display_name   = var.private_rt_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.sanj_nat_gw.id
  }
   # Route rule for Service Gateway
  route_rules {
    destination       = "all-sjc-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.sanj_service_gw.id
  }
}

# Public Subnet
resource "oci_core_subnet" "sanj_public_subnet" {
  cidr_block                 = var.public_cidr_block
  display_name               = var.public_subnet_name
  vcn_id                     = oci_core_vcn.sanj_vcn.id
  compartment_id             = var.compartment_id
  route_table_id             = oci_core_route_table.sanj_public_rt.id
  security_list_ids          = [oci_core_security_list.sanj_public_sl.id]
  prohibit_public_ip_on_vnic = false
  dns_label                  = var.public_subnet_dns_label
}

# Private Subnet
resource "oci_core_subnet" "sanj_private_subnet" {
  cidr_block                 = var.private_cidr_block
  display_name               = var.private_subnet_name
  vcn_id                     = oci_core_vcn.sanj_vcn.id
  compartment_id             = var.compartment_id
  route_table_id             = oci_core_route_table.sanj_private_rt.id
  security_list_ids          = [oci_core_security_list.sanj_private_sl.id]
  dns_label                  = var.private_subnet_dns_label
  prohibit_public_ip_on_vnic = true
}

# Security Lists
# Public Security List
resource "oci_core_security_list" "sanj_public_sl" {
  display_name   = var.public_sl_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id

  ingress_security_rules {
    protocol    = "all"
    source      = var.my_ip
    source_type = "CIDR_BLOCK"
  }
      egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
}

# Private Security List
resource "oci_core_security_list" "sanj_private_sl" {
  display_name   = var.private_sl_name
  vcn_id         = oci_core_vcn.sanj_vcn.id
  compartment_id = var.compartment_id

  ingress_security_rules {
    protocol    = "all"
    source      = var.cidr_block
    source_type = "CIDR_BLOCK"
  }

    egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
}


resource "oci_core_service_gateway" "sanj_service_gw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.sanj_vcn.id
  display_name   = var.service_gw_name

  services {
    # Dynamically fetch the service ID for Oracle Services Network
    service_id = data.oci_core_services.services.services[0].id
  }
}

data "oci_core_services" "services" {
  # Fetch all available services in the region
}