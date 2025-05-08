 provider "vsphere" {
  user           = "vmadmin@dc.com"
  password       = "Password@123"
  vsphere_server = "vcsa01.dc.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
  
 /*locals {
  hostname = "${var.closest_airport}${var.vendor_platform}${var.forest_designator}${var.domain_designator}${var.server_function}${var.environment}${var.unique_number}${var.cluster_node}"
}   


resource "random_string" "hostname_suffix" {
  count    = 10
  length  = 16 - length(local.hostname)
  special = false
  upper   = true
  numeric  = true
  lower  = false 
}*/

resource "vsphere_virtual_machine" "windows_vm"  {
  count            = var.windows_vm_count
  name             = "${var.airport_code}M${var.forest_designator}${var.domain_designator}${var.server_function_windows}${var.environment}${format("%04d", count.index + 1)}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  firmware = "efi"
  num_cpus = 2
  memory = 4096
  guest_id  = data.vsphere_virtual_machine.windows_template.guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.windows_template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.windows_template.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.windows_template.id

    customize {
      windows_options {
        computer_name  = "${var.airport_code}M${var.forest_designator}${var.domain_designator}${var.server_function_windows}${var.environment}${format("%04d", count.index + 1)}"
        workgroup      = "stgcfrf.medtronic.com"
        admin_password = "Password@123"
      }

      network_interface {
        ipv4_address = "192.168.1.${100 + count.index}" 
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.1.254"
    }
  }
}

resource "vsphere_virtual_machine" "linux_vms" {
  count            = var.linux_vm_count
  name             = "${var.airport_code}M${var.forest_designator}${var.domain_designator}${var.server_function_linux}${var.environment}${format("%04d", count.index + 1)}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  firmware = "efi"
  num_cpus = 2
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.linux_template.guest_id
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.linux_template.network_interface_types[0]
  }
    disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.linux_template.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
    clone {
    template_uuid = data.vsphere_virtual_machine.linux_template.id

    customize {
      linux_options {
        host_name = "${var.airport_code}M${var.forest_designator}${var.domain_designator}${var.server_function_linux}${var.environment}${format("%04d", count.index + 1)}"
        domain    = "local"
      }

      network_interface {
        ipv4_address = "192.168.1.${200 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.1.254"
    }
  }
}
