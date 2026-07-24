resource "azurerm_nat_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  for_each       = toset(var.subnet_ids)
  subnet_id      = each.value
  nat_gateway_id = azurerm_nat_gateway.this.id
}
