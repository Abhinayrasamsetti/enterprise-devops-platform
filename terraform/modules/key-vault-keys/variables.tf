variable "key_vault_id" {}
variable "keys" {
  type = map(object({
    key_type = string
    key_size = number
    key_opts = list(string)
  }))
}
