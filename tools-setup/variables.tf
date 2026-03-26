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
        /*github-runner = {
          vm_size = "Standard_D2ls_v5"
          spot = false
        }*/
        /*elk-stack = {
          vm_size = "Standard_E2bds_v5"
          spot = false
        }*/
        sonarqube = {
          vm_size = "Standard_D2ls_v5"
          spot = false
        }
        # artifactory = {
        #   vm_size = "Standard_D2ls_v5"
        #   spot = false
        # }
    } 
}