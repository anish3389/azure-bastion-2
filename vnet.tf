resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = local.vnet.address_space

  tags = var.default_tags
}

resource "azurerm_subnet" "subnet_public" {
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.vnet.public_subnets)
  name                 = "${var.prefix}-public-subnet${count.index}"
  address_prefixes     = local.vnet.public_subnets[count.index].address_prefixes
}

resource "azurerm_subnet" "subnet_private" {
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.vnet.private_subnets)
  name                 = "${var.prefix}-private-subnet${count.index}"
  address_prefixes     = local.vnet.private_subnets[count.index].address_prefixes
}



resource "azurerm_subnet" "subnet_bastion" {
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  name                 = "AzureBastionSubnet"
  address_prefixes     = ["10.1.13.0/24"]
}