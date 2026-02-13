resource oci_core_instance export_test {
  availability_domain = var.availability_domain--kWcK-ME-JEDDAH-1-AD-1
  compartment_id = var.compartment_ocid
  create_vnic_details {
    assign_public_ip = true
    display_name = "terraform-test"
    hostname_label = "terraform-test"
    subnet_id = "ocid1.subnet.oc1.me-jeddah-1.aaaaaaaar6rhsgvlmc2xkkmfb7on7hv7vvbi6jcdydrh5t4yb3xgylc7dq5a"
  }
  display_name = "terraform-test"
  extended_metadata = {
  }
  fault_domain = var.fault_domain2
  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    is_pv_encryption_in_transit_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }
  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvtOpdSoFSR9ca/R4Xv2pXjBLLKrqHrsJGkoVUGtSYmtBJ4ypWI+86bP+DDyCTFbuKYKH2TbtHPjemCAE+aKqBj/BNLcM5k+Uif69Np/yZjRt4T1Rv5M1yFUVid2tkGIB1IWaE0P1ZAB8h9Dhx44ouKxXd37YvZ8u9Al9oWkJCD6S9pMPgOT5B1Ckl9GTjkeMl/pkkEHKGo3i4Py57C1gh3cL06f6WRWjX6GH7XjYL9KvSYpsQUmAfWleKOJhRj0EPzOyICCOvy7nGJhEbFwvKvzxsGYYbxjJ2tRhXLAP9mw6LwxmB/GJL/LaPYYDur86x6pLv5Eez7X9PD9j6NNlL ssh-key-2024-08-27\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLnYUQoMw+boAZjYVArhlrzU6kdoO0Bzz9S7XAo+ryz4GEtJdE8DdPm/NUCk562MOvOtVOfjKsocoifkM96vJHL9olCIyqNvkywrHKIDR42KgNvc2MDFly3K6JA2uVD1byKXuD4QDe9c1sPa+priNDSHvmttWqsJcy09tSCVY1bU+6G0Wl2BVgCvCAjDMLJICkEtbTrpV1Sj52S+GHCJVRVOeM/eZoEL0RGu3WLNAerhNtPIpDv8cy92/LMza2IhBem2SHW1W86cKUMqv+0gtMLU+aRlt60yXUOsfCPzXickcVd7gJ6btgHmEomfkSVXdBVKSXZwS4oAzCZp+2pazp rsa-key-20251115"
  }
  platform_config {
    type = "INTEL_VM"
  }
  shape = "VM.Standard3.Flex"
  shape_config {
    memory_in_gbs             = 8
    ocpus                     = 2
    vcpus                     = 4
  }
  source_details {
    boot_volume_vpus_per_gb = 10
    source_id   = var.oci_core_instance--source_details-source_id--export_nosqljump
    source_type = "image"
  }
}
