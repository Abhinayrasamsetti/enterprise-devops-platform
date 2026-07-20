module "action_group" {
  source="../../"
  name="platform-alerts"
  resource_group_name="rg-monitoring"
  short_name="plat"
  notification_email="platform@example.com"
}
