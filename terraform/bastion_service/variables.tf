#variable for region
variable "region" {
  description = "OCI region to deploy the compute instance"
  type        = string
  default     = "us-sanjose-1"
}

#variable for config_file_profile
variable "profile" {
  description = "OCI config file profile to use for authentication"
  type        = string
  default     = "sanjose"
}
variable "compartment_id" {
  description = "The OCID of the compartment where the bastion will be created"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa7gchw5gn5d3i3wig74mkp5qtfhae2qrgqpkrhksx45vuwihjfssa"
}
variable "subnet_id" {
  description = "The OCID of the subnet where the bastion will be created"
  type        = string
  default     = "ocid1.subnet.oc1.us-sanjose-1.aaaaaaaaaiogsbfmivufccr4qyin7ms7bp7iff3uebzhef6kzk2n74ujpi7a"
}
variable "bastion_name" {
  description = "The name of the bastion"
  type        = string
  default     = "sanj-bastion"
}