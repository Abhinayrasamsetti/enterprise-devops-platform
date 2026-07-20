resource "azurerm_dashboard_grafana" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  api_key_enabled     = true
}
