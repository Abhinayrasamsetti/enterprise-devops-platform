
locals {
  base_name = lower(join("-", compact([
    var.organization,
    var.project,
    var.environment,
    var.location_short
  ])))

  common_tags = merge({
    ManagedBy   = "Terraform"
    Environment = var.environment
    Project     = var.project
  }, var.additional_tags)
}
