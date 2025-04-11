# 📦 This variable defines the name of the Resource Group.
# If not passed explicitly, it defaults to "rg-globalshop"
variable "resource_group_name" {
  default = "rg-globalshop"  # Default name for the Azure resource group
}

# 🌍 This variable defines the location where Azure resources will be deployed.
# Defaults to "East US", but can be overridden during runtime.
variable "location" {
  default = "East US"  # Azure region where all resources will be created
}

# 🌐 This variable defines the name of the Virtual Network (VNet).
# Defaults to "vnet-globalshop"
variable "vnet_name" {
  default = "vnet-globalshop"  # Name for the virtual network in Azure
}
