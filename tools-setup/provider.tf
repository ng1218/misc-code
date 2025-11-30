# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "ddffee8a-e239-4aa1-b7e0-b88ff5a2f9aa"
}

terraform {
  backend "azurerm" {
      subscription_id      = "ddffee8a-e239-4aa1-b7e0-b88ff5a2f9aa"
      resource_group_name  = "ngresources"
      storage_account_name = "nareshdevops1"
      container_name       = "roboshop-state-files"
      key                  = "tools.terraform.tfstate"
  }
}