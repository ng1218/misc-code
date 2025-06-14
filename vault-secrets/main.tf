resource "vault_mount" "secrets" {
    for_each    = var.secret_engines
    path        = each.key
    type        = "kv"
    options     = { version = "2" }
    description = each.value["description"]
}

resource "vault_kv_secret_v2" "secretvalues" {
    depends_on          = [ vault_mount.secrets ]
    for_each            = var.secret_values 
    mount               = each.value["secret_engine"]
    name                = each.key
    delete_all_versions = false
    data_json           = jsonencode(each.value["secret_values"])
}

# data "vault_kv_secret_v2" "example" {
#   mount = vault_mount.kvv2.path
#   name  = vault_kv_secret_v2.example.name
# }