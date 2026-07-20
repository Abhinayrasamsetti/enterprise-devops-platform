# Enterprise Architecture Overview

## Architecture Principles

- Infrastructure as Code
- Immutable deployments
- GitOps-first
- Least privilege
- Zero Trust
- Observability by default

## Platform Flow

```mermaid
flowchart LR
Developer-->GitHub
GitHub-->GitHubActions
GitHubActions-->Terraform
Terraform-->Azure
Azure-->AKS
AKS-->Applications
Applications-->Prometheus
Prometheus-->Grafana
```
