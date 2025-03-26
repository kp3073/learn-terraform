resource "azurerm_public_ip" "main" {
  name                = "example-pip"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
	environment = "Production"
  }
}


resource "azurerm_network_interface" "main" {
  for_each            = var.vms
  name                = "${each.value["vm_name"]}-${var.env}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
	name                          = "internal"
	subnet_id                     = data.azurerm_subnet.subnet.id
	private_ip_address_allocation = "Dynamic"
	public_ip_address_id          = azurerm_public_ip.main.id
  }
}


resource "azurerm_network_security_group" "main" {
  name                = "acceptanceTestSecurityGroup1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name


  security_rule {
	name                       = "allow-all"
	priority                   = 100
	direction                  = "Inbound"
	access                     = "Allow"
	protocol                   = "Tcp"
	source_port_range          = "*"
	destination_port_range     = "*"
	source_address_prefix      = "*"
	destination_address_prefix = "*"
  }

  tags = {
	environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  for_each                  = var.vms
  network_interface_id      = azurerm_network_interface.main[each.key].id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_virtual_machine" "main" {
  for_each            = var.vms
  name                = "${each.value["vm_name"]}-${var.env}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size = each.value["vm_size"]




  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
	id = "/subscriptions/4b236e6d-2c9a-4cb2-90a2-30a5377d8eb2/resourceGroups/azuredevops/providers/Microsoft.Compute/galleries/azawsdevops/images/azawsdevops/versions/1.0.0"
  }

  storage_os_disk {
	name              = "${each.value["vm_name"]}-${var.env}"
	caching           = "ReadWrite"
	create_option     = "FromImage"
	managed_disk_type = "Standard_LRS"
  }
  os_profile {
	computer_name  = each.value["vm_name"]
	admin_username = "cenetos"
	admin_password = "Password1234$$$$"
  }
  os_profile_linux_config {
	disable_password_authentication = false
  }
  tags = {
	database = "${each.key}-${var.env}"
  }
}

resource "azurerm_dns_a_record" "private" {
  for_each            = var.vms
  name                = azurerm_virtual_machine.main[each.key].name
  zone_name           = "cloudaws.online"
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 30
  records = [azurerm_network_interface.main[each.key].private_ip_address]
}

resource "azurerm_dns_a_record" "public" {
  for_each            = var.vms
  name                = azurerm_virtual_machine.main[each.key].name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 2
  zone_name           = "cloudaws.shop"
  records = [azurerm_public_ip.main.ip_address]
}