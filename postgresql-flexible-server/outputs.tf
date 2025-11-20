output "id" {
  description = "The id of the postgresql flexible server"
  value       = azurerm_postgresql_flexible_server.main.id
}

output "name" {
  description = "The name of the postgresql flexible server"
  value       = azurerm_postgresql_flexible_server.main.name
}

output "location" {
  description = "The location of the postgresql flexible server"
  value       = azurerm_postgresql_flexible_server.main.location
}

output "resource_group_name" {
  description = "The name of the resource group the postgresql flexible server is in"
  value       = azurerm_postgresql_flexible_server.main.resource_group_name
}

output "fqdn" {
  description = "FQDN of the resource group the postgresql flexible server is in"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "administrator_password" {
  description = "The administrator password of the postgresql flexible server"
  value       = random_password.administrator_password.result
  sensitive   = true
}

output "identity" {
  description = "The identity configuration of the postgresql flexible server"
  value       = try(azurerm_postgresql_flexible_server.main.identity, null)
}

output "firewall_rules" {
  description = "The firewall rules of the postgresql flexible server"
  value       = { for rule in azurerm_postgresql_flexible_server_firewall_rule.main : rule.name => rule }
}

output "databases" {
  description = "The databases of the postgresql flexible server"
  value       = { for database in azurerm_postgresql_flexible_server_database.main : database.name => database }
}
