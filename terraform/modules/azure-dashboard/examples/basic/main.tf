module "dashboard" {
  source="../../"
  name="platform-dashboard"
  resource_group_name="rg-monitoring"
  location="Central India"
  dashboard_json="dashboard.json"
}
