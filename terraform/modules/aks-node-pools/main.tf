resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.name
  kubernetes_cluster_id = var.cluster_id
  vm_size               = var.vm_size
  auto_scaling_enabled  = true
  min_count             = 2
  max_count             = 5
}
