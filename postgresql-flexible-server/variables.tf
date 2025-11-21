variable "location" {
  description = "Azure region where the postgresql flexible server will be created"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.location) > 0
    error_message = "location cannot be empty"
  }
}

variable "resource_group_name" {
  description = "Name of the resource group where the postgresql flexible server will be created"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "resource_group_name cannot be empty"
  }
}

variable "name" {
  description = "Name of the postgresql flexible server"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.name) > 0
    error_message = "name cannot be empty"
  }
}

variable "administrator_login" {
  description = "Name of the admin user for the postgresql flexible server"
  type        = string
}

variable "administrator_password_length" {
  description = "Name of the admin user for the postgresql flexible server"
  type        = number
  default     = 32
  nullable    = false

  validation {
    condition     = var.administrator_password_length >= 24
    error_message = "administrator_password_length must be above or equal to 24"
  }
}

variable "postgres_version" {
  description = "Version of the postgresql flexible server"
  type        = string
  nullable    = true
  default     = null
}

variable "sku_name" {
  description = "SKU name of the postgresql flexible server"
  type        = string
  nullable    = true
  default     = null
}

variable "storage_mb" {
  description = "The max storage allowed for the postgresql flexible server"
  type        = number
  nullable    = true
  default     = null
}

variable "storage_tier" {
  description = "The name of storage performance tier for the postgresql flexible server"
  type        = string
  nullable    = true
  default     = null
}

variable "backup_retention_days" {
  description = "The backup retention days for the postgresql flexible server"
  type        = number
  nullable    = true
  default     = null
}

variable "geo_redundant_backup_enabled" {
  description = "Is Geo-Redundant backup enabled on the postgresql flexible server"
  type        = bool
  default     = false
}

variable "authentication" {
  description = "Authentication configuration for the postgresql flexible server"
  type = object({
    active_directory_auth_enabled = optional(bool, false)
    password_auth_enabled         = optional(bool, true)
    tenant_id                     = optional(string)
  })
  nullable = true
  default  = null
}

variable "public_network_access_enabled" {
  description = "Specifies whether the postgresql flexible server is publicly accessible"
  type        = bool
  default     = true
}

variable "delegated_subnet_id" {
  description = "The ID of the subnet to which the postgresql flexible server will be delegated"
  type        = string
  nullable    = true
  default     = null
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone to link with the postgresql flexible server"
  type        = string
  nullable    = true
  default     = null
}

variable "zone" {
  description = "Specifies the availability zone in which the postgresql flexible server should be located"
  type        = string
  nullable    = true
  default     = null
}

variable "enable_identity" {
  description = "Determines whether managed identity is enabled on the postgresql flexible server"
  type        = bool
  nullable    = false
  default     = true
}

variable "configurations" {
  description = "Additional configuration for the postgresql flexible server"
  type = list(object({
    name  = string
    value = any
  }))
  nullable = false
  default  = []
}

variable "firewall_rules" {
  description = "Firewall rules for the postgresql flexible server"
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  nullable = false
  default  = []
}

variable "databases" {
  description = "Databases for the postgresql flexible server"
  type = list(object({
    name      = string
    collation = optional(string, "en_US.utf8")
    charset   = optional(string, "UTF8")
  }))
  nullable = false
  default  = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = null
}
