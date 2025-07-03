// Salida de la ip publica de la vm
output "pip_vm" {
  value = azurerm_public_ip.pip.ip_address
}
