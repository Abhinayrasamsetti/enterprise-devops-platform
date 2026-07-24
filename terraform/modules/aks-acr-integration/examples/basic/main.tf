module "acr_integration" {
  source       = "../../"
  acr_id       = "/subscriptions/.../registries/acrprod"
  principal_id = "00000000-0000-0000-0000-000000000000"
}
