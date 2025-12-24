# Azure Configuration Variables
variable "project" {
  description = "Project name (e.g., KSAI)"
  type        = string
  default     = "KSAI"
}

variable "cloud" {
  description = "Cloud provider abbreviation (e.g., AZR)"
  type        = string
  default     = "AZR"
}

variable "env" {
  description = "Environment name (e.g., DEV, PROD)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada East"
}

variable "location_code" {
  description = "Azure region code"
  type        = string
  default     = "cae1"
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "terraform"
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = string
  nullable    = false
}

variable "virtual_network_virtual_machines_subnet_address_space" {
  description = "Address space for the virtual machines subnet of the virtual network"
  type        = string
  nullable    = false
}

variable "virtual_network_vault_subnet_address_space" {
  description = "Address space for the key vault subnet of the virtual network"
  type        = string
  nullable    = false
}

variable "virtual_network_bastion_subnet_address_space" {
  description = "Address space for the bastion subnet of the virtual network"
  type        = string
  nullable    = false
}

variable "virtual_machine_admin_username" {
  description = "Admin username of the virtual machine"
  type        = string
  nullable    = false
  default     = "azadmin"
}

variable "virtual_machine_size" {
  description = "Size of the virtual machine"
  type        = string
  nullable    = false
  default     = "Standard_F8s_v2"
}

variable "virtual_machine_source_image_offer" {
  description = "Offer of the source image of the virtual machine"
  type        = string
  nullable    = false
  default     = "0001-com-ubuntu-server-jammy"
}

variable "virtual_machine_source_image_sku" {
  description = "SKU of the source image of the virtual machine"
  type        = string
  nullable    = false
  default     = "22_04-lts"
}

variable "virtual_machine_os_disk_storage_account_type" {
  description = "Storage account type of the os disk of the virtual machine"
  type        = string
  nullable    = false
  default     = "StandardSSD_LRS"
}

# Git Repository and Deployment Variables
variable "git_repo_url" {
  description = "Git repository URL to clone"
  type        = string
  nullable    = false
  default     = "https://github.com/ai2MS/AIOps_GitOps.git"
}

variable "git_repo_branch" {
  description = "Git repository branch to checkout"
  type        = string
  default     = "main"
}

variable "git_repo_clone_path" {
  description = "Path where the git repository will be cloned"
  type        = string
  default     = "/opt/app"
}

variable "deployment_script_path" {
  description = "Path to the shell script to run after cloning (relative to repo root)"
  type        = string
  default     = "deploy-dev.sh"
}

variable "git_personal_access_token" {
  description = "GitHub Personal Access Token (PAT) for private repository authentication"
  type        = string
  sensitive   = true
  default     = ""
}

# Environment Variables for .env file

# GHCR Credentials
variable "env_github_username" {
  description = "GitHub username for GHCR authentication"
  type        = string
  default     = ""
}

variable "env_github_email" {
  description = "GitHub email for GHCR authentication"
  type        = string
  default     = ""
}

# Infrastructure Secrets
variable "env_postgres_password" {
  description = "PostgreSQL database password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_redis_password" {
  description = "Redis password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_qdrant_api_key" {
  description = "Qdrant API key"
  type        = string
  sensitive   = true
  default     = ""
}

# AIOPS-DYNATRACE-KAFKA Secrets
variable "env_dynatrace_api_token" {
  description = "Dynatrace API token"
  type        = string
  sensitive   = true
  default     = ""
}

# AIOPS-MCPSVR-SNOW Secrets
variable "env_servicenow_instance_url" {
  description = "ServiceNow instance URL"
  type        = string
  default     = ""
}

variable "env_servicenow_username" {
  description = "ServiceNow username"
  type        = string
  default     = ""
}

variable "env_servicenow_password" {
  description = "ServiceNow password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_servicenow_api_key" {
  description = "ServiceNow API key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_servicenow_client_id" {
  description = "ServiceNow OAuth client ID"
  type        = string
  default     = ""
}

variable "env_servicenow_client_secret" {
  description = "ServiceNow OAuth client secret"
  type        = string
  sensitive   = true
  default     = ""
}

# AIOPS-INTELLIPORT Secrets
variable "env_openai_api_key" {
  description = "OpenAI API key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_azure_openai_api_key" {
  description = "Azure OpenAI API key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_jira_api_key" {
  description = "Jira API key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_github_api_key" {
  description = "GitHub API key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "env_encryption_key" {
  description = "Encryption key for secure data"
  type        = string
  sensitive   = true
  default     = ""
}
