# Terraform module documentation 

This documentation is generated using [terraform-docs](https://terraform-docs.io/user-guide/introduction) 
and contains helpful information about the module's usage.

---

## 📦 Providers used

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.40.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## 🧰 Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.40.0 |

## 🧩 Modules included

## Modules

No modules.

## 🏗️ Resources created

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [random_password.administrator_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## 🔧 Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | Name of the admin user for the postgresql flexible server | `string` | n/a | yes |
| <a name="input_administrator_password_length"></a> [administrator\_password\_length](#input\_administrator\_password\_length) | Name of the admin user for the postgresql flexible server | `number` | `32` | no |
| <a name="input_authentication"></a> [authentication](#input\_authentication) | Authentication configuration for the postgresql flexible server | <pre>object({<br/>    active_directory_auth_enabled = optional(bool, false)<br/>    password_auth_enabled         = optional(bool, true)<br/>    tenant_id                     = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | The backup retention days for the postgresql flexible server | `number` | `null` | no |
| <a name="input_configurations"></a> [configurations](#input\_configurations) | Additional configuration for the postgresql flexible server | <pre>list(object({<br/>    name  = string<br/>    value = any<br/>  }))</pre> | `[]` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | Databases for the postgresql flexible server | <pre>list(object({<br/>    name      = string<br/>    collation = optional(string, "en_US.utf8")<br/>    charset   = optional(string, "UTF8")<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_identity"></a> [enable\_identity](#input\_enable\_identity) | Determines whether managed identity is enabled on the postgresql flexible server | `bool` | `true` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Firewall rules for the postgresql flexible server | <pre>list(object({<br/>    name             = string<br/>    start_ip_address = string<br/>    end_ip_address   = string<br/>  }))</pre> | `[]` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Is Geo-Redundant backup enabled on the postgresql flexible server | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region where the postgresql flexible server will be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the postgresql flexible server | `string` | n/a | yes |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | Version of the postgresql flexible server | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Specifies whether the postgresql flexible server is publicly accessible | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the postgresql flexible server will be created | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU name of the postgresql flexible server | `string` | `null` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | The max storage allowed for the postgresql flexible server | `number` | `null` | no |
| <a name="input_storage_tier"></a> [storage\_tier](#input\_storage\_tier) | The name of storage performance tier for the postgresql flexible server | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources | `map(string)` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Specifies the availability zone in which the postgresql flexible server should be located | `string` | `null` | no |

## 📤 Outputs

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_password"></a> [administrator\_password](#output\_administrator\_password) | The administrator password of the postgresql flexible server |
| <a name="output_databases"></a> [databases](#output\_databases) | The databases of the postgresql flexible server |
| <a name="output_firewall_rules"></a> [firewall\_rules](#output\_firewall\_rules) | The firewall rules of the postgresql flexible server |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN of the resource group the postgresql flexible server is in |
| <a name="output_id"></a> [id](#output\_id) | The id of the postgresql flexible server |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity configuration of the postgresql flexible server |
| <a name="output_location"></a> [location](#output\_location) | The location of the postgresql flexible server |
| <a name="output_name"></a> [name](#output\_name) | The name of the postgresql flexible server |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group the postgresql flexible server is in |

---

## Example

```hcl
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
```

---

## 📚 Useful links

References to relevant documentations.

- [Terraform](https://developer.hashicorp.com/terraform/docs)
- [Terraform azurerm provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Microsoft Azure](https://portal.azure.com)
- [Microsoft Entra](https://entra.microsoft.com)
- [Azure DevOps](https://dev.azure.com/sudheera-jayasinghe)
- [Azure resource naming](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
- [Azure resource abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations) 