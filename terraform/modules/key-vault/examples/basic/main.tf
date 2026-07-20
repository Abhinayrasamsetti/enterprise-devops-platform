module "key_vault" {
  source="/tmp"
  name="example-kv"
  location="eastus"
  resource_group_name="rg-example"
  tenant_id="00000000-0000-0000-0000-000000000000"
}
