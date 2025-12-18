module "linux_virtual_machine_main" {
  source  = "app.terraform.io/Kochasoft-Test/linux-virtual-machine/azurerm"
  version = "1.2.7"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-VM-CEC-K8s"

  size                  = "Standard_D2ps_v6"
  network_interface_ids = [module.network_interface_main.id]

  admin_credentials = {
    key_vault_id = module.key_vault_main.id
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server-arm64"
    version   = "latest"
  }

  os_disk = {
    storage_account_type = "Premium_LRS"
    caching              = "None"
    disk_size_gb         = 64
  }

  cloud_init_config = {
    template_file_path = "cloud-init.tftpl"
    template_vars = {
      key_test = "value-test"
    }
  }

  secret_dependencies = [module.key_vault_main.data_access_dependency]

  tags = merge(local.default_tags, {
    Service = "Network"
    Purpose = "Virtual Security Group"
  })
}
