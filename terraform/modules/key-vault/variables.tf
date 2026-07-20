variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "sku_name" { default = "standard" }
variable "purge_protection_enabled" { default = true }
variable "soft_delete_retention_days" { default = 90 }
variable "enable_rbac_authorization" { default = true }
variable "tags" { default = {} }
