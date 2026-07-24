resource "azurerm_policy_set_definition" "this" {
  name         = var.name
  policy_type  = "Custom"
  display_name = var.display_name

  dynamic "policy_definition_reference" {
    for_each = var.policy_definitions
    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      reference_id         = policy_definition_reference.value.reference_id
    }
  }
}
