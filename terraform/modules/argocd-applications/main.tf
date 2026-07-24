resource "kubernetes_manifest" "application" {
  manifest = yamldecode(file("${path.module}/application.yaml"))
}
