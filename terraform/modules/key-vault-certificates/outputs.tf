output "certificate_ids" {
  value = { for k,v in azurerm_key_vault_certificate.this : k => v.id }
}
