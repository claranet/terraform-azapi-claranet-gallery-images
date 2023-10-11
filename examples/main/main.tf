terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "Azure/azapi"
      version = "~> 1.0"
    }
  }
}
