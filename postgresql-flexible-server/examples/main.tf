terraform {
  required_version = "~> 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "example_basic" {
  source = "../../postgresql-flexible-server"

  location            = "centralus"
  resource_group_name = "rg-test"
  name                = "vnet-test"

  administrator_login = "postgres_admin"
}
