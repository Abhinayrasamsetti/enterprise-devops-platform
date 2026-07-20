module "private_endpoint" {
  source = "../../"
  name = "kv-pe"
  location = "eastus"
  resource_group_name = "rg-platform"
  subnet_id = "/subscriptions/000/.../subnets/private"
  private_resource_id = "/subscriptions/000/.../vaults/example"
  subresource_names = ["vault"]
}
