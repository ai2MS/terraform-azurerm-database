moved {
  from = module.public_ip_main.azurerm_public_ip.main
  to   = azurerm_public_ip.main
}

resource "azurerm_public_ip" "main" {
  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-PIP-CEC-K8s"

  allocation_method = "Static"
  domain_name_label = lower("${local.default_name}-CEC-K8s")

  tags = merge(local.default_tags, {
    Service = "Networking"
    Purpose = "Public IP for the Virtual Machine"
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
