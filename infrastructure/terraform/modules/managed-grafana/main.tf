resource "azurerm_dashboard_grafana" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}
