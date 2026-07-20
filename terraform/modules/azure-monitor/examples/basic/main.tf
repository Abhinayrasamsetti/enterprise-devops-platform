module "monitor" {
  source="../../"
  name="diag-demo"
  target_resource_id="/subscriptions/.../resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/stdemo"
  log_analytics_workspace_id="/subscriptions/.../resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law"
}
