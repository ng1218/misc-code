resource "null_resource" "name" {
  
}

terraform {
  backend "azurerm" {
    use_msi              = true                                    # Can also be set via `ARM_USE_MSI` environment variable.
    tenant_id            = "a9c314e0-1e86-4d94-a505-62afc24fe8b7"  # Can also be set via `ARM_TENANT_ID` environment variable.
    subscription_id      = "ddffee8a-e239-4aa1-b7e0-b88ff5a2f9aa"  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    resource_group_name  = "ngresources"
    storage_account_name = "nareshdevops1"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "roboshop-state-files"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "test.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}