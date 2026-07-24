module "enterprise_tags" {
  source = "../../"

  environment   = "prod"
  application   = "platform"
  business_unit = "IT"
  owner          = "platform-team"
  cost_center    = "CC1001"
}
