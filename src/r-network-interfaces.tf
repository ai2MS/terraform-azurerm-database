module "network_interface_main" {
  source  = "app.terraform.io/Kochasoft-Test/network-interface/azurerm"
  version = "1.2.5"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-NIC-CEC-K8s"

  ip_configurations = [
    {
      name                 = "${local.default_name}-IpCf-CEC-K8s"
      primary              = true
      subnet_id            = module.subnet_virtual_machines.id
      public_ip_address_id = module.public_ip_main.id
    }
  ]

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Virtual Security Group"
  })
}

