// Definicion de la clave para ssh
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Generacion y descarga de la clave privada
resource "local_file" "pem" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${pathexpand("~/.ssh/id_rsa")}"
  file_permission = "0600" // Permiso de lectura y escritura para el propietario
}
