variable "key_vault_id" {}

variable "certificates" {
  type = map(object({
    issuer_name = string
    key_type    = string
    key_size    = number
  }))
}
