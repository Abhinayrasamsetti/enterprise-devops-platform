resource "azurerm_monitor_alert_processing_rule_action_group" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  add_action_group_ids = var.action_group_ids
}
