variable "name" {}
variable "display_name" {}
variable "policy_definitions" {
  type = list(object({
    policy_definition_id = string
    reference_id = string
  }))
  default = []
}
