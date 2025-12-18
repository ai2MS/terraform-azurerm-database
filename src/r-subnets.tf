module "subnet_virtual_machines" {
  source  = "app.terraform.io/Kochasoft-Test/subnet/azurerm"
  version = "1.2.7"

  resource_group_name  = module.resource_group_main.name
  virtual_network_name = module.virtual_network_main.name

  name = lower("${local.default_name}-SNET-VIRTUAL-MACHINES")

  address_prefixes = [var.virtual_network_virtual_machines_subnet_address_space]

  enable_network_security_group_association = true
  network_security_group_id                 = module.network_security_group_virtual_machines.id
}

module "subnet_vault" {
  source  = "app.terraform.io/Kochasoft-Test/subnet/azurerm"
  version = "1.2.7"

  resource_group_name  = module.resource_group_main.name
  virtual_network_name = module.virtual_network_main.name

  name = lower("${local.default_name}-SNET-VAULT")

  address_prefixes  = [var.virtual_network_vault_subnet_address_space]
  service_endpoints = ["Microsoft.KeyVault"]

  enable_network_security_group_association = true
  network_security_group_id                 = module.network_security_group_vault.id
}
