// Definicion de la maquina virtual

resource "azurerm_linux_virtual_machine" "vm" {
    name = "vm-tf-cp2"
    resource_group_name = var.rg_name
    location = var.location
    size = var.vm_size
    admin_username = var.ssh_user
    network_interface_ids = [azurerm_network_interface.nic.id]

    admin_ssh_key { // Definicion de la clave rsa para acceder por ssh
        username = var.ssh_user
        public_key = tls_private_key.ssh_key.public_key_openssh // Clave gestionada por el provider
    }

    os_disk {
        name                 = "osd-tf-cp2"
        caching              = "ReadWrite" // Cache en lectura y escritura para mayor rapidez
        storage_account_type = "Standard_LRS" // HDD estándar con replicacion local
    }

    source_image_reference { // Ubuntu 22.04 LTS
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }

}
