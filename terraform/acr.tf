// Definicion del acr
resource "azurerm_container_registry" "acr" {
  name                = "acrTFcp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Basic" // Plan basico
  admin_enabled       = true // Habilita cuenta de admin

  tags = {
    environment = "casopractico2"
  }
}
