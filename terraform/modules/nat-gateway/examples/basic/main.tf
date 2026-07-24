module "nat_gateway" {
  source = "../../"

  name                = "nat-prod"
  location            = "eastus"
  resource_group_name = "rg-network"
  subnet_ids          = ["/subscriptions/.../subnets/private"]
}
