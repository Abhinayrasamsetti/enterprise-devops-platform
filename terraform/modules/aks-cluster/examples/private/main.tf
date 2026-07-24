module "aks" {
  source = "../../"
  name = "aks-prod"
  location = "eastus"
  resource_group_name = "rg-platform"
  dns_prefix = "aksprod"
}
