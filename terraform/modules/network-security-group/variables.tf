variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "security_rules" { type = list(any) default = [] }
variable "tags" { default = {} }
