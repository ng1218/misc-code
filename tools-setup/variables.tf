variable "name" {
  default = "vault"
}

variable "resource_group_name" {
  default = "myfirstvm_group"
}

variable "location" {
  default = "UK West"
}

variable "tools" {
    default = {
        vault = {
            vm_size = "Standard_B2s"
        }
    } 
}