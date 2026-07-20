variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "azure_firewall_subnet_id" {}
variable "public_ip_id" {}
variable "sku_name" { default = "AZFW_VNet" }
variable "sku_tier" { default = "Standard" }
variable "tags" { default = {} }
