resource "azurerm_key_vault_certificate" "this" {
  for_each     = var.certificates
  name         = each.key
  key_vault_id = var.key_vault_id

  certificate_policy {
    issuer_parameters {
      name = each.value.issuer_name
    }
    key_properties {
      exportable = true
      key_type   = each.value.key_type
      key_size   = each.value.key_size
      reuse_key  = true
    }
    secret_properties {
      content_type = "application/x-pkcs12"
    }
  }
}
