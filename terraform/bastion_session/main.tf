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

resource "oci_bastion_session" "test_session" {
    #Required
    bastion_id = var.bastion_id
    key_details {
        #Required
        public_key_content = var.ssh_public_key_path
    }
    target_resource_details {
        #Required
        session_type = var.session_type
        target_resource_operating_system_user_name ="opc" #Required for SSH sessions
        target_resource_id = var.target_resource_id

        #Optional
        target_resource_port = var.target_resource_port
        target_resource_private_ip_address = var.target_ip_address
    }

    #Optional
    display_name = var.session_display_name
    key_type = var.session_key_type
    session_ttl_in_seconds = var.session_ttl_in_seconds
}