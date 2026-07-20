resource "azurerm_application_insights_workbook" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  display_name        = var.display_name
  data_json           = file(var.workbook_json)
}
