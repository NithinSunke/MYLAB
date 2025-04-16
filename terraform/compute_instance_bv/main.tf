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

data "oci_core_images" "latest_ol8_image" {
  compartment_id           = var.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = "VM.Standard3.Flex"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}
output "latest_ol8_image_ocid" {
  value = data.oci_core_images.latest_ol8_image.images[0].id
}

resource "oci_core_instance" "sanj_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = var.instance_name
  shape               = var.shape
  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }
  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true
    display_name     = var.vnic_display_name
    hostname_label   = var.vnic_hostname_label
  }
  source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.latest_ol8_image.images[0].id
    boot_volume_size_in_gbs = 50
  }
  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false

    plugins_config {
      name          = "Bastion"
      desired_state = "ENABLED"
    }
  }
  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data = base64encode(<<EOF
    #cloud-config
    runcmd:
    - systemctl enable ocid
    - systemctl start ocid
EOF
    )
  }
}

## Create block volume
resource "oci_core_volume" "block_volume" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = var.block_volume_name
  size_in_gbs         = var.block_size
  is_auto_tune_enabled = "false"
  vpus_per_gb         = 10
}

# Attach block volume to compute instance
resource "oci_core_volume_attachment" "volume_attachment" {
  attachment_type                    = "iscsi"
  instance_id                        = oci_core_instance.phoenix_instance.id
  volume_id                          = oci_core_volume.block_volume.id
  is_agent_auto_iscsi_login_enabled  = true
  display_name                       = var.attachment_display_name
}

output "block_volume_id" {
  value = oci_core_volume.block_volume.id
}

output "volume_attachment_id" {
  value = oci_core_volume_attachment.volume_attachment.id
}