variable "name" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "remote_virtual_network_id" {}
variable "allow_virtual_network_access" { default = true }
variable "allow_forwarded_traffic" { default = false }
variable "allow_gateway_transit" { default = false }
variable "use_remote_gateways" { default = false }
