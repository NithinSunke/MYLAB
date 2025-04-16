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
  default     = "ocid1.compartment.oc1..jfssa"
}

variable "vault_name" {
  description = "The name of the vault"
  type        = string
  default     = "sanj-vault"
}

variable "key_name" {
  description = "The name of the key"
  type        = string
  default     = "sanj-key"
}
#}