// Definicion de la ip publica
resource "azurerm_public_ip" "pip" {
  name                = "pip-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic" // Ip dinamica
  sku                 = "Basic" // Ip basica

  tags = {
    environment = "casopractico2"
  }
}

// Definicion de la red virtual
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "casopractico2"
  }
}

// Definicion de la subred
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-tf-cp2"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name // Asociacion con la red virtual
  address_prefixes     = ["10.0.1.0/24"]
}

// Definicion del interfaz de red
resource "azurerm_network_interface" "nic" {
  name                = "nic-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name

    ip_configuration { // Asociacion del nic con la subred y la ip publica
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic" // Asignacion automatica
        public_ip_address_id          = azurerm_public_ip.pip.id
    }

  tags = {
    environment = "casopractico2"
  }
}
