// Definicion del proveedor Azure
provider "azurerm" {
    features {}
    subscription_id = var.azure_subscription
}
