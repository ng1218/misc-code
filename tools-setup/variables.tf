variable "name" {
  default = "vault"
}

variable "resource_group_name" {
  default = "ngresources"
}

variable "location" {
  default = "UK West"
}

variable "tools" {
    default = {
        vault = {
            vm_size = "Standard_B2ats_v2"
        }
    } 
}