module "private_dns" {
  source="../../"
  zone_name="privatelink.vaultcore.azure.net"
  resource_group_name="rg-network"
  virtual_network_id="/subscriptions/000/.../virtualNetworks/vnet-hub"
}
