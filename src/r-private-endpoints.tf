module "private_endpoint_vault" {
  source  = "app.terraform.io/Kochasoft-Test/private-endpoint/azurerm"
  version = "1.2.6"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${lower(local.default_name)}-pep-cec-vault"

  subnet_id = module.subnet_vault.id

  private_service_connection = {
    name                           = "${lower(local.default_name)}-psc-cec-vault"
    private_connection_resource_id = module.key_vault_main.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  private_dns_zone_group = {
    name                 = module.key_vault_main.name
    private_dns_zone_ids = [module.private_dns_zone_vault.id]
  }

  tags = merge(local.default_tags, {
    Service = "Networking"
    Purpose = "Private Endpoint for Vault"
  })
}
