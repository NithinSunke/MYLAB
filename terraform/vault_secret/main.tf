terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  region              = var.region
  config_file_profile = var.profile
}

# Secret Resource
resource "oci_vault_secret" "my_secret" {
  compartment_id = var.compartment_id

  secret_content {
    content_type = "BASE64"
    content      = base64encode("secret#password")  # your secret content
  }

  secret_name          = "my-db-password"
  vault_id             = var.vault_id
  key_id               = var.key_id
  description          = "Password for DB connection"
}