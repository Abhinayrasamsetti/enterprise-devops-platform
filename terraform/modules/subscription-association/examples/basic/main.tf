module "subscription_association" {
  source = "../../"

  management_group_id = "/providers/Microsoft.Management/managementGroups/platform"
  subscription_id     = "/subscriptions/00000000-0000-0000-0000-000000000000"
}
