variable "token" {}

variable "vault_address" {
  default  = "http://vault.nareshdevops1218.online:8200"
}

variable "secret_engines" {
    default = {
        roboshop-dev = {
           description = "Secret engine for robshop dev"
        }  
        roboshop-infra = {
          description = "Secret engine for robshop dev"
        }     
    }
}

variable "secret_values" {
    default = {
      cart = {
          secret_engine = "roboshop-dev"
          secret_values = {
          foo = "test"
          }
        }
        ssh = {
          secret_engine = "roboshop-infra"
          secret_values = {
              username = "azuser"
              password = "devops@123456"
          }
        }
        frontend = {
          secret_engine = "roboshop-dev"
          secret_values = {
              catalogue_url = "http://catalogue-dev.nareshdevops1218.online:8080/"
              user_url = "http://user-dev.nareshdevops1218.online:8080/"
              cart_url = "http://cart-dev.nareshdevops1218.online:8080/"
              shipping_url = "http://shipping-dev.nareshdevops1218.online:8080/"
              payment_url = "http://payment-dev.nareshdevops1218.online:8080/"
          }
        }
    }
}