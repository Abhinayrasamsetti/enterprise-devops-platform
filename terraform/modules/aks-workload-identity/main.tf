resource "azurerm_federated_identity_credential" "this" {
  name      = var.name
  parent_id = var.managed_identity_id
  issuer    = var.issuer_url
  subject   = var.subject
  audience  = ["api://AzureADTokenExchange"]
}
