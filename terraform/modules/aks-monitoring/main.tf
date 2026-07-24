resource "azurerm_monitor_diagnostic_setting" "aks" {
  name               = "aks-diagnostics"
  target_resource_id = var.cluster_id
}
