module "ddos_plan" {
  source = "../../"

  name                = "ddos-standard"
  location            = "eastus"
  resource_group_name = "rg-network"
}
