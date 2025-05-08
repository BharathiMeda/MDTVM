variable "app_vm_count" {
  description = "Number of Linux VMs to create"
  default     = 2
}

variable "web_vm_count" {
  description = "Number of Windows VMs to create"
  default     = 2
}
variable "db_vm_count" {
  description = "Number of Windows VMs to create"
  default     = 2
}

variable "linux_template" {
  description = "Template name for Linux VM"
  default     = "Linux_Template"
}

variable "windows_template" {
  description = "Template name for Windows VM"
  default     = "Windows_Template"
}

variable "airport_code" {
  description = "Closest international airport code"
  default     = "MSP"
}

variable "forest_designator" {
  description = "Forest designator (e.g., C for 3rd Medtronic AD Forest)"
  default     = "C"
}

variable "domain_designator" {
  description = "Domain designator (e.g., A for the first domain)"
  default     = "A"
}

/*variable "server_function_linux" {
  description = "Server function for Linux VMs (e.g., APP, WEB, DB)"
  default     = "APP"
}

variable "server_function_windows" {
  description = "Server function for Windows VMs (e.g., APP, WEB, DB)"
  default     = "WEB"
}

variable "environment" {
  description = "Environment code (D for Dev, T for Test, leave blank for Prod)"
  default     = "D"
}*/

variable "cluster_node" {
  description = "Cluster node identifier for Linux VMs (e.g., A, B, C, D)"
  default     = ""
}

