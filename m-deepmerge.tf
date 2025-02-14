module "deepmerge_debian" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"
  # insert the 1 required variable here
  maps = [
    local.image_versions["debian"],
    local.image_versions["debian-sec"]
  ]
}

module "deepmerge_ubuntu" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"
  # insert the 1 required variable here
  maps = [
    local.image_versions["ubuntu"],
    local.image_versions["ubuntu-sec"]
  ]
}

module "deepmerge_windows" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"
  # insert the 1 required variable here
  maps = [
    local.image_versions["windows"],
    local.image_versions["windows-sec"]
  ]
}
