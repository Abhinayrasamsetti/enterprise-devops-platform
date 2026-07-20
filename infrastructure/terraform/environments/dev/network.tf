
module "vnet" {
  source="../../modules/virtual-network"
  name="vnet-platform-dev"
  location=var.location
  resource_group_name=module.resource_group.name
  address_space=["10.10.0.0/16"]
}
