module "load_balancer" {
  source = "../../"

  name                = "lb-prod"
  location            = "eastus"
  resource_group_name = "rg-network"
}
