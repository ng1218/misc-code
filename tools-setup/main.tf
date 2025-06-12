module "vault" {
  for_each              = var.tools 
  source                = "./vault-vm"
  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = var.location
  vm_size               = each.value["vm_size"]
}

output "name" {
  value = module.vault
}