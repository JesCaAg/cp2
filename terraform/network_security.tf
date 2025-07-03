resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
