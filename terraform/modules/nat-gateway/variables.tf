variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_ids" { type=list(string) default=[] }
variable "public_ip_ids" { type=list(string) default=[] }
