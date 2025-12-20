module "virtual_network_main" {
  source  = "app.terraform.io/Kochasoft-Test/virtual-network/azurerm"
  version = "1.2.8"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name

  name = "${local.default_name}-VNET-CEC-K8s"

  address_space = [var.virtual_network_address_space]

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Virtual Network"
  })
}

resource "azurerm_bastion_host" "main" {
  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-BST-CEC-K8s"

  sku                = "Developer"
  virtual_network_id = module.virtual_network_main.id

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Bastion Access"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedAt"],
      tags["CreatedBy"],
      tags["LastUpdatedAt"],
      tags["LastUpdatedBy"],
      tags["PreviouslyUpdatedAt"],
      tags["PreviouslyUpdatedBy"]
    ]
  }
}
