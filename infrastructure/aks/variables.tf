# Name for the AKS cluster
variable "aks_name" {
  default = "aks-globalshop"  # Sets the default name for the AKS cluster
}

# Azure region where resources will be deployed
variable "location" {
  default = "East US"         # Default location (region) for the AKS cluster
}

# Name of the resource group to contain the AKS cluster
variable "resource_group_name" {
  default = "rg-globalshop"   # Default resource group name
}

# Subnet ID where the AKS nodes will be deployed
variable "aks_subnet_id" {
  description = "ID of the subnet where AKS will be deployed"  # Human-readable explanation
  type        = string                                         # Type is explicitly defined as a string
  # No default is provided, so this must be supplied via CLI, tfvars file, or elsewhere
}

# Number of nodes in the default node pool
variable "node_count" {
  default = 2  # Sets 2 nodes by default in the Kubernetes cluster
}
