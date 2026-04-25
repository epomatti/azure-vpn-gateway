terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.workload}"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  workload            = var.workload
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "virtual_machine" {
  source              = "./modules/virtual_machine"
  workload            = var.workload
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = module.network.application_subnet_id
  vm_size             = var.vm_size
  vm_admin_user       = var.vm_admin_user
  vm_admin_password   = var.vm_admin_password
}

module "vpn" {
  source              = "./modules/vpn"
  resource_group_name = azurerm_resource_group.main.name
  workload            = var.workload
  location            = var.location
  subnet_id           = module.network.gateway_subnet_id
}
