module "linux_virtual_machine_main" {
  source  = "app.terraform.io/Kochasoft-Test/linux-virtual-machine/azurerm"
  version = "1.2.8"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-VM-CEC-K8s"

  size                  = var.virtual_machine_size
  network_interface_ids = [module.network_interface_main.id]

  admin_credentials = {
    username     = var.virtual_machine_admin_username
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
      admin_username    = var.virtual_machine_admin_username
      microk8s_channel  = "1.29/stable"
      ansible_version   = "10.7.0"
      azure_cli_version = "2.81.0"

      # Git repository and deployment configuration
      git_repo_url              = var.git_repo_url
      git_repo_branch           = var.git_repo_branch
      git_repo_clone_path       = var.git_repo_clone_path
      deployment_script_path    = var.deployment_script_path
      git_personal_access_token = var.git_personal_access_token

      # GHCR Credentials
      env_github_username = var.env_github_username
      env_github_email    = var.env_github_email

      # Infrastructure Secrets
      env_postgres_password = var.env_postgres_password
      env_redis_password    = var.env_redis_password
      env_qdrant_api_key    = var.env_qdrant_api_key

      # AIOPS-DYNATRACE-KAFKA Secrets
      env_dynatrace_api_token = var.env_dynatrace_api_token

      # AIOPS-MCPSVR-SNOW Secrets
      env_servicenow_instance_url  = var.env_servicenow_instance_url
      env_servicenow_username      = var.env_servicenow_username
      env_servicenow_password      = var.env_servicenow_password
      env_servicenow_api_key       = var.env_servicenow_api_key
      env_servicenow_client_id     = var.env_servicenow_client_id
      env_servicenow_client_secret = var.env_servicenow_client_secret

      # AIOPS-INTELLIPORT Secrets
      env_openai_api_key       = var.env_openai_api_key
      env_azure_openai_api_key = var.env_azure_openai_api_key
      env_jira_api_key         = var.env_jira_api_key
      env_github_api_key       = var.env_github_api_key
      env_encryption_key       = var.env_encryption_key
    }
  }

  secret_dependencies = [module.key_vault_main.data_access_dependency]

  tags = merge(local.default_tags, {
    Service = "Compute"
    Purpose = "MicroK8s Server"
  })
}
