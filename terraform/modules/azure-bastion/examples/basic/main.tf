module "bastion" {
  source="../../"
  name="platform-bastion"
  location="eastus"
  resource_group_name="rg-network"
  azure_bastion_subnet_id="/subscriptions/000/.../AzureBastionSubnet"
  public_ip_id="/subscriptions/000/.../publicIPAddresses/bastion-pip"
}
