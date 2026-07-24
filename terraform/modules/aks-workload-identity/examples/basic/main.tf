module "workload_identity" {
  source = "../../"
  name = "sample"
  managed_identity_id = "/subscriptions/.../userAssignedIdentities/app-mi"
  issuer_url = "https://issuer.example"
  subject = "system:serviceaccount:default:app"
}
