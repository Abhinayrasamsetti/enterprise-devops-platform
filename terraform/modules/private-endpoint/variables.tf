variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "private_resource_id" {}
variable "subresource_names" { type = list(string) }
variable "tags" { default = {} }
