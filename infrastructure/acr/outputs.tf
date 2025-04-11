output "acr_login_server" {
  value = azurerm_container_registry.globalshop_acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.globalshop_acr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.globalshop_acr.admin_password
  sensitive = true
}
