output "images_names_list" {
  value       = flatten([keys(data.azapi_resource_list.version)])
  description = "List of images definitions names"
}

output "images_versions" {
  value = { for img, val in data.azapi_resource_list.version : img =>
    merge({
      for v in jsondecode(val.output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries")
      },
      {
        latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
    })
  }
  description = "List of images versions for each image definition"
}
