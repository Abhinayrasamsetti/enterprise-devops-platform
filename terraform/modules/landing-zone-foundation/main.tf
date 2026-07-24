locals {
  landing_zone_name = var.name
}

output "landing_zone_name" {
  value = local.landing_zone_name
}
