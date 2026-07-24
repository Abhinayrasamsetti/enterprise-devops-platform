# Enterprise AKS Platform Example

module "aks_cluster" {
  source = "../../modules/aks-cluster"
}

# Compose networking, security, monitoring,
# backup, ingress, workload identity and service mesh modules.
