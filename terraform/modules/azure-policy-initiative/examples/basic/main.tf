module "policy_initiative" {
  source="../../"
  name="enterprise-governance"
  display_name="Enterprise Governance"
  policy_definitions=[{
    policy_definition_id="/providers/Microsoft.Authorization/policyDefinitions/example"
    reference_id="require-tags"
  }]
}
