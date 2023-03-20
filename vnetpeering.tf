locals {
    onprem-rg   = azurerm_resource_group.onprem-rg
    onprem-vnet = azurerm_virtual_network.onprem-vnet
    hub-rg      = azurerm_resource_group.hub-rg
    hub-vnet    = azurerm_virtual_network.hub-vnet
    s1-rg       = azurerm_resource_group.s1-rg
    s1-vnet     = azurerm_virtual_network.s1-vnet
    s2-rg       = azurerm_resource_group.s2-rg
    s2-vnet     = azurerm_virtual_network.s2-vnet
}

resource "azurerm_virtual_network_peering" "onprem-to-hub" {
  name                      = "onprem-to-hub"
  resource_group_name       = local.onprem-rg.name
  virtual_network_name      = local.onprem-vnet.name
  remote_virtual_network_id = local.hub-vnet.id
}

resource "azurerm_virtual_network_peering" "hub-to-onprem" {
  name                      = "hub-to-onprem"
  resource_group_name       = local.hub-rg.name
  virtual_network_name      = local.hub-vnet.name
  remote_virtual_network_id = local.onprem-vnet.id
}

resource "azurerm_virtual_network_peering" "hub-to-s1" {
  name                      = "hub-to-s1"
  resource_group_name       = local.hub-rg.name
  virtual_network_name      = local.hub-vnet.name
  remote_virtual_network_id = local.s1-vnet.id
}

resource "azurerm_virtual_network_peering" "s1-to-hub" {
  name                      = "s1-to-hub"
  resource_group_name       = local.s1-rg.name
  virtual_network_name      = local.s1-vnet.name
  remote_virtual_network_id = local.hub-vnet.id
}

resource "azurerm_virtual_network_peering" "hub-to-s2" {
  name                      = "hub-to-s2"
  resource_group_name       = local.hub-rg.name
  virtual_network_name      = local.hub-vnet.name
  remote_virtual_network_id = local.s2-vnet.id
}

resource "azurerm_virtual_network_peering" "s2-to-hub" {
  name                      = "s2-to-hub"
  resource_group_name       = local.s2-rg.name
  virtual_network_name      = local.s2-vnet.name
  remote_virtual_network_id = local.hub-vnet.id
}