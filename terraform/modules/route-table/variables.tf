variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "routes" {
  type = list(object({
    name = string
    address_prefix = string
    next_hop_type = string
  }))
  default = []
}
