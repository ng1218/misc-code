provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}

resource "azurerm_storage_account" "example" {
  name                     = "nareshdevops"
  resource_group_name      = "myfirstvm_group"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
