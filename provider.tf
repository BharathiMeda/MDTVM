 provider "vsphere" {
  user           = "medasb2!"
  password       = "Challakere@577522"
  vsphere_server = "vcf-achi1-w1-vc.corp.medtronic.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
