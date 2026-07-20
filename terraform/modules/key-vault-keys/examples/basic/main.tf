module "keys" {
  source="../../"
  key_vault_id="/subscriptions/000/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/example"
  keys = {
    signing = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["sign","verify"]
    }
  }
}
