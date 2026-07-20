resource "azurerm_monitor_metric_alert" "cpu" {
  name                = var.alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.target_resource_id]
  description         = "CPU usage alert"
  severity            = 2
}
