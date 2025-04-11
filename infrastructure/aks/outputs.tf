# Output the name of the AKS cluster
output "aks_name" {
  value = azurerm_kubernetes_cluster.globalshop_aks.name  # Outputs the AKS cluster's name
}

# Output the raw Kubernetes config for the AKS cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.globalshop_aks.kube_config_raw  # Returns the full kubeconfig in raw format
  sensitive = true  # Marks the output as sensitive to avoid showing it in plain text during Terraform apply
}
