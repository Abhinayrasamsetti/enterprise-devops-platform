
module "resource_group" {
  source   = "../../modules/resource-group"
  name     = "rg-platform-dev"
  location = var.location
}
