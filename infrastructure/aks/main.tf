# Configure the Azure provider
provider "azurerm" {
  features {}
  subscription_id = "60dd15b1-991a-4c8f-9f83-ed6b31885ae7"
}

# Define an Azure Kubernetes Service (AKS) cluster
resource "azurerm_kubernetes_cluster" "globalshop_aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "globalshop"

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = "Standard_DS2_v2"
    vnet_subnet_id  = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"

    # ✅ Add non-overlapping CIDRs to avoid conflict with existing subnet 10.0.1.0/24
    service_cidr       = "10.250.0.0/16"
    dns_service_ip     = "10.250.0.10"
  }

  tags = {
    Environment = "dev"
    Project     = "GlobalShop"
  }
}
