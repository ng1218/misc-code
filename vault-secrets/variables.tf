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
            CATALOGUE_HOST="catalogue"
            CATALOGUE_PORT="8080"
          }
        }
        catalogue = {
          secret_engine = "roboshop-dev"
          secret_values = {
            MONGO="true"
            MONGO_URL="mongodb://mongodb-dev.nareshdevops1218.online:27017/catalogue"
            DB_HOST="mongodb-dev.nareshdevops1218.online"
            DB_TYPE="mongo"
            APP_GIT_URL="https://github.com/roboshop-devops-project-v3/catalogue"
          }
        }
        ssh = {
          secret_engine = "roboshop-infra"
          secret_values = {
              username = "azuser"
              password = "devops@123456"
          }
        }
        github-runner = {
          ORG = "https://github.com/nareshgdevops"
          TOKEN = "BRBUG62D3JRR6Q6VAU273ZTJTKQ6M"
        }
        github-runner = {
          AZURE_SUBSCRIPTION_ID = "ddffee8a-e239-4aa1-b7e0-b88ff5a2f9aa"
          AZURE_CLIENT_ID = "8768f208-196c-4d2d-b46a-c5f21196749b"
          AZURE_SECRET = "qTZ8Q~z.0eer6FcAIpC_w77f6betViQa5bYN5c_R"
          AZURE_TENANT = "a9c314e0-1e86-4d94-a505-62afc24fe8b7"
        }

        frontend = {
          secret_engine = "roboshop-dev"
          secret_values = {
              CATALOGUE_HOST = "catalogue"
              CATALOGUE_PORT = "8080"
              USER_HOST      = "user"
              USER_PORT      = "8080"
              CART_HOST      = "cart"
              CART_PORT      = "8080"
              SHIPPING_HOST  = "shipping"
              SHIPPING_PORT  = "8080"
              PAYMENT_HOST   = "payment"
              PAYMENT_PORT   = "8080"
          }
        }
        payment = {
          secret_engine = "roboshop-dev"
          secret_values = {
              CART_HOST="cart"
              CART_PORT="8080"
              USER_HOST="user"
              USER_PORT="8080"
              AMQP_HOST="rabbitmq"
              AMQP_USER="roboshop"
              AMQP_PASS="roboshop123"
          }
        }
        shipping = {
          secret_engine = "roboshop-dev"
          secret_values = {
              CART_ENDPOINT="cart:8080"
              DB_HOST="mysql-dev.nareshdevops1218.online"
              DB_TYPE="mysql"
              APP_GIT_URL="https://github.com/roboshop-devops-project-v3/shipping"
              DB_USER="root"
              DB_PASS="RoboShop@1"
          }
        }
        user = {
          secret_engine = "roboshop-dev"
          secret_values = {
              MONGO="true"
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
      rabbitmq = {
          secret_engine = "roboshop-dev"
          secret_values = {
            USER_NAME="roboshop"
            PASSWORD="roboshop123"
          }
        }
    }
}