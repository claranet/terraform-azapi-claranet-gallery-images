output "images_names_list" {
  description = "List of images definitions names."
  value       = flatten([keys(data.azapi_resource_list.version)])
}

output "images_versions" {
  description = "List of images versions for each image definition."
  value       = local.image_versions
}

output "claranet_ubuntu" {
  description = "Claranet's Ubuntu golden images versions."
  value       = local.image_versions["ubuntu"]
}

output "claranet_debian" {
  description = "Claranet's Debian golden images versions."
  value       = local.image_versions["debian"]
}

output "claranet_windows_datacenter" {
  description = "Claranet's Windows golden images versions."
  value       = local.image_versions["windows"]
}
