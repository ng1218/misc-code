resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Network/virtualNetworks/myfirstvm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_public_ip" public_ip {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  sku                     = "Basic" 
}

###### MOVED TO SPOT VM CREATION ###############
# resource "azurerm_virtual_machine" "vm" {
#   name                  = var.name
#   location              = var.location
#   resource_group_name   = var.resource_group_name
#   network_interface_ids = [azurerm_network_interface.privateip.id]
#   vm_size               = var.vm_size

#   delete_os_disk_on_termination = true

#   storage_image_reference {
#    id = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Compute/images/local-devops-practice"
#   }
#   storage_os_disk {
#     name              = "${var.name}-disk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = var.name
#     admin_username = "azuser"
#     admin_password = "devops@123456"
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }


resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  admin_username        = "adminuser"
  admin_password        = "devops@123456" 
  network_interface_ids = [azurerm_network_interface.privateip.id]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id           = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Compute/images/local-devops-practice"
  priority                  = "Spot"
  eviction_policy           = "Deallocate"
  max_bid_price             = -1 
}



resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/raghuproject_resources/providers/Microsoft.Network/networkSecurityGroups/allow-all-test"
}

# resource "azurerm_dns_a_record" "dns_record_public" {
#   depends_on            = [azurerm_linux_virtual_machine.vm  ]
#   name                  = var.name
#   zone_name             = "nareshdevops1218.online"
#   resource_group_name   = var.resource_group_name
#   ttl                   = 3
#   records               = [azurerm_public_ip.public_ip.ip_address]
# }

resource "azurerm_dns_a_record" "dns_record_private" {
  depends_on            = [azurerm_linux_virtual_machine.vm  ]
  name                  = "${var.name}-int"
  zone_name             = "nareshdevops1218.online"
  resource_group_name   = var.resource_group_name
  ttl                   = 3
  records               = [azurerm_network_interface.privateip.private_ip_address]
}

output "name" {
  value = azurerm_public_ip.public_ip
}