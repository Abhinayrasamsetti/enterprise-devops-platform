output "key_ids" {
  value = { for k,v in azurerm_key_vault_key.this : k => v.id }
}
