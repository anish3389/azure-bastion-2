resource "azurerm_bastion_host" "bastion" {
  name                = "${var.prefix}bastion"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku = "Standard"
  tunneling_enabled = true

  ip_configuration {
    name                 = "${var.prefix}-bastion_ip"
    subnet_id            = azurerm_subnet.subnet_bastion.id
    public_ip_address_id = azurerm_public_ip.bastion_ip.id
  }

}

resource "azurerm_role_assignment" "bastion_role" {
  scope = azurerm_bastion_host.bastion.id
  principal_id = azurerm_virtual_machine.public.identity[0].principal_id
  role_definition_name = "Contributor"
}

resource "azurerm_role_assignment" "resource_group" {
  depends_on = [azurerm_virtual_machine.public]
  scope = data.azurerm_resource_group.main.id
  principal_id = azurerm_virtual_machine.public.identity[0].principal_id
  role_definition_name = "Reader"
}