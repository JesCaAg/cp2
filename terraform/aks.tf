// Definicion del aks
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "aks-tf-cp2-jca" // Prefijo dns para el endpoint publico
  sku_tier            = "Standard" // Plan escogido

  default_node_pool {
    name       = "default"
    node_count = 2 // Numero de nodos
    vm_size    = "Standard_B2s" // Caracteristicas de los nodos del pool
  }

  identity {
    type = "SystemAssigned" // Identidad gestionada por Azure
  }

  role_based_access_control_enabled = true // Acceso basado en roles

  tags = {
    environment = "casopractico2"
  }
}
