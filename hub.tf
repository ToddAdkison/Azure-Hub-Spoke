locals {
    hub-location = "centralus"
    hub-resource-group = "hub-rg"
    prefix-hub = "hub"
}

resource "azurerm_resource_group" "hub-rg" {
  name     = local.hub-resource-group
  location = local.hub-location

  tags = {
    environment = local.prefix-hub
    location = local.hub-location  
  }
}

resource "azurerm_virtual_network" "hub-vnet" {
  name                = "${local.prefix-hub}-vnet"
  location            = local.hub-location
  resource_group_name = local.hub-resource-group
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "untrusted"
    address_prefix = "10.0.0.32/27"
  }

  subnet {
    name           = "trusted"
    address_prefix = "10.0.0.64/27"
  }

  tags = {
    environment = local.prefix-hub
    location = local.hub-location  
  }
}