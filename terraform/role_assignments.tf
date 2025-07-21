// Asignacion de roles para descargar imagenes del acr para desplegar contenedores
resource "azurerm_role_assignment" "aks-acr" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id // Quien recibe el permiso (aks - kubelet)
  role_definition_name = "AcrPull" // Permiso para hacer pull
  scope                = azurerm_container_registry.acr.id // Alcance (acr)
  skip_service_principal_aad_check = true

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_container_registry.acr
  ]
}
