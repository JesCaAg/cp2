// Definicion del aks
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-tf-cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-tf-cp2-jca" // Prefijo dns para el acceso al aks
  sku_tier            = "Standard" // Plan escogido

  default_node_pool {
    name       = "default"
    node_count = 1 // Numero de nodos
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

// Descarga de kubeconfig
resource "local_file" "aks_kubeconfig" {
  filename = pathexpand("~/.kube/config")
  content = azurerm_kubernetes_cluster.aks.kube_config_raw
  file_permission = "0600"

  depends_on = [ azurerm_kubernetes_cluster.aks ] 
}
