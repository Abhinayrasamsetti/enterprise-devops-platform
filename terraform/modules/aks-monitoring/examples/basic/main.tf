module "aks_monitoring" {
  source = "../../"
  cluster_id = "/subscriptions/.../managedClusters/aks-prod"
  log_analytics_workspace_id = "/subscriptions/.../workspaces/law-prod"
}
