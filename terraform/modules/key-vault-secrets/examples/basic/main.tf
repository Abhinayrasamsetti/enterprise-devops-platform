module "secrets" {
  source="../../"
  key_vault_id="/subscriptions/000/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/example"
  secrets={
    username="admin"
    password="change-me"
  }
}
