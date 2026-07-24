module "landing_zone" {
  source = "../../modules/landing-zone-foundation"
}

module "tags" {
  source = "../../modules/enterprise-tags"

  environment   = "prod"
  application   = "platform"
  business_unit = "IT"
  owner          = "platform-team"
  cost_center    = "CC1001"
}

# Additional governance modules can be composed here
# (management groups, policies, assignments, locks, etc.)
