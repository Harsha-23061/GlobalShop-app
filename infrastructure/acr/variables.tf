# Variable for Azure Container Registry name
variable "acr_name" {
  default = "globalshopacr"  # Default name of the ACR
}

# Variable for the name of the resource group
variable "resource_group_name" {
  default = "rg-globalshop"  # Default name of the resource group to contain the ACR
}

# Variable for the Azure location/region
variable "location" {
  default = "East US"  # Default Azure region where the resources will be deployed
}
