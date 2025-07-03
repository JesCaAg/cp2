// Definicion del security group
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-tf-cp2"
  location            = var.location
  resource_group_name = var.rg_name
}

// Definicion de la apertura de puertos para http
resource "azurerm_network_security_rule" "nsr_http" {
  name                        = "nsr-http-tf-cp2"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.rg_name
  priority                    = 1000
  direction                   = "Inbound" // Tráfico de entrada
  access                      = "Allow" // Permitido
  protocol                    = "Tcp"
  source_port_range           = "*" // Desde cualquier puerto
  destination_port_range      = "80" // Al puerto 80
  source_address_prefix       = "*" // Desde cualquier ip
  destination_address_prefix  = "*" // Hacia cualquier ip
}

// Definicion de la apertura de puertos para https
resource "azurerm_network_security_rule" "nsr_https" {
  name                        = "nsr-https-tf-cp2"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.rg_name
  priority                    = 2000
  direction                   = "Inbound" // Tráfico de entrada
  access                      = "Allow" // Permitido
  protocol                    = "Tcp"
  source_port_range           = "*"  // Desde cualquier puerto
  destination_port_range      = "443" // Al puerto 443
  source_address_prefix       = "*" // Desde cualquier ip
  destination_address_prefix  = "*" // Hacia cualquier ip
}

// Definicion de la apertura de puertos para ssh
resource "azurerm_network_security_rule" "nsr_ssh" {
  name                        = "nsr-ssh-tf-cp2"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.rg_name
  priority                    = 3000
  direction                   = "Inbound" //Tráfico de entrada
  access                      = "Allow" // Permitido
  protocol                    = "Tcp"
  source_port_range           = "*" // Desde cualquier puerto
  destination_port_range      = "22" // Al puerto 22
  source_address_prefix       = "*" // Desde cualquier ip
  destination_address_prefix  = "*" // Hacia cualquier ip
}

// Asociación entre la nic y el nsg
resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
