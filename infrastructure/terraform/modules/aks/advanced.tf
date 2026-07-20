# Production enhancements

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_D4s_v5"
  node_count            = 2
  auto_scaling_enabled  = true
  min_count             = 2
  max_count             = 5
  mode                  = "User"
  zones                 = ["1","2","3"]
}
