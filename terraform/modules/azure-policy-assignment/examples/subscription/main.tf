module "policy_assignment" {
  source = "../../"

  name                 = "require-tags-assignment"
  display_name         = "Require Tags Assignment"
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/example"
}
