module "diagnostics" {
  source = "../../"
  name = "diag-storage"
  target_resource_id = "/subscriptions/.../storageAccounts/stdemo"
  log_analytics_workspace_id = "/subscriptions/.../workspaces/law-demo"
}
