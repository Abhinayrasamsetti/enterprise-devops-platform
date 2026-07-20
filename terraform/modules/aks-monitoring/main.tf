module "diagnostics" {
  source = "../diagnostic-settings"
  name = "${var.cluster_name}-diag"
  target_resource_id = var.cluster_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
}
