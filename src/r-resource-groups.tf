# Resource Group for the portal
module "resource_group_main" {
  source  = "app.terraform.io/Kochasoft-Test/resource-group/azurerm"
  version = "1.2.6"

  name     = "${local.default_name}-RGrp-CEC-K8s"
  location = var.location

  tags = local.default_tags
}
