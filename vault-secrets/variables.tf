variable "secret_engines" {
    default = {
        roboshop-dev = {
           description = "Secret engine for robshop dev"
        }      
    }
}

variable "token" {}

variable "vault_address" {
  default  = "https://vault.nareshdevops1218.online:8200"
}