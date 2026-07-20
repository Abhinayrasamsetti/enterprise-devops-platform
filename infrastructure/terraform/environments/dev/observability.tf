module "log_analytics" {
  source="../../modules/log-analytics"
  name="law-platform-dev"
  location=var.location
  resource_group_name=module.resource_group.name
}

module "application_insights" {
  source="../../modules/application-insights"
  name="appi-platform-dev"
  location=var.location
  resource_group_name=module.resource_group.name
  workspace_id=module.log_analytics.workspace_id
}
