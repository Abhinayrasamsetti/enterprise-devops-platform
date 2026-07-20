
module "aks" {
  source              = "../../modules/aks"
  name                = "aks-platform-dev"
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = "aks-platform-dev"
  node_count          = 2
}
