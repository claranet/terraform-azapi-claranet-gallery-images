locals {
  claranet_ubuntu_names             = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^ubu-claranet", x)) > 0]
  claranet_debian_names             = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^deb-claranet", x)) > 0]
  claranet_windows_datacenter_names = [for x in flatten(keys(data.azapi_resource_list.version)) : x if length(regexall("^windc-claranet", x)) > 0]

  claranet_ubuntu_versions = { for img in local.claranet_ubuntu_names : replace(reverse(split("-", img))[0], "_", ".") =>
    merge(
      { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
      {
        latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
      }
    )
  }

  claranet_debian_versions = { for img in local.claranet_debian_names : replace(reverse(split("-", img))[0], "_", ".") =>
    merge(
      { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
      {
        latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
      }
    )
  }

  claranet_windows_datacenter_versions = { for img in local.claranet_windows_datacenter_names : replace(reverse(split("-", img))[0], "_", ".") =>
    merge(
      { for v in jsondecode(data.azapi_resource_list.version[img].output).value : v.name => replace(lower(v.identifier.uniqueId), "communitygalleries", "communityGalleries") },
      {
        latest = format("/communityGalleries/${var.gallery_name}/images/%s/versions/latest", img)
      }
    )
  }
}
