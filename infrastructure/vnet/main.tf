# ✅ Specifies the provider and initializes AzureRM
#provider "azurerm" {
#  features {}  # Required by AzureRM even if not used
#}

provider "azurerm" {
  features {}
  subscription_id = "60dd15b1-991a-4c8f-9f83-ed6b31885ae7"
}

# ✅ Creates a Resource Group in Azure
resource "azurerm_resource_group" "globalshop" {
  name     = var.resource_group_name   # Name is passed as a variable
  location = var.location              # Location is passed as a variable (e.g., "East US")
}

# ✅ Creates a Virtual Network (VNet) in the Resource Group
resource "azurerm_virtual_network" "globalshop_vnet" {
  name                = var.vnet_name                          # VNet name from variable
  address_space       = ["10.0.0.0/16"]                         # Allows 65,536 IPs
  location            = azurerm_resource_group.globalshop.location  # Inherit location from resource group
  resource_group_name = azurerm_resource_group.globalshop.name      # Inherit resource group
}

# ✅ Creates a Subnet within the Virtual Network
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"                          # Static name for the subnet
  resource_group_name  = azurerm_resource_group.globalshop.name      # Inherit resource group
  virtual_network_name = azurerm_virtual_network.globalshop_vnet.name # Attach to the VNet
  address_prefixes     = ["10.0.1.0/24"]                       # Subnet size: 256 IPs
}
