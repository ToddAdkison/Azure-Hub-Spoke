locals {
    onprem-location = "centralus"
    onprem-resource-group = "onprem-rg"
    prefix-onprem = "onprem"
}

resource "azurerm_resource_group" "onprem-rg" {
  name     = local.onprem-resource-group
  location = local.onprem-location

  tags = {
    environment = local.prefix-onprem
    location = local.onprem-location  
  }
}

resource "azurerm_virtual_network" "onprem-vnet" {
  name                = "${local.prefix-onprem}-vnet"
  location            = local.onprem-location
  resource_group_name = local.onprem-resource-group
  address_space       = ["192.168.0.0/16"]

  subnet {
    name           = "mgmt"
    address_prefix = "192.168.1.0/24"
  }

  subnet {
    name           = "vm"
    address_prefix = "192.168.2.0/24"
  }

  tags = {
    environment = local.prefix-onprem
    location = local.onprem-location  
  }
}