locals {
  # claranet_ubuntu_names             = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^ubu-claranet", x)) > 0]
  # claranet_debian_names             = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^deb-claranet", x)) > 0]
  # claranet_windows_datacenter_names = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^windc-claranet", x)) > 0]

  image_names = {
    for name, pattern in {
      ubuntu  = "^ubu-claranet"
      debian  = "^deb-claranet"
      windows = "^windc-claranet"
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
        }
      )
    }
  }

  # claranet_ubuntu_versions = { for img in local.claranet_ubuntu_names : replace(reverse(split("-", img))[0], "_", ".") =>
  #   merge(
  #     { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
  #     {
  #       latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
  #     }
  #   )
  # }

  # claranet_debian_versions = { for img in local.claranet_debian_names : replace(reverse(split("-", img))[0], "_", ".") =>
  #   merge(
  #     { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
  #     {
  #       latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
  #     }
  #   )
  # }

  # claranet_windows_datacenter_versions = { for img in local.claranet_windows_datacenter_names : replace(reverse(split("-", img))[0], "_", ".") =>
  #   merge(
  #     { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
  #     {
  #       latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
  #     }
  #   )
  # }
}
