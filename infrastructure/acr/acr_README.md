# 🌐 GlobalShop Azure Platform - Infrastructure Setup

This project provisions Azure infrastructure for the GlobalShop e-commerce platform using Terraform. It includes:

- Azure Container Registry (ACR)
- Optional AKS integration for Kubernetes-based deployments

---

## 📁 Project Structure

```
.
├── main.tf              # ACR resource definition
├── variables.tf         # Input variables (name, region, etc.)
├── outputs.tf           # ACR credentials and login server
└── README.md            # This file
```

---

## 🚀 Prerequisites

- Azure CLI installed and authenticated (`az login`)
- Terraform installed (`v1.0+`)
- Azure subscription access

---

## ⚙️ Steps to Deploy

### 1. Clone the Repo

```bash
git clone https://github.com/your-org/globalshop-infra.git
cd globalshop-infra
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🔐 ACR Details

After `terraform apply`, retrieve ACR info:

```bash
terraform output acr_login_server
terraform output acr_admin_username
terraform output acr_admin_password
```

These values allow Docker to authenticate with your ACR.

### 🔑 Docker Login

```bash
docker login <acr_login_server> -u <acr_admin_username> -p <acr_admin_password>
```

---

## 🐳 Push Docker Image Example

```bash
# Tag image
docker tag myapp:latest globalshopacr.azurecr.io/myapp:latest

# Push image to ACR
docker push globalshopacr.azurecr.io/myapp:latest
```

---

## ☘️ (Optional) Connect ACR to AKS

If you already have an AKS cluster and want it to pull images from your ACR:

```bash
az aks update \
  --name aks-globalshop \
  --resource-group rg-globalshop \
  --attach-acr globalshopacr
```

> Make sure the AKS cluster `aks-globalshop` exists in the correct resource group before running this.

---

## 📼 Clean Up

To destroy all provisioned resources:

```bash
terraform destroy
```

---

## 📌 Notes

- `admin_enabled = true` is enabled for simplicity. In production, consider using [managed identities](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-auth-aks) for better security.
- You can extend this Terraform stack to include AKS, storage, databases, etc.

---

## 📞 Need Help?

Open an issue or reach out to the DevOps team. Happy shipping! 🚀

