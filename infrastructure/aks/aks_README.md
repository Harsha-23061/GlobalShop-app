# 🌐 GlobalShop AKS Deployment

This project provisions an Azure Kubernetes Service (AKS) cluster for the **GlobalShop** e-commerce platform using Terraform.

---

## 🚀 Overview

- **Cloud Provider**: Microsoft Azure  
- **IaC Tool**: Terraform  
- **Resources Provisioned**:
  - Azure Resource Group
  - AKS Cluster
  - Virtual Network and Subnet (if not pre-existing)
  - System-Assigned Managed Identity
  - Azure CNI Networking

---

## 🗂️ Project Structure

```bash
.
├── main.tf                # AKS resource definition
├── variables.tf           # Input variable declarations
├── outputs.tf             # Outputs like AKS kubeconfig
├── terraform.tfvars       # Actual values for variables
├── provider.tf            # Azure provider configuration
└── README.md              # Project documentation
```

---

## 🔧 Prerequisites

- Azure CLI authenticated to your subscription  
- Terraform CLI (`>= 1.0.0`)  
- Azure Subscription with appropriate RBAC permissions  
- Pre-created Virtual Network and Subnet (if using existing)

---

## 🛠️ How to Use

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Plan Infrastructure

```bash
terraform plan
```

### 4. Apply Changes

```bash
terraform apply
```

> 📌 **Note:** You may be prompted to confirm resource creation. Review and type `yes` to proceed.

---

## 🗛️ Key Configuration Notes

- AKS is configured to use the **Azure CNI** for networking.
- The `service_cidr` is set to `10.250.0.0/16` to avoid overlap with existing subnets.
- AKS is deployed with a **System-Assigned Managed Identity**.
- Tags are used to identify environment (`dev`) and project (`GlobalShop`).

---

## 🔍 Example Output

After deployment, the following outputs are available:

- AKS cluster name
- Resource group
- Kubernetes configuration (can be written to `~/.kube/config`)

---

## 📦 Useful Commands

```bash
# Connect to AKS
az aks get-credentials --resource-group rg-globalshop --name aks-globalshop

# Verify nodes
kubectl get nodes
```

---

## 📙 References

- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure AKS Documentation](https://docs.microsoft.com/en-us/azure/aks/)
- [AKS Service CIDR Overlap Fix](https://aka.ms/aks/servicecidroverlap)

---

## 🙌 Author

Built by the DevOps team for GlobalShop. Feel free to contribute or raise issues.

