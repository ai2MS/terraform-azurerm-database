module "linux_virtual_machine_main" {
  source  = "app.terraform.io/Kochasoft-Test/linux-virtual-machine/azurerm"
  version = "1.2.7"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-VM-CEC-K8s"

  size                  = var.virtual_machine_size
  network_interface_ids = [module.network_interface_main.id]

  admin_credentials = {
    username     = "azadmin"
    key_vault_id = module.key_vault_main.id
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = var.virtual_machine_source_image_offer
    sku       = var.virtual_machine_source_image_sku
    version   = "latest"
  }

  os_disk = {
    storage_account_type = var.virtual_machine_os_disk_storage_account_type
    caching              = "None"
  }

  cloud_init_config = {
    template_file_path = "cloud-init.yml.tftpl"
    template_vars = {
      admin_username    = "azadmin"
      microk8s_channel  = "1.29/stable"
      ansible_version   = "13.1.0"
      azure_cli_version = "2.81.0"
    }
  }

  secret_dependencies = [module.key_vault_main.data_access_dependency]

  tags = merge(local.default_tags, {
    Service = "Compute"
    Purpose = "MicroK8s Server"
  })
}
