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

resource "oci_database_db_system" "dbcs_db" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  cpu_core_count      = "2"
  data_collection_options {
    is_diagnostics_events_enabled = "true"
    is_health_monitoring_enabled  = "false"
    is_incident_logs_enabled      = "true"
  }
  data_storage_percentage = "80"
  data_storage_size_in_gb = "256"
  database_edition        = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
  db_home {
    #create_async = <<Optional value not found in discovery>>
    database {
      admin_password = "Nevi#Nihaan#0712" #Required attribute not found in discovery, placeholder value set to avoid plan failure
      character_set  = var.character_set
      db_backup_config {
        auto_backup_enabled = "true"
        #auto_backup_window = <<Optional value not found in discovery>>
        auto_full_backup_day = "SUNDAY"
        #auto_full_backup_window = <<Optional value not found in discovery>>
        backup_deletion_policy = "DELETE_AFTER_RETENTION_PERIOD"
        backup_destination_details {
          #dbrs_policy_id = <<Optional value not found in discovery>>
          #id = <<Optional value not found in discovery>>
          type = "OBJECT_STORE"
        }
        recovery_window_in_days   = "30"
        run_immediate_full_backup = "true"
      }
      #db_domain = <<Optional value not found in discovery>>
      db_name     = var.db_name
      db_workload = "OLTP"
      defined_tags = {
        "Lift-Auto-Tags.AnyDay" = "*,*,*,*,*,*,*,*,*,*,*,*,*,*,*,*,0,*,*,*,*,*,0,*#9AM to 9PM IST"
        "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/nithin.sunke@oracle.com"
        "Oracle-Tags.CreatedOn" = "2025-03-05T16:19:53.877Z"
      }
      freeform_tags = {
      }
      ncharacter_set = var.ncharacter_set
    }
    db_version = var.database_version
    #defined_tags = <<Optional value not found in discovery>>
    display_name = var.db_home_display_name
    freeform_tags = {
    }
    #is_unified_auditing_enabled = <<Optional value not found in discovery>>
  }
  db_system_options {
    storage_management = "ASM"
  }
  defined_tags = {
    "Lift-Auto-Tags.AnyDay" = "*,*,*,*,*,*,*,*,*,*,*,*,*,*,*,*,0,*,*,*,*,*,0,*#9AM to 9PM IST"
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/nithin.sunke@oracle.com"
    "Oracle-Tags.CreatedOn" = "2025-03-05T16:19:54.856Z"
  }
  disk_redundancy = "HIGH"
  display_name    = var.db_system_display_name
  freeform_tags = {
  }
  hostname = var.hostname
  #kms_key_id = <<Optional value not found in discovery>>
  #kms_key_version_id = <<Optional value not found in discovery>>
  license_model = "LICENSE_INCLUDED"
  #maintenance_window_details = <<Optional value not found in discovery>>
  node_count = "1"
  #nsg_ids = <<Optional value not found in discovery>>
  #private_ip = <<Optional value not found in discovery>>
  #private_ip_v6 = <<Optional value not found in discovery>>
  reco_storage_size_in_gb = "256"
  security_attributes = {
  }
  shape  = "VM.Standard3.Flex"
  source = "NONE"
  #source_db_system_id = <<Optional value not found in discovery>>
  #sparse_diskgroup = <<Optional value not found in discovery>>
  ssh_public_keys = [file(var.ssh_public_key_path)]

  storage_volume_performance_mode = "HIGH_PERFORMANCE"
  subnet_id                       = var.subnet_id
  time_zone                       = "UTC"

  # Required attributes that were not found in discovery have been added to lifecycle ignore_changes
  # This is done to avoid terraform plan failure for the existing infrastructure
  lifecycle {
    ignore_changes = [db_home, db_home[0].database[0].admin_password]
  }
}
output "private_ip" {
  value = oci_database_db_system.dbcs_db.private_ip
}