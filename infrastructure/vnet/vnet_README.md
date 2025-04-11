# 📘 Terraform Project: GlobalShop Azure Platform

This project provisions core Azure resources for the **GlobalShop E-Commerce Platform** using Terraform.

---

## 📂 Project Structure

```
terraform-globalshop/
├── main.tf           # Main resources (RG, VNet, Subnet, etc.)
├── variables.tf      # Input variables used in main.tf
├── outputs.tf        # Values displayed after deployment
├── terraform.tfvars  # Actual values for variables (optional)
├── README.md         # Documentation
```

---

## 📄 Explanation of Files

### 🔹 `main.tf`
- Core Terraform configuration.
- Defines **provider** and all Azure resources like:
  - Resource Group
  - Virtual Network
  - Subnet

### 🔹 `variables.tf`
- Declares **input variables** that can be reused in `main.tf`.
- Keeps the code clean, reusable, and DRY.

### 🔹 `outputs.tf`
- Shows important info **after deployment**, like:
  - Resource group name
  - Subnet ID (for connecting to AKS, etc.)

### 🔹 `terraform.tfvars` *(optional but useful)*
- Stores **values for variables** defined in `variables.tf`.
- Keeps sensitive/region-specific info out of the main files.

---

## 💡 Why This Structure?

| File              | Why We Need It                                   |
|-------------------|--------------------------------------------------|
| `main.tf`         | ✅ Required. This is the core of your infra setup |
| `variables.tf`    | 👌 Optional but makes code clean & reusable       |
| `outputs.tf`      | 👌 Optional but helpful for debugging/reuse       |
| `terraform.tfvars`| 👌 Optional for separating secrets/configs     |

> ✅ You **can** technically write everything in `main.tf`, but this structure follows **best practices**, especially for teams and CI/CD.

---

## 🔧 Prerequisites

- Azure CLI installed & logged in:
  ```bash
  az login
  az account set --subscription "<your-subscription-id>"
  ```

- Terraform installed:
  ```bash
  terraform -version
  ```

---

## 🚀 Getting Started

### 1️⃣ Initialize Terraform
```bash
terraform init
```
Initializes the project, downloads Azure provider plugins.

---

### 2️⃣ (Optional) Validate your configuration
```bash
terraform validate
```
Checks syntax & structure.

---

### 3️⃣ Preview the changes
```bash
terraform plan
```
Shows what resources will be created/updated.

---

### 4️⃣ Apply the configuration
```bash
terraform apply
```
Actually creates the resources in your Azure subscription.

---

### 5️⃣ View the outputs
After `apply`, Terraform shows output values defined in `outputs.tf`.

---

### 6️⃣ (Optional) Destroy all resources
```bash
terraform destroy
```
Tears down everything created by this Terraform code.

---

## 📜 Example Variables (`variables.tf`)

```hcl
variable "resource_group_name" {
  default = "rg-globalshop"
}

variable "location" {
  default = "East US"
}

variable "vnet_name" {
  default = "vnet-globalshop"
}
```

---

## 📜 Example Outputs (`outputs.tf`)

```hcl
# 🟦 Output the name of the Resource Group
output "resource_group_name" {
  value = azurerm_resource_group.globalshop.name
}

# 🟩 Output the name of the Virtual Network (VNet)
output "vnet_name" {
  value = azurerm_virtual_network.globalshop_vnet.name
}

# 🟨 Output the ID of the Subnet created inside the VNet
output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}
```

---

## 📜 Example Terraform Resources (`main.tf`)

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "globalshop" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "globalshop_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.globalshop.location
  resource_group_name = azurerm_resource_group.globalshop.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.globalshop.name
  virtual_network_name = azurerm_virtual_network.globalshop_vnet.name
}
```

---

## 📌 Best Practices

- Use `variables.tf` to avoid hardcoding values.
- Use `terraform.tfvars` or environment variables for sensitive data.
- Structure code into modules for large-scale projects.
- Version control your `.tf` files but **ignore**:
  - `.terraform/`
  - `terraform.tfstate`
  - `*.tfstate.backup`

Add a `.gitignore`:

```
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
```

---

## 📞 Need Help?

Reach out to your DevOps team or refer to [Terraform Azure Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

Happy Shipping! 🚀
