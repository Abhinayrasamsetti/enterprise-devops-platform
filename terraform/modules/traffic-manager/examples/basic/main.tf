module "traffic_manager" {
  source = "../../"

  name                = "tm-global"
  resource_group_name = "rg-network"
  routing_method      = "Performance"
  dns_name            = "enterprise-platform"
}
