resource "azurerm_policy_definition" "this" {
  name         = var.name
  policy_type  = "Custom"
  mode         = var.mode
  display_name = var.display_name
  policy_rule  = var.policy_rule
  metadata     = var.metadata
}
