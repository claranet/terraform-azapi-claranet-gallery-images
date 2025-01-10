data "azapi_resource_list" "image" {
  type                   = "Microsoft.Compute/locations/communityGalleries/images@2023-07-01"
  parent_id              = "/subscriptions/${var.azure_subscription_id}/providers/Microsoft.Compute/locations/${var.location_cli}/communityGalleries/${var.gallery_name}"
  response_export_values = ["*"]
}

data "azapi_resource_list" "version" {
  for_each               = toset(data.azapi_resource_list.image.output.value[*].name)
  type                   = "Microsoft.Compute/locations/communityGalleries/images/versions@2023-07-01"
  parent_id              = "/subscriptions/${var.azure_subscription_id}/providers/Microsoft.Compute/locations/${var.location_cli}/communityGalleries/${var.gallery_name}/images/${each.value}"
  response_export_values = ["*"]
}
