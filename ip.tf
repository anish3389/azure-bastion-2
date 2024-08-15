resource "azurerm_public_ip" "bastion_ip" {
  name                = "ip_anish_bastion"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  allocation_method   = local.ip.allocation_method
  sku = local.ip.sku

  tags = var.default_tags
}

resource "azurerm_public_ip" "nat_ip" {
  name                = "ip_anish_nat"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  allocation_method   = local.ip.allocation_method
  sku = local.ip.sku

  tags = var.default_tags
}

resource "azurerm_public_ip" "vm_ip" {
  name                = "ip_anish_vm"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  allocation_method   = local.ip.allocation_method
  sku = local.ip.sku

  tags = var.default_tags
}