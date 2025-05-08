 provider "vsphere" {
  user           = "vmadmin@dc.com"
  password       = "Password@123"
  vsphere_server = "vcsa01.dc.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}