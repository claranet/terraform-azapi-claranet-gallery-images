variable "azure_region" {
  description = "Azure region to use."
  type        = string
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "vm_administrator_login" {
  description = "Administrator login for Virtual Machine"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public key to authorize on Virtual Machine"
  type        = string
}
