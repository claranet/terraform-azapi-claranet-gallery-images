# Claranet Gallery Images
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/claranet-gallery-images/azapi/)

Azure module list Claranet images and their versions by OS name.

## Available OS versions

* claranet_windows_datacenter: 2019, 2022
* claranet_ubuntu: 20.04, 22.04
* claranet_debian: 11, 12

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "claranet_gallery_images" {
  source  = "claranet/claranet-gallery-images/azapi"
  version = "x.x.x"

  azure_subscription_id = var.azure_subscription_id
  location_cli          = module.azure_region.location_cli
}

module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "azure_network_vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = ["10.10.0.0/16"]
}

module "azure_network_subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = module.azure_network_vnet.virtual_network_name
  subnet_cidr_list     = ["10.10.10.0/24"]

  route_table_name = module.azure_network_route_table.route_table_name

  network_security_group_name = module.network_security_group.network_security_group_name
}

module "network_security_group" {
  source  = "claranet/nsg/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
}

module "azure_network_route_table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

resource "azurerm_availability_set" "vm_avset" {
  name                = "${var.stack}-${var.client_name}-${module.azure_region.location_short}-${var.environment}-as"
  location            = module.azure_region.location
  resource_group_name = module.rg.resource_group_name
  managed             = true
}

module "run" {
  source  = "claranet/run/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name

  monitoring_function_enabled = false
  vm_monitoring_enabled       = true
  backup_vm_enabled           = true
  update_center_enabled       = true

  update_center_periodic_assessment_enabled = true
  update_center_periodic_assessment_scopes  = [module.rg.resource_group_id]
  update_center_maintenance_configurations = [
    {
      configuration_name = "Donald"
      start_date_time    = "2021-08-21 04:00"
      recur_every        = "1Day"
    },
    {
      configuration_name = "Hammer"
      start_date_time    = "1900-01-01 03:00"
      recur_every        = "1Week"
    }
  ]

  recovery_vault_cross_region_restore_enabled = true
  vm_backup_daily_policy_retention            = 31
}

module "vm" {
  source  = "claranet/linux-vm/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name


  subnet_id      = module.azure_network_subnet.subnet_id
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
  resource_group_name = module.rg.resource_group_name


  subnet_id      = module.azure_network_subnet.subnet_id
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

  vm_image_id = module.claranet_gallery_images.claranet_ubuntu["22.04"].gen1.latest


}
```

## Providers

| Name | Version |
|------|---------|
| azapi | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource_list.image](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_list) | data source |
| [azapi_resource_list.version](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_subscription\_id | Azure subscription ID. | `string` | n/a | yes |
| gallery\_name | Name of the gallery to check. Default to Claranet's community gallery. | `string` | `"claranet-890239a9-edcc-42b3-82c2-de32ab229874"` | no |
| location\_cli | Location as Azure CLI format. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| claranet\_debian | Claranet's Debian golden images versions |
| claranet\_ubuntu | Claranet's Ubuntu golden images versions |
| claranet\_windows\_datacenter | Claranet's Windows golden images versions |
| images\_names\_list | List of images definitions names |
| images\_versions | List of images versions for each image definition |
<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: xxxx
