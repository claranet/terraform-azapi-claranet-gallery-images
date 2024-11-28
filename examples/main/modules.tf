module "claranet_gallery_images" {
  source  = "claranet/claranet-gallery-images/azapi"
  version = "x.x.x"

  azure_subscription_id = var.azure_subscription_id
  location_cli          = module.azure_region.location_cli
}

module "vm" {
  source  = "claranet/linux-vm/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name

  subnet_id      = module.subnet.id
  vm_size        = "Standard_B2s"
  admin_username = var.vm_administrator_login
  ssh_public_key = var.ssh_public_key

  diagnostics_storage_account_name      = module.run.logs_storage_account_name
  azure_monitor_data_collection_rule_id = module.run.data_collection_rule_id

  # Set to null to deactivate backup
  backup_policy_id = module.run.vm_backup_policy_id

  patch_mode                    = "AutomaticByPlatform"
  maintenance_configuration_ids = [module.run.maintenance_configurations["Donald"].id, module.run.maintenance_configurations["Hammer"].id]

  availability_set_id = azurerm_availability_set.vm_avset.id
  # or use Availability Zone
  # zone_id = 1

  vm_image_id = module.claranet_gallery_images.claranet_ubuntu["22.04"].latest
}

module "vm_gen1" {
  source  = "claranet/linux-vm/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name

  subnet_id      = module.subnet.id
  vm_size        = "Standard_B2s"
  admin_username = var.vm_administrator_login
  ssh_public_key = var.ssh_public_key

  diagnostics_storage_account_name      = module.run.logs_storage_account_name
  azure_monitor_data_collection_rule_id = module.run.data_collection_rule_id

  # Set to null to deactivate backup
  backup_policy_id = module.run.vm_backup_policy_id

  patch_mode                    = "AutomaticByPlatform"
  maintenance_configuration_ids = [module.run.maintenance_configurations["Donald"].id, module.run.maintenance_configurations["Hammer"].id]

  # availability_set_id = azurerm_availability_set.vm_avset.id
  # or use Availability Zone
  zone_id = 1

  vm_image_id = module.claranet_gallery_images.claranet_ubuntu["22.04"].gen1.latest
}
