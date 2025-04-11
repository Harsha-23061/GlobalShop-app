# 🟦 Output the name of the Resource Group
# This is useful to verify that the RG was created successfully and get its name dynamically
output "resource_group_name" {
  value = azurerm_resource_group.globalshop.name
}

# 🟩 Output the name of the Virtual Network (VNet)
# Helpful when referencing or debugging the virtual network configuration
output "vnet_name" {
  value = azurerm_virtual_network.globalshop_vnet.name
}

# 🟨 Output the ID of the Subnet created inside the VNet
# This full ID is required when associating services like Azure Kubernetes Service (AKS)
# or Application Gateway to a specific subnet
output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}
