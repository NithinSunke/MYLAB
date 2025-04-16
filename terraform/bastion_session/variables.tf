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
#variable for bastion_id
variable "bastion_id" {
  description = "The OCID of the bastion"
  type        = string
  default     = "ocid1.bastion.oc1.us-sanjose-1.5v3a"
}

#variables for ssh_public_key
variable "ssh_public_key_path" {
  description = "The path to the SSH public key file"
  type        = string
  default     = "ssh-rsa AAAAB.....6NNlL"
}

#variable for session_type
variable "session_type" {
  description = "The type of session to create (e.g., SSH, RDP)"
  type        = string
  default     = "MANAGED_SSH"
}

#variable for port
variable "target_resource_port" {
  description = "The port of the target resource for the session"
  type        = number
  default     = 22
}
#variable for target_resource_private_ip_address
variable "target_ip_address" {
  description = "value for target_resource_private_ip_address"
  type        = string
  default     = "13.0.1.166"
}
#variable for session_key_type
variable "session_key_type" {
  description = "The type of key to use for the session (e.g., SSH, RDP)"
  type        = string
  default     = "PUB"
}

#variable for session_display_name
variable "session_display_name" {
  description = "The display name for the session"
  type        = string
  default     = "test-session"
}
#variable for session_ttl_in_seconds
variable "session_ttl_in_seconds" {
  description = "The time-to-live for the session in seconds"
  type        = number
  default     = 10800
}

#variable for target_resource_id
variable "target_resource_id" {
  description = "The OCID of the target resource for the session"
  type        = string
  default     = "ocid1.instance.oc1.us-sanjose-1.anz........w566q"
}
