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

resource "oci_kms_vault" "my_vault" {
  compartment_id = var.compartment_id
  display_name   = var.vault_name
  vault_type     = "DEFAULT"

  freeform_tags = {
    "CreatedBy" = "Terraform"
  }
}

# Key Resource
resource "oci_kms_key" "my_key" {
  compartment_id     = var.compartment_id
  display_name       = var.key_name
  management_endpoint = oci_kms_vault.my_vault.management_endpoint
  key_shape {
    algorithm = "AES"
    length    = 32   # 32 = 256 bits for AES
  }
  protection_mode = "SOFTWARE"   # or "HSM" if vault is virtual_private

  # Optional: Add tags if needed
  freeform_tags = {
    "CreatedBy" = "Terraform"
  }
}