resource "vsphere_virtual_machine" "app"  {
  count            = var.VM_count
  #server_function    = app
  name             = "${lower(var.airport_code)}l${var.server_function}${format("%03d", count.index + 1)}"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  firmware = "efi"
  num_cpus = 2
  memory = 4096
  guest_id  = var.guest_id

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
    template_uuid = var.template_id

    customize {
      linux_options {
        host_name  = "${lower(var.airport_code)}l${var.server_function}${format("%03d", count.index + 1)}"
        domain      = "corp.medtronic.com"        
      }


      network_interface {
        ipv4_address = "192.168.1.${var.ipv4_start + count.index}" 
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.1.254"
    }
  }
}
