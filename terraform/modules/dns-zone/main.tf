resource "azurerm_dns_zone" "public" {
  count=var.zone_type=="Public"?1:0
  name=var.name
  resource_group_name=var.resource_group_name
  tags=var.tags
}

resource "azurerm_private_dns_zone" "private" {
  count=var.zone_type=="Private"?1:0
  name=var.name
  resource_group_name=var.resource_group_name
  tags=var.tags
}
