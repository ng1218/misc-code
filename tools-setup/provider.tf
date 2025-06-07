# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}

terraform {
  backend "azurerm" {
      subscription_id      = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
      resource_group_name  = "myfirstvm_group"
      storage_account_name = "nareshdevops"                        
      container_name       = "roboshop-state-files"
      key                  = "tools.terraform.tfstate"
  }
}