resource "azurerm_network_interface" "main" {
  name                = "nic-${var.workload}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "nginx"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "vm-${var.workload}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.vm_admin_user
  admin_password        = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.main.id]

  custom_data = filebase64("${path.module}/init.sh")

  admin_ssh_key {
    username   = var.vm_admin_user
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
