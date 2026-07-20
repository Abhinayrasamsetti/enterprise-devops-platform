module "alerts" {
  source = "../../"
  alert_name = "high-cpu"
  resource_group_name = "rg-monitoring"
  target_resource_id = "/subscriptions/.../managedClusters/aks-prod"
}
