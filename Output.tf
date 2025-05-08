output "windows_vm_names" { description = "Names of all created Windows VMs" value       = [for vm in vsphere_virtual_machine.windows_vm : vm.name] }

#output "windows_vm_ips" { description = "IP addresses of all created Windows VMs" value       = [for i in range(var.windows_vm_count) : "192.168.1.${100 + i}"] }

output "linux_vm_names" { description = "Names of all created Linux VMs" value       = [for vm in vsphere_virtual_machine.linux_vms : vm.name] }

#output "linux_vm_ips" { description = "IP addresses of all created Linux VMs" value       = [for i in range(var.linux_vm_count) : "192.168.1.${200 + i}"] }

output "windows_name_to_ip" { description = "Map of Windows VM name to IP" value = { for i, vm in vsphere_virtual_machine.windows_vm : vm.name => "192.168.1.${100 + i}" } }

output "linux_name_to_ip" { description = "Map of Linux VM name to IP" value = { for i, vm in vsphere_virtual_machine.linux_vms : vm.name => "192.168.1.${200 + i}" } }
