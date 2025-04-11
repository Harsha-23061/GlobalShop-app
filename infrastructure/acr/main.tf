# Configure the Microsoft Azure provider
provider "azurerm" {
  features {}  # Required block, even if empty, to enable all AzureRM features
  subscription_id = "60dd15b1-991a-4c8f-9f83-ed6b31885ae7"

}

# Create an Azure Container Registry (ACR) resource
resource "azurerm_container_registry" "globalshop_acr" {
  name                = var.acr_name              # Name of the ACR, passed from a variable
  resource_group_name = var.resource_group_name   # Name of the resource group where ACR will be created
  location            = var.location              # Azure region for the ACR, passed from a variable
  sku                 = "Basic"                   # Pricing tier for ACR (Basic, Standard, Premium)
  admin_enabled       = true                      # Enables the admin user account for ACR (useful for authentication during testing/dev)
}
