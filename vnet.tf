resource "azurerm_resource_group" "rg_l" {
    name = "vnet_peering_rg"
    location = "eastus"
}

resource "azurerm_virtual_network" "vnet_l1" {
    name = "vnet_peering_vnet1"
    location = azurerm_resource_group.rg_l.location
    resource_group_name = azurerm_resource_group.rg_l.name
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "sn_l1" {    
  name = "vnet_peering_sn1"
  resource_group_name = azurerm_resource_group.rg_l.name
  address_prefixes = [ "10.0.0.0/24" ]
  virtual_network_name = azurerm_virtual_network.vnet_l1.name
}
resource "azurerm_virtual_network" "vnet_l2" {
    name = "vnet_peering_vnet2"
    location = azurerm_resource_group.rg_l.location
    resource_group_name = azurerm_resource_group.rg_l.name
    address_space = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "sn_l2" {    
  name = "vnet_peering_sn2"
  resource_group_name = azurerm_resource_group.rg_l.name
  address_prefixes = [ "10.1.1.0/24" ]
  virtual_network_name = azurerm_virtual_network.vnet_l2.name
}

resource "azurerm_virtual_network_peering" "p1to2_l" {
  name                      = "vnet_peering_peer1to2"
  resource_group_name       = azurerm_resource_group.rg_l.name
  virtual_network_name      = azurerm_virtual_network.vnet_l1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_l2.id
}

resource "azurerm_virtual_network_peering" "p2to1_l" {
  name                      = "vnet_peering_peer2to1"
  resource_group_name       = azurerm_resource_group.rg_l.name
  virtual_network_name      = azurerm_virtual_network.vnet_l2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_l1.id
}