module "route_table" {
  source = "../../"

  name = "hub-rt"
  resource_group_name = "rg-network"
  location = "eastus"

  routes = [{
    name = "default-route"
    address_prefix = "0.0.0.0/0"
    next_hop_type = "VirtualAppliance"
  }]
}
