module "backup_dr" {
  source = "../../"
  storage_account_name = "stbackup"
  resource_group_name  = "rg-backup"
}
