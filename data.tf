data "vsphere_datacenter" "dc" {
  name = "PROD-VI-WLD1-DC"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "achi1-w1c2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "PROD-VI-WLD1-achi1-w1c2-vsan01"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
  }

data  "vsphere_host" "host" {
  name = "achi1-w1c2-esxi18.corp.medtronic.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "linux_template" {
  name          = "var.linux_template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "windows_template" {
  name          = var.windows_template
  datacenter_id = data.vsphere_datacenter.dc.id
}
