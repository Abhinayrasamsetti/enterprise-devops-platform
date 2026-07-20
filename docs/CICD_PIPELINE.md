# CI/CD Pipeline

Stages:
- Build
- Push to ACR
- Azure Login (OIDC)
- Deploy to AKS with Helm
- Manual rollback
