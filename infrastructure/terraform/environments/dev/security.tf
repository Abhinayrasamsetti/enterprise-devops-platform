
module "identity" {
  source="../../modules/managed-identity"
  name="id-platform-dev"
  location=var.location
  resource_group_name=module.resource_group.name
}

module "keyvault" {
  source="../../modules/key-vault"
  name="kv-platform-dev-001"
  location=var.location
  resource_group_name=module.resource_group.name
  tenant_id="00000000-0000-0000-0000-000000000000"
}
