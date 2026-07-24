resource "azurerm_route_table" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "routes" {
  for_each            = { for r in var.routes : r.name => r }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.this.name
  address_prefix      = each.value.address_prefix
  next_hop_type       = each.value.next_hop_type
}
