#variables for region
variable "region" {
  description = "The OCI phinex region to deploy the resources in"
  type        = string
  default     = "me-jeddah-1"
}
#variables for profile
variable "profile" {
  description = "The OCI profile to use for authentication"
  type        = string
  default     = "jeddah"
}
#variables for compartment
variable "compartment_id" {
  description = "The OCID of the compartment to deploy the resources in"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa7gchw5gn5d3i3wig74mkp5qtfhae2qrgqpkrhksx45vuwihjfssa"
}
#variables for availability domain
variable "availability_domain" {
  description = "ad1 for the resources"
  type        = string
  default     = "kWcK:ME-JEDDAH-1-AD-1"
}
#variables for subnet_id
variable "subnet_id" {
  description = "The OCID of the subnet to deploy the resources in"
  type        = string
  default     = "ocid1.subnet.oc1.me-jeddah-1.aaaaaaaar7voipnr2ygh6v3limr4n7lcudpv7zfynpmb5k64e4ihx4cuxtra"
}
#variables for ssh_public_key
variable "ssh_public_key_path" {
  description = "The path to the SSH public key file"
  type        = string
  default     = "C:\\Users\\Nithin Sunke\\.ssh\\ssh-key-2024-08-27.key.pub"
}
#variable for db_system_display_name
variable "db_system_display_name" {
  description = "The name of the DB system"
  type        = string
  default     = "FSFO_PRM"
}
#variable for shape
variable "shape" {
  description = "The shape of the DB system"
  type        = string
  default     = "VM.Standard3.Flex"
}
#variable for cpu_core_count
variable "cpu_core_count" {
  description = "Number of CPU cores for the DB System"
  type        = number
  default     = 2
}
#variable for hostname
variable "hostname" {
  description = "The hostname of the DB system"
  type        = string
  default     = "fsfoprm"
}
#variable for database_edition
variable "database_edition" {
  description = "Database edition (ENTERPRISE_EDITION, ENTERPRISE_EDITION_EXTREME_PERFORMANCE)"
  type        = string
  default     = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}
#variable for node_count
variable "node_count" {
  description = "Number of nodes in the DB system"
  type        = number
  default     = 1
}
#variable for database_version
variable "database_version" {
  description = "Database version (e.g., 19c, 21c)"
  type        = string
  default     = "19.26.0.0"
}
#variable for data_storage_size_in_gbs
variable "data_storage_size_in_gbs" {
  description = "Data storage size in GBs"
  type        = number
  default     = 256
}
#variable for db_home_display_name
variable "db_home_display_name" {
  description = "The display name for the database home"
  type        = string
  default     = "dbhome20250305161955" # Replace with your desired default value
}

#variable for db_name
variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "FSFO"
}
#variable for admin_password
variable "admin_password" {
  description = "The password for the database admin user"
  type        = string
  default     = "Nevi#Nihaan#0712" # Replace with your desired default value
}
#variable for character_set
variable "character_set" {
  description = "The character set for the database"
  type        = string
  default     = "AL32UTF8" # Replace with your desired default value
}
#variable for ncharacter_set
variable "ncharacter_set" {
  description = "The national character set for the database"
  type        = string
  default     = "AL16UTF16" # Replace with your desired default value
}
#variable for pdb_name
variable "pdb_name" {
  description = "The name of the pluggable database (PDB)"
  type        = string
  default     = "FSFO_pdb1" # Replace with your desired default value
}
