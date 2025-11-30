provider "azurerm" {
  features {}
  subscription_id = "ddffee8a-e239-4aa1-b7e0-b88ff5a2f9aa"
}

resource "azurerm_storage_account" "example" {
  name                     = "nareshdevops"
  resource_group_name      = "ngresources"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
