#variable for region
variable "region" {
  description = "OCI region to deploy the compute instance"
  type        = string
  default     = "us-sanjose-1"
}

#variable for config_file_profile
variable "config_file_profile" {
  description = "OCI config file profile to use for authentication"
  type        = string
  default     = "sanjose"
}

#variable for availability_domain
variable "availability_domain" {
  description = "Availability domain for the compute instance"
  type        = string
  default     = "kWcK:US-SANJOSE-1-AD-1"
}

#variable for compartment_id
variable "compartment_id" {
  description = "Compartment ID where the compute instance will be created"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa7gchw5gn5d3i3wig74mkp5qtfhae2qrgqpkrhksx45vuwihjfssa"
}

#variable for shape
variable "shape" {
  description = "Shape of the compute instance"
  type        = string
  default     = "VM.Standard3.Flex"
}

#variable for cpus
variable "ocpus" {
  description = "Number of OCPUs for the compute instance"
  type        = number
  default     = 2
}

#variable for memory_in_gbs
variable "memory_in_gbs" {
  description = "Memory in GBs for the compute instance"
  type        = number
  default     = 8
}

#variable for instance_name 
variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "sanj_instance"
}

#variable for vnic_hostname_label
variable "vnic_hostname_label" {
  description = "Hostname label for the VNIC"
  type        = string
  default     = "sanjvnic"
}

#variable for vnic_display_name
variable "vnic_display_name" {
  description = "Display name for the VNIC"
  type        = string
  default     = "sanj_instance_vnic"
}


#variable for ssh_public_key_path
variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "C:\\Users\\Nithin Sunke\\.ssh\\ssh-key-2024-08-27.key.pub"
}

#variable for subnet_id
variable "subnet_id" {
  description = "Subnet ID for the compute instance"
  type        = string
  default     = "ocid1.subnet.oc1.us-sanjose-1.aaaaaaaadbntwmiqxjhgdktr2xyd7pq37i3vxmq3hbwifhery6iqaooecmbq"
}

