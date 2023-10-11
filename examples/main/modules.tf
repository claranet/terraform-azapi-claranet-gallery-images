module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "claranet_gallery_images" {
  source  = "claranet/claranet-gallery-images/azapi"
  version = "x.x.x"

  azure_subscription_id = var.azure_subscription_id
  location_cli          = module.azure_region.location_cli
}
