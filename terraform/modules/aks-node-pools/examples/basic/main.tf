module "node_pools" {
  source     = "../../"
  name       = "userpool"
  cluster_id = "/subscriptions/.../managedClusters/aks-prod"
}
