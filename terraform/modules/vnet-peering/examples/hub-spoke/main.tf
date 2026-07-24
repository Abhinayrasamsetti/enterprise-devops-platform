module "hub_to_spoke" {
  source = "../../"

  name                      = "hub-to-spoke"
  resource_group_name       = "rg-network"
  virtual_network_name      = "hub-vnet"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network/providers/Microsoft.Network/virtualNetworks/spoke-vnet"
}
