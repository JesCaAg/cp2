// Definicion del acr
resource "azurerm_container_registry" "acr" {
  name                = "acr-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Basic" // Plan basico
  admin_enabled       = true // Habilita cuenta de admin

  tags = {
    environment = "casopractico2"
  }
}
