module "nsg" {
  source="../../"
  name="platform-nsg"
  location="eastus"
  resource_group_name="rg-network"
  security_rules=[{
    name="allow-https"
    priority=100
    direction="Inbound"
    access="Allow"
    protocol="Tcp"
    destination_port="443"
  }]
}
