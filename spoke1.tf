locals {
    s1-location = "centralus"
    s1-resource-group = "s1-rg"
    prefix-s1 = "s1"
}

resource "azurerm_resource_group" "s1-rg" {
  name     = local.s1-resource-group
  location = local.s1-location

  tags = {
    environment = local.prefix-s1
    location = local.s1-location  
  }
}

resource "azurerm_virtual_network" "s1-vnet" {
  name                = "${local.prefix-s1}-vnet"
  location            = local.s1-location
  resource_group_name = local.s1-resource-group
  address_space       = ["10.1.0.0/16"]

  subnet {
    name           = "workload"
    address_prefix = "10.1.0.0/24"
  }

  tags = {
    environment = local.prefix-s1
    location = local.s1-location  
  }
}