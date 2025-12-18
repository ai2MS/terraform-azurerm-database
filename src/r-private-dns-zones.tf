module "private_dns_zone_vault" {
  source  = "app.terraform.io/Kochasoft-Test/private-dns-zone/azurerm"
  version = "1.2.5"

  resource_group_name = module.resource_group_main.name
  name                = "privatelink.vaultcore.azure.net"

  virtual_network_links = [
    {
      name               = "${lower(local.default_name)}-vnl-cec-vault"
      virtual_network_id = module.virtual_network_main.id
      resolution_policy  = "Default"
    }
  ]

  tags = merge(local.default_tags, {
    Service = "Networking"
    Purpose = "Private DNS Zone for Vault"
  })
}
