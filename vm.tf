resource "azurerm_virtual_machine" "public" {
  name                = "anish_vm_public"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  network_interface_ids = [azurerm_network_interface.public.id]
  vm_size               = "Standard_B2ts_v2"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true
  identity {
    type = "SystemAssigned"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "vmdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    admin_username = "ubuntu"
    computer_name  = "vmpublic"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("/home/anishs/.ssh/id_rsa.pub")
      path     = "/home/ubuntu/.ssh/authorized_keys"
    }
  }

  tags = var.default_tags
}

resource "azurerm_virtual_machine" "private" {
  name                = "anish_vm_private"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  network_interface_ids = [azurerm_network_interface.private.id]
  vm_size               = "Standard_B2ts_v2"

  identity {
    type = "SystemAssigned"
  }

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "vmdisk222342"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    admin_username = "ubuntu"
    computer_name  = "vmprivate"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("/home/anishs/.ssh/id_rsa.pub")
      path     = "/home/ubuntu/.ssh/authorized_keys"
    }
  }

  tags = var.default_tags
}
