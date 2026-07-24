variable "environment" {}
variable "application" {}
variable "business_unit" {}
variable "owner" {}
variable "cost_center" {}
variable "additional_tags" {
  type = map(string)
  default = {}
}
