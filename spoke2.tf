locals {
    s2-location = "centralus"
    s2-resource-group = "s2-rg"
    prefix-s2 = "s2"
}

resource "azurerm_resource_group" "s2-rg" {
  name     = local.s2-resource-group
  location = local.s2-location

  tags = {
    environment = local.prefix-s2
    location = local.s2-location  
  }
}

resource "azurerm_virtual_network" "s2-vnet" {
  name                = "${local.prefix-s2}-vnet"
  location            = local.s2-location
  resource_group_name = local.s2-resource-group
  address_space       = ["10.2.0.0/16"]

  subnet {
    name           = "workload"
    address_prefix = "10.2.0.0/24"
  }

  tags = {
    environment = local.prefix-s2
    location = local.s2-location  
  }
}