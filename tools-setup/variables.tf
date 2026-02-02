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
            vm_size = "Standard_B2als_v2"
            spot = true
        }
        github-runner = {
          vm_size = "Standard_D2ls_v5"
          spot = false
        }
    } 
}