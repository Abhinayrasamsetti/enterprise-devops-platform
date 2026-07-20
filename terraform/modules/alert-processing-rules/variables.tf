variable "name" {}
variable "resource_group_name" {}
variable "scopes" { type = list(string) }
variable "action_group_ids" { type = list(string) }
