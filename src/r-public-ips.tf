module "public_ip_main" {
  source  = "app.terraform.io/Kochasoft-Test/public-ip/azurerm"
  version = "1.2.7"

  location            = module.resource_group_main.location
  resource_group_name = module.resource_group_main.name
  name                = "${local.default_name}-PIP-CEC-K8s"

  allocation_method = "Dynamic"
  domain_name_label = lower("${local.default_name}-CEC-K8s")

  tags = merge(local.default_tags, {
    Service = "Networking"
    Purpose = "Private Endpoint for Vault"
  })
}
