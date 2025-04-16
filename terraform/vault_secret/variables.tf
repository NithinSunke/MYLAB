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
variable "vault_id" {
  description = "The OCID of the vault where the secret will be stored"
  type        = string
  default     = "ocid1.vault.oc1.us-sanjose-1.grt75fsmaabgw.abzwuljrmpyulhqkmg6c2ibyvsfsae2cqrkxskm6dwopwd5fqt6vroab34pa" 
}
variable "key_id" {
  description = "The OCID of the KMS key to use for encryption"
  type        = string
  default     = "ocid1.key.oc1.us-sanjose-1.grt75fsmaabgw.abzwuljrs5asb5ymzrzewff34r33k42xvc2qmdykh775hgv5c547uxhxzd5a"
}
