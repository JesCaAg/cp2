// Asignacion de roles para descargar imagenes del acr para desplegar contenedores
resource "azurerm_role_assignment" "aks-acr" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id // Quien recibe el permiso (aks)
  role_definition_name = "AcrPull" // Permiso para hacer pull
  scope                = azurerm_container_registry.acr.id // Alcance (acr)

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_container_registry.acr
  ]
}
