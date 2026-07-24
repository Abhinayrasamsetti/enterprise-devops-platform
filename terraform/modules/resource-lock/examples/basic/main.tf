module "resource_lock" {
  source = "../../"

  name       = "storage-delete-protection"
  scope      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/demo-rg/providers/Microsoft.Storage/storageAccounts/demostorage"
  lock_level = "CanNotDelete"
}
