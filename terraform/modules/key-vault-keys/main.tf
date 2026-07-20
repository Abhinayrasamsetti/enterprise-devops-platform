resource "azurerm_key_vault_key" "this" {
  for_each     = var.keys
  name         = each.key
  key_vault_id = var.key_vault_id
  key_type     = each.value.key_type
  key_size     = each.value.key_size
  key_opts     = each.value.key_opts
}
