resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = "myfirstvm_group"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}