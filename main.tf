module "app" {
  source = "./modules/app"
  VM_count = var.app_vm_count
  airportL_code = var.airportL_code
  server_function = "APP" 
  template_id = var.linux_template
  guest_id  = data.vsphere_virtual_machine.linux_template.guest_id
  #resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id   = data.vsphere_network.network.id
  adapter_type = data.vsphere_virtual_machine.linux_template.network_interface_types[0]
  disk_size = data.vsphere_virtual_machine.linux_template.disks.0.size
  ipv4_start = 100
}

module "web" {
  source = "./modules/web"
  VM_count = var.web_vm_count
  airport_code = var.airport_code
  forest_designator = var.forest_designator
  domain_designator = var.domain_designator
  environment = var.environment
  server_function = "WEB"
  cluster_node = ""
  template_id = var.windows_template
  guest_id  = data.vsphere_virtual_machine.windows_template.guest_id
  #resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id   = data.vsphere_network.network.id
  adapter_type = data.vsphere_virtual_machine.windows_template.network_interface_types[0]
  disk_size = data.vsphere_virtual_machine.windows_template.disks.0.size
  ipv4_start = 120
}

module "db" {
  source = "./modules/db"
  VM_count = var.db_vm_count
  airport_code = var.airport_code
  forest_designator = var.forest_designator
  domain_designator = var.domain_designator
  environment = var.environment
  server_function = "DB"
  cluster_node = ""
  template_id = var.windows_template
  guest_id  = data.vsphere_virtual_machine.windows_template.guest_id
  #resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id   = data.vsphere_network.network.id
  adapter_type = data.vsphere_virtual_machine.windows_template.network_interface_types[0]
  disk_size = data.vsphere_virtual_machine.windows_template.disks.0.size
  ipv4_start = 140
}

module "in" {
  source = "./modules/in"
  VM_count = var.db_vm_count
  airportL_code = var.airportL_code
  server_function = "IN"  
  template_id = var.linux_template
  guest_id  = data.vsphere_virtual_machine.linux_template.guest_id
  #resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id   = data.vsphere_network.network.id
  adapter_type = data.vsphere_virtual_machine.linux_template.network_interface_types[0]
  disk_size = data.vsphere_virtual_machine.linux_template.disks.0.size
  ipv4_start = 160
}
