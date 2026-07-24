module "policy_definition" {
  source = "../../"

  name         = "require-tags"
  display_name = "Require Resource Tags"
  mode         = "All"

  policy_rule = jsonencode({
    if = {
      field  = "tags"
      exists = "false"
    }
    then = {
      effect = "deny"
    }
  })
}
