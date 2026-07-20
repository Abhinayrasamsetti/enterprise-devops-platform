module "firewall" {
  source = "../../"
  name = "platform-fw"
  location = "eastus"
  resource_group_name = "rg-network"
  azure_firewall_subnet_id = "/subscriptions/000/.../AzureFirewallSubnet"
  public_ip_id = "/subscriptions/000/.../publicIPAddresses/fw-pip"
}
