module "appinsights" {
  source = "../../"
  name = "appi-platform-prod"
  location = "Central India"
  resource_group_name = "rg-monitoring"
  log_analytics_workspace_id = "/subscriptions/.../workspaces/law-prod"
}
