// Salida de la ip publica de la vm
output "pip_vm" {
  value = data.azurerm_public_ip.pip.ip_address
}

// Salida de la info de login del acr
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

// Salida del nombre del cluster de aks
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
