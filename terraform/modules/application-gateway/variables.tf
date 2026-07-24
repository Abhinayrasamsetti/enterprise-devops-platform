variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku_name" { default = "Standard_v2" }
variable "sku_tier" { default = "Standard_v2" }
variable "frontend_port" { default = 80 }
variable "backend_pool_name" { default = "backend-pool" }
