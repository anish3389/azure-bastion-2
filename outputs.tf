output "private_vm_ip" {
  description = "Private IP of Private VM."
  value = azurerm_network_interface.private.private_ip_address
}

output "public_vm_ip" {
  description = "Public IP of Public VM."
  value = azurerm_public_ip.vm_ip.ip_address
}