module "alert_processing" {
  source="../../"
  name="platform-routing"
  resource_group_name="rg-monitoring"
  scopes=["/subscriptions/..."]
  action_group_ids=["/subscriptions/.../actionGroups/platform"]
}
