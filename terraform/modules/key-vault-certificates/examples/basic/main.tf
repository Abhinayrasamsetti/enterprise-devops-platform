module "certificates" {
  source = "../../"

  key_vault_id = "/subscriptions/000/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/example"

  certificates = {
    web = {
      issuer_name = "Self"
      key_type    = "RSA"
      key_size    = 2048
    }
  }
}
