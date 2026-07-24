module "platform_management_group" {
  source = "../../"

  name         = "platform"
  display_name = "Platform"

  parent_management_group_id = null
}
