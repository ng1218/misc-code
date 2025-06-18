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
            REDIS_HOST="redis-dev.nareshdevops1218.online"
            CATALOGUE_HOST="catalogue-dev.nareshdevops1218.online"
            CATALOGUE_PORT="8080"
          }
        }
        catalogue = {
          secret_engine = "roboshop-dev"
          secret_values = {
            MONGO_URL="mongodb://mongodb-dev.nareshdevops1218.online:27017/catalogue"
            DB_HOST="mongodb-dev.nareshdevops1218.online"
            DB_TYPE="mongo"
            APP_GIT_URL="https://github.com/roboshop-devops-project-v3/catalogue"
            SCHEMA_FILE="db/master-data.js"
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
              CATALOGUE_HOST = "catalogue-dev.nareshdevops1218.online"
              CATALOGUE_PORT = 8080
              USER_HOST      = "user-dev.nareshdevops1218.online"
              USER_PORT      = 8080
              CART_HOST      = "cart-dev.nareshdevops1218.online"
              CART_PORT      = 8080
              SHIPPING_HOST  = "shipping-dev.nareshdevops1218.online"
              SHIPPING_PORT  = 8080
              PAYMENT_HOST   = "payment-dev.nareshdevops1218.online"
              PAYMENT_PORT   = 8080
          }
        }
        payment = {
          secret_engine = "roboshop-dev"
          secret_values = {
              CART_HOST="cart-dev.nareshdevops1218.online"
              CART_PORT="8080"
              USER_HOST="user-dev.nareshdevops1218.online"
              USER_PORT="8080"
              AMQP_HOST="rabbitmq-dev.nareshdevops1218.online"
              AMQP_USER="roboshop"
              AMQP_PASS="roboshop123"
          }
        }
        shipping = {
          secret_engine = "roboshop-dev"
          secret_values = {
              CART_ENDPOINT="cart-dev.nareshdevops1218.online:8080"
              DB_HOST="mysql-dev.nareshdevops1218.online"
              DB_TYPE="mysql"
              APP_GIT_URL="https://github.com/roboshop-devops-project-v3/shipping"
              DB_USER="root"
              DB_PASS="RoboShop@1"
              username="root"
              password="RoboShop@1"
          }
        }
        user = {
          secret_engine = "roboshop-dev"
          secret_values = {
              REDIS_URL="redis://redis-dev.nareshdevops1218.online:6379"
              MONGO_URL="mongodb://mongodb-dev.nareshdevops1218.online:27017/users"
          }
        }
        mysql = {
          secret_engine = "roboshop-dev"
          secret_values = {
              root_password="RoboShop@1"
          }
        }
       
    }
}