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