terraform {
  required_version = "~> 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
resource "random_password" "administrator_password" {
  length  = var.administrator_password_length
  special = true
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server
resource "azurerm_postgresql_flexible_server" "main" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.name

  administrator_login    = var.administrator_login
  administrator_password = random_password.administrator_password.result

  version  = var.postgres_version
  sku_name = var.sku_name

  storage_mb   = var.storage_mb
  storage_tier = var.storage_tier

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  public_network_access_enabled = var.public_network_access_enabled

  zone = var.zone

  dynamic "authentication" {
    for_each = var.authentication != null ? ["enabled"] : []

    content {
      password_auth_enabled         = var.authentication.password_auth_enabled
      active_directory_auth_enabled = var.authentication.active_directory_auth_enabled
      tenant_id                     = var.authentication.tenant_id
    }
  }

  dynamic "identity" {
    for_each = var.enable_identity ? ["enabled"] : []

    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration
resource "azurerm_postgresql_flexible_server_configuration" "main" {
  for_each = { for config in var.configurations : config.name => config }

  server_id = azurerm_postgresql_flexible_server.main.id

  name  = each.value.name
  value = each.value.value
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule
resource "azurerm_postgresql_flexible_server_firewall_rule" "main" {
  for_each = { for rule in var.firewall_rules : rule.name => rule }

  server_id = azurerm_postgresql_flexible_server.main.id

  name             = each.value.name
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database
resource "azurerm_postgresql_flexible_server_database" "main" {
  for_each = { for database in var.databases : database.name => database }

  server_id = azurerm_postgresql_flexible_server.main.id

  name      = each.value.name
  collation = each.value.collation
  charset   = each.value.charset
}
