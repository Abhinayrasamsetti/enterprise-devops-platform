module "application_gateway" {
  source = "../../"

  name                = "agw-prod"
  location            = "eastus"
  resource_group_name = "rg-network"
}
