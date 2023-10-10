output "claranet_gallery_images" {
  description = "Claranet Gallery Images output object"
  value       = azapi_resource_list.claranet_gallery_images
}

output "id" {
  description = "Claranet Gallery Images ID"
  value       = azapi_resource_list.claranet_gallery_images.id
}

output "name" {
  description = "Claranet Gallery Images name"
  value       = azapi_resource_list.claranet_gallery_images.name
}

output "identity_principal_id" {
  description = "Claranet Gallery Images system identity principal ID"
  value       = try(azapi_resource_list.claranet_gallery_images.identity[0].principal_id, null)
}
