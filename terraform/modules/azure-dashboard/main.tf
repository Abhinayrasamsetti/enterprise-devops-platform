resource "azurerm_portal_dashboard" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  dashboard_properties = file(var.dashboard_json)
}
