module "key_vault_main" {
  source  = "app.terraform.io/Kochasoft-Test/key-vault/azurerm"
  version = "1.2.8"

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

  access_policies = [
    for object_id in ["3465e769-6600-41c6-893f-85a12cac7cb3", "b38de99c-d5b5-4f6b-89f4-b5b2c5ad95b0"] : {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = object_id

      certificate_permissions = [
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ]

      key_permissions = [
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
      ]

      secret_permissions = [
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ]

      storage_permissions = [
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
      ]
    }
  ]

  tags = merge(local.default_tags, {
    Service = "Security"
    Purpose = "K8s Key Vault"
  })
}
