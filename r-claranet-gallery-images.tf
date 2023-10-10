resource "azapi_resource_list" "claranet_gallery_images" {
  name = local.claranet_gallery_images_name

  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(local.default_tags, var.extra_tags)
}
