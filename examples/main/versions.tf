terraform {
  required_version = ">= 1.8"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azapi" {
  subscription_id = var.azure_subscription_id
}
