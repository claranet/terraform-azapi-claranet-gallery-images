locals {
  image_names = {
    for name, pattern in {
      ubuntu  = "^ubu-claranet-gen2"
      debian  = "^deb-claranet-gen2"
      windows = "^windc-claranet-gen2"
    } :
    name => [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall(pattern, x)) > 0]
  }

  image_versions = {
    for name, images in local.image_names :
    name => { for img in images : replace(reverse(split("-", img))[0], "_", ".") =>
      merge(
        { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
        {
          latest = format("/communityGalleries/%s/images/%s/versions/latest", var.gallery_name, img)
        },
        {
          gen1 = merge(
            { for v in jsondecode(data.azapi_resource_list.version[replace(img, "-gen2", "")].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
            { latest = format("/communityGalleries/%s/images/%s/versions/latest", var.gallery_name, replace(img, "-gen2", "")) }
          )
        },
        {
          gen2 = merge(
            { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
            { latest = format("/communityGalleries/%s/images/%s/versions/latest", var.gallery_name, img) }
          )
        }
      )
    }
  }
}
