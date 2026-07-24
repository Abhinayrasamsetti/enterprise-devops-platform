locals {
  standard_tags = {
    Environment = var.environment
    Application = var.application
    BusinessUnit = var.business_unit
    Owner = var.owner
    CostCenter = var.cost_center
    ManagedBy = "Terraform"
  }

  tags = merge(local.standard_tags, var.additional_tags)
}
