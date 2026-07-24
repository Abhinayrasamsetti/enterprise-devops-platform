variable "name" {}
variable "resource_group_name" {}
variable "zone_type" { default="Public" }
variable "tags" { type=map(string) default={} }
