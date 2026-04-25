output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gateway.id
}

output "application_subnet_id" {
  value = azurerm_subnet.application.id
}
