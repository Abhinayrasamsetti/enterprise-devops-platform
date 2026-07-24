resource "azurerm_kubernetes_cluster" "security" {
  name = var.cluster_name

  network_profile {
    network_policy = "azure"
  }
}
