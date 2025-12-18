module "network_security_group_virtual_machines" {
  source  = "app.terraform.io/Kochasoft-Test/network-security-group/azurerm"
  version = "1.2.4"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name

  name = "${local.default_name}-NSGp-CEC-K8s-VIRTUAL-MACHINES"

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Virtual Security Group"
  })
}

module "network_security_group_vault" {
  source  = "app.terraform.io/Kochasoft-Test/network-security-group/azurerm"
  version = "1.2.4"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name

  name = "${local.default_name}-NSGp-CEC-K8s-VAULT"

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Virtual Security Group"
  })
}
