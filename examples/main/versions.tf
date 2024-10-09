terraform {
  required_version = ">= 1.3"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.36"
    }
  }
}

provider "azapi" {
  subscription_id = var.azure_subscription_id
}
