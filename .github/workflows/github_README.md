# GlobalShop Azure Platform CI/CD Pipeline

This repository contains the CI/CD pipeline setup for deploying containerized applications to **Azure Container Registry (ACR)** and **Azure resources** using **GitHub Actions**.

---

## 🔐 Secrets Configuration

The following secrets must be configured in your repository under:

`Settings` → `Secrets and variables` → `Actions`

### ✅ Required Secrets

| Secret Name         | Description                                                           |
|---------------------|-----------------------------------------------------------------------|
| `ACR_LOGIN_SERVER`  | Your ACR login server URL (e.g., `globalshopacr.azurecr.io`)          |
| `ACR_USERNAME`      | Your ACR admin username                                               |
| `ACR_PASSWORD`      | Your ACR admin password                                               |
| `AZURE_CREDENTIALS` | Azure Service Principal credentials in JSON format                    |

### 📌 Example `AZURE_CREDENTIALS` JSON:

```json
{
  "clientId": "<appId>",
  "clientSecret": "<password>",
  "tenantId": "<tenantId>",
  "subscriptionId": "<subscriptionId>",
  "resourceGroup": "<resourceGroup>",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.azure.com/"
}
