
module "acr" {
  source              = "../../modules/container-registry"
  name                = "acrplatformdev001"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Premium"
}
