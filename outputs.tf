output "images_names_list" {
  value       = flatten([keys(data.azapi_resource_list.version)])
  description = "List of images definitions names."
}

output "images_versions" {
  value       = local.image_versions
  description = "List of images versions for each image definition."
}

output "claranet_ubuntu" {
  value       = local.image_versions["ubuntu"]
  description = "Claranet's Ubuntu golden images versions."
}

output "claranet_debian" {
  value       = local.image_versions["debian"]
  description = "Claranet's Debian golden images versions."
}

output "claranet_windows_datacenter" {
  value       = local.image_versions["windows"]
  description = "Claranet's Windows golden images versions."
}
