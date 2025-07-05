variable "location" {
  type = string
  description = "Region de Azure donde crearemos la infraestructura"
  default = "West Europe" 
}

variable "ssh_user" {
  type = string
  description = "Usuario utilizado para acceder por ssh"
  default = "azureuser"
}

variable "rg_name" {
  type = string
  description = "Nombre del resource group"
  default= "rg-tf-cp2"
}

variable "vm_size" {
  type = string
  description = "Tamanho de la vm"
  default= "Standard_B1s"
}

variable "azure_subscription" {
  type = string
  description = "ID de suscripcion de Azure"
}
