# Terraform module documentation 

This documentation is generated using [terraform-docs](https://terraform-docs.io/user-guide/introduction) 
and contains helpful information about the module's usage.

---

## 📦 Providers used

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.40.0 |

## 🧰 Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.40.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | ~> 2.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.7.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.1.0 |

## 🧩 Modules included

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_vault_main"></a> [key\_vault\_main](#module\_key\_vault\_main) | app.terraform.io/Kochasoft-Test/key-vault/azurerm | 1.2.8 |
| <a name="module_linux_virtual_machine_main"></a> [linux\_virtual\_machine\_main](#module\_linux\_virtual\_machine\_main) | app.terraform.io/Kochasoft-Test/linux-virtual-machine/azurerm | 1.2.8 |
| <a name="module_network_interface_main"></a> [network\_interface\_main](#module\_network\_interface\_main) | app.terraform.io/Kochasoft-Test/network-interface/azurerm | 1.2.8 |
| <a name="module_network_security_group_vault"></a> [network\_security\_group\_vault](#module\_network\_security\_group\_vault) | app.terraform.io/Kochasoft-Test/network-security-group/azurerm | 1.2.8 |
| <a name="module_network_security_group_virtual_machines"></a> [network\_security\_group\_virtual\_machines](#module\_network\_security\_group\_virtual\_machines) | app.terraform.io/Kochasoft-Test/network-security-group/azurerm | 1.2.8 |
| <a name="module_private_dns_zone_vault"></a> [private\_dns\_zone\_vault](#module\_private\_dns\_zone\_vault) | app.terraform.io/Kochasoft-Test/private-dns-zone/azurerm | 1.2.8 |
| <a name="module_private_endpoint_vault"></a> [private\_endpoint\_vault](#module\_private\_endpoint\_vault) | app.terraform.io/Kochasoft-Test/private-endpoint/azurerm | 1.2.8 |
| <a name="module_resource_group_main"></a> [resource\_group\_main](#module\_resource\_group\_main) | app.terraform.io/Kochasoft-Test/resource-group/azurerm | 1.2.8 |
| <a name="module_subnet_bastion"></a> [subnet\_bastion](#module\_subnet\_bastion) | app.terraform.io/Kochasoft-Test/subnet/azurerm | 1.2.8 |
| <a name="module_subnet_vault"></a> [subnet\_vault](#module\_subnet\_vault) | app.terraform.io/Kochasoft-Test/subnet/azurerm | 1.2.8 |
| <a name="module_subnet_virtual_machines"></a> [subnet\_virtual\_machines](#module\_subnet\_virtual\_machines) | app.terraform.io/Kochasoft-Test/subnet/azurerm | 1.2.8 |
| <a name="module_virtual_network_main"></a> [virtual\_network\_main](#module\_virtual\_network\_main) | app.terraform.io/Kochasoft-Test/virtual-network/azurerm | 1.2.8 |

## 🏗️ Resources created

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## 🔧 Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud"></a> [cloud](#input\_cloud) | Cloud provider abbreviation (e.g., AZR) | `string` | `"AZR"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name (e.g., DEV, PROD) | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region | `string` | `"Canada East"` | no |
| <a name="input_location_code"></a> [location\_code](#input\_location\_code) | Azure region code | `string` | `"cae1"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Resource owner | `string` | `"terraform"` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name (e.g., KSAI) | `string` | `"KSAI"` | no |
| <a name="input_virtual_machine_os_disk_storage_account_type"></a> [virtual\_machine\_os\_disk\_storage\_account\_type](#input\_virtual\_machine\_os\_disk\_storage\_account\_type) | Storage account type of the os disk of the virtual machine | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | Size of the virtual machine | `string` | `"Standard_F8s_v2"` | no |
| <a name="input_virtual_machine_source_image_offer"></a> [virtual\_machine\_source\_image\_offer](#input\_virtual\_machine\_source\_image\_offer) | Offer of the source image of the virtual machine | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_virtual_machine_source_image_sku"></a> [virtual\_machine\_source\_image\_sku](#input\_virtual\_machine\_source\_image\_sku) | SKU of the source image of the virtual machine | `string` | `"22_04-lts"` | no |
| <a name="input_virtual_network_address_space"></a> [virtual\_network\_address\_space](#input\_virtual\_network\_address\_space) | Address space for the virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_bastion_subnet_address_space"></a> [virtual\_network\_bastion\_subnet\_address\_space](#input\_virtual\_network\_bastion\_subnet\_address\_space) | Address space for the bastion subnet of the virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_vault_subnet_address_space"></a> [virtual\_network\_vault\_subnet\_address\_space](#input\_virtual\_network\_vault\_subnet\_address\_space) | Address space for the key vault subnet of the virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_virtual_machines_subnet_address_space"></a> [virtual\_network\_virtual\_machines\_subnet\_address\_space](#input\_virtual\_network\_virtual\_machines\_subnet\_address\_space) | Address space for the virtual machines subnet of the virtual network | `string` | n/a | yes |

## 📤 Outputs

## Outputs

No outputs.

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