module "key_vault_main" {
  source  = "app.terraform.io/Kochasoft-Test/key-vault/azurerm"
  version = "1.2.5"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-KV-K8s"

  purge_protection_enabled        = true
  public_network_access_enabled   = true
  soft_delete_retention_days      = 7
  rbac_authorization_enabled      = false
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true

  network_acls = {
    bypass         = "AzureServices"
    default_action = "Allow"

    virtual_network_subnet_ids = [
      module.subnet_virtual_machines.id
    ]
  }

  tags = merge(local.default_tags, {
    Service = "Security"
    Purpose = "AKS Key Vault"
  })
}
