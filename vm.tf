resource "azurerm_network_interface" "nic_l1" {
  name                = "network_interface1-nic"
  location            = azurerm_resource_group.rg_l.location
  resource_group_name = azurerm_resource_group.rg_l.name

  ip_configuration {
    name                          = "vent_peering_testconfiguration1"
    subnet_id                     = azurerm_subnet.sn_l1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm_l1" {
  name                  = "vnet_peering_vm1"
  location              = azurerm_resource_group.rg_l.location
  resource_group_name   = azurerm_resource_group.rg_l.name
  network_interface_ids = [azurerm_network_interface.nic_l1.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vm1-hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azurerm_network_interface" "nic_l2" {
  name                = "network_interface2-nic"
  location            = azurerm_resource_group.rg_l.location
  resource_group_name = azurerm_resource_group.rg_l.name

  ip_configuration {
    name                          = "vent_peering_testconfiguration2"
    subnet_id                     = azurerm_subnet.sn_l2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm_l2" {
  name                  = "vnet_peering_vm2"
  location              = azurerm_resource_group.rg_l.location
  resource_group_name   = azurerm_resource_group.rg_l.name
  network_interface_ids = [azurerm_network_interface.nic_l2.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vm2-hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "dev"
  }
}